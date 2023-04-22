
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:old_goose/models/SearchResponse.dart';

import '../models/BookingRequest.dart';
import '../models/ResponseData.dart';
import '../models/SolutionResponse.dart';
import 'g2rail_api_client.dart';

Future<SearchResponse> searchSolution() async {
  var asyncCode;

  var client  =  GrailApiClient(httpClient: http.Client(), baseUrl: "http://alpha.api.g2rail.com", apiKey: "fa656e6b99d64f309d72d6a8e7284953", secret: "9a52b1f7-7c96-4305-8569-1016a55048bc");

  //Search
  var asyncKey = await client.getSolutions("ST_D1297OY2", "ST_LV5236GZ", "2023-04-25", "15:00", 1, 0);
  asyncCode = SolutionResponse.fromJson(asyncKey);
  var rawSearchResponse = await client.getAsyncResult(asyncCode.async);
  var searchResponse = ResponseData.fromJson(rawSearchResponse);

  //Booking
  var bookingCode = searchResponse.data?[1].solutions?[0].sections?[0].offers?[0].services?[0].bookingCode;
  var bookingRequest = BookingRequest.fromJson(jsonDecode('{"passengers":[{"last_name":"cheng","first_name":"kyo","birthdate":"1984-12-25","passport":"666666","email":"kyo@ti.com","phone":"+886053111222","gender":"male"}],"sections":["${bookingCode!}"],"seat_reserved":true,"memo":"partner_order_id"}'));
  var onlineOrderAsync = await client.onlineOrder(bookingRequest);
  asyncCode = SolutionResponse.fromJson(onlineOrderAsync);
  var rawBookingResponse = await client.getAsyncResult(asyncCode.async);
  var onlineOrderId = rawBookingResponse['data']['id'].toString();

  //Confirm
  var onlineConfirmation = await client.onlineConfirmations(onlineOrderId);
  asyncCode = SolutionResponse.fromJson(onlineConfirmation);
  var rawOnlineConfirmation = await client.getAsyncResult(asyncCode.async);

  //Double confirm
  debugPrint(rawOnlineConfirmation.toString());
  debugPrint(rawOnlineConfirmation['data']['confirm_again']);

  //Get ticket file link
  var onlineTicket = await client.onlineTickets(onlineOrderId);
  print(onlineTicket);

  return SearchResponse.fromJson(rawBookingResponse);
}