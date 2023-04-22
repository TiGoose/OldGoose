
import 'package:http/http.dart' as http;
import 'package:old_goose/models/SearchResponse.dart';

import '../models/SolutionResponse.dart';
import 'g2rail_api_client.dart';

Future<SearchResponse> SearchSolution() async {
  var client  =  GrailApiClient(httpClient: http.Client(), baseUrl: "http://alpha.api.g2rail.com", apiKey: "fa656e6b99d64f309d72d6a8e7284953", secret: "9a52b1f7-7c96-4305-8569-1016a55048bc");
  var asyncKey = await client.getSolutions("ST_D1297OY2", "ST_LV5236GZ", "2023-04-25", "15:00", 1, 0);
  var asyncCode = SolutionResponse.fromJson(asyncKey);
  var result = await client.getAsyncResult(asyncCode.async);
  print(result);
  return SearchResponse.fromJson(result);
}