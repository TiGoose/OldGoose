import 'dart:async';
import 'dart:convert';
import 'dart:io';


import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import '../models/BookingRequest.dart';

class SearchCriteria {
  String from = '';
  String to = '';
  String date = '';
  String time=  '';
  int adult = 0;
  int child = 0;

  SearchCriteria(this.from, this.to, this.date, this.time, this.adult, this.child);

  String toQuery() {
    return "from=$from&to=$to&date=$date&time=$time&adult=$adult&child=$child";
  }

  Map<String, dynamic> toMap() {
    return {
      "from": from,
      "to": to,
      "date": date,
      "time": time,
      "adult": adult,
      "child": child
    };
  }
}

class GrailProxy {
  String baseUrl = "http://alpha.api.g2rail.com";
  String apiKey = "fa656e6b99d64f309d72d6a8e7284953";
  String secret = "9a52b1f7-7c96-4305-8569-1016a55048bc";
  final http.Client httpClient = http.Client();

  Map<String, String> getAuthorizationHeaders(Map<String, dynamic> params) {
    var timestamp = DateTime.now();
    params['t'] = (timestamp.millisecondsSinceEpoch ~/ 1000).toString();
    params['api_key'] = apiKey;

    var sortedKeys = params.keys.toList()
      ..sort((a, b) => a.compareTo(b));
    StringBuffer buffer = StringBuffer("");
    for (var key in sortedKeys) {
      if (params[key] is List || params[key] is Map) continue;
      buffer.write('$key=${params[key].toString()}');
    }
    buffer.write(secret);

    String hashString = buffer.toString();
    String authorization = md5.convert(utf8.encode(hashString)).toString();

    return {
      "From": apiKey,
      "Content-Type": 'application/json',
      "Authorization": authorization,
      "Date": HttpDate.format(timestamp),
      "Api-Locale": "zh-TW"
    };
  }

  Future<dynamic> getSolutions(from, to, date, time, adult, child) async {
    final criteria = SearchCriteria(from, to, date, time, adult, child);
    final solutionUrl = '$baseUrl/api/v2/online_solutions/?${criteria.toQuery()}';
    final solutionResponse = await httpClient.get(Uri.parse(solutionUrl), headers: getAuthorizationHeaders(criteria.toMap()));
    final solutionsJson = jsonDecode(solutionResponse.body);
    return solutionsJson;
  }

  Future<Map<String, dynamic>> onlineOrder(BookingRequest bookingRequest) async {
    final onlineOrderURL = '$baseUrl/api/v2/online_orders';
    final bookResult = await httpClient.post(Uri.parse(onlineOrderURL),headers: getAuthorizationHeaders(bookingRequest.toJson()),body: jsonEncode(bookingRequest.toJson()));
    final bookingResponse = jsonDecode(utf8.decode(bookResult.bodyBytes));
    return bookingResponse;
  }

  Future<Map<String, dynamic>> onlineConfirmations(String onlineOrderId) async {
    final onlineConfirmationsURL = '$baseUrl/api/v2/online_orders/$onlineOrderId/online_confirmations';
    final confirmationsResult = await httpClient.post(Uri.parse(onlineConfirmationsURL),headers: getAuthorizationHeaders({"online_order_id": onlineOrderId}),body: jsonEncode({"online_order_id": onlineOrderId}));
    final confirmationsResponse = jsonDecode(utf8.decode(confirmationsResult.bodyBytes));
    return confirmationsResponse;
  }

  Future<List<dynamic>> onlineTickets(String onlineOrderId) async {
    final onlineTicketsURL = '$baseUrl/api/v2/online_orders/$onlineOrderId/online_tickets';
    final onlineTicketsResult = await httpClient.get(Uri.parse(onlineTicketsURL),headers: getAuthorizationHeaders({"online_order_id": onlineOrderId}));
    final onlineTicketsResponse = jsonDecode(utf8.decode(onlineTicketsResult.bodyBytes));
    return onlineTicketsResponse;
  }

  Future<Map<String, dynamic>> getAsyncResult(String asyncKey, {int retryCounts = 10}) async {
    if (retryCounts == 0) {
      return {
        "data": {
          "description": "Async Result not ready",
          "code": "async_not_ready"
        }
      };
    }
    final asyncResultURl = '$baseUrl/api/v2/async_results/$asyncKey';
    final asyncResult = await httpClient.get(Uri.parse(asyncResultURl),
        headers: getAuthorizationHeaders({"async_key": asyncKey}));

    var rtn = jsonDecode(utf8.decode(asyncResult.bodyBytes));

    if (rtn is! List && rtn["code"].toString().contains("async_not_ready")) {
      print('Remain retry:$retryCounts');
      await Future.delayed(const Duration(seconds: 3));
      return await getAsyncResult(asyncKey, retryCounts: retryCounts -= 1);
    } else {
      return {"data": jsonDecode(utf8.decode(asyncResult.bodyBytes))};
    }
  }
}