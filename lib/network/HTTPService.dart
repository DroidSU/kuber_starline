import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kuber_starline/constants/api_constants.dart';

class HTTPService {
  Future<http.Response> registerUser({
    String email,
    String mobileNumber,
    String name,
  }) async {
    http.Response response =
        await http.post(Uri.encodeFull(APIConstants.ENDPOINT_REGISTER),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'X-ApiKey': '8f92cb92-c007-448b-b488-1650492dfd00',
              'Authorization': 'Basic S3ViZXJTYXR0YTpLdWJlclNhdHRhQDEyMzQ1',
              'A-Token': ''
            },
            body: jsonEncode({
              "Name": name,
              "Email": email,
              "Mobile": mobileNumber,
            }));

    print(response.body);
    return response;
  }
}
