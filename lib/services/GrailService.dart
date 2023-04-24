
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:old_goose/models/SearchResponse.dart';
import 'package:old_goose/services/MailService.dart';

import '../models/BookingRequest.dart';
import '../models/ResponseData.dart';
import '../models/SolutionResponse.dart';
import 'GrailProxy.dart';

class GrailService {
  late final client;

  GrailService() {
    client = GrailProxy();
  }

  Future<ResponseData> search(String from, String to, String date, String time, int adult, int child) async {
    print('==search ticket==');
    var asyncKey = await client.getSolutions(from, to, date, time, adult, child);
    var asyncCode = SolutionResponse.fromJson(asyncKey);
    var rawSearchResponse = await client.getAsyncResult(asyncCode.async);
    print(rawSearchResponse);
    return ResponseData.fromJson(rawSearchResponse);
  }

  Future<String> booking(String bookingCode, String address, int adultCount, int childCount, String orderId) async {
    print('==booking ticket==');
    var bookingRequest = BookingRequest.fromJson(jsonDecode('{"passengers":[{"last_name":"cheng","first_name":"kyo","birthdate":"1984-12-25","passport":"666666","email":"$address","phone":"+886053111222","gender":"male"}],"sections":["${bookingCode!}"],"seat_reserved":true,"memo":"partner_order_id"}'));
    var onlineOrderAsync = await client.onlineOrder(bookingRequest);
    var asyncCode = SolutionResponse.fromJson(onlineOrderAsync);
    var rawBookingResponse = await client.getAsyncResult(asyncCode.async);
    print(rawBookingResponse);

    var mailService = MailService(address);
    var onlineOrderId = rawBookingResponse['data']['id'].toString();
    await mailService.sendBookingMail(orderId, adultCount, childCount);

    return onlineOrderId;
  }

  Future<dynamic> confirm(String onlineOrderId) async {
    print('==confirm ticket==');
    var onlineConfirmation = await client.onlineConfirmations(onlineOrderId);
    var asyncCode2 = SolutionResponse.fromJson(onlineConfirmation);
    var rawOnlineConfirmation = await client.getAsyncResult(asyncCode2.async);

    //TODO: Double confirm if needed
    print(rawOnlineConfirmation);
    print(rawOnlineConfirmation['data']['confirm_again']);

    return rawOnlineConfirmation;
  }

  Future<dynamic> getTicket(String onlineOrderId) async {
    print('==get ticket==');
    var onlineTicket = await client.onlineTickets(onlineOrderId);
    print(onlineTicket);

    return onlineTicket;
  }
}