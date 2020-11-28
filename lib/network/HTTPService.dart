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

    print('Register response: ${response.body}');
    return response;
  }

  Future<http.Response> loginUser({
    String mobileNumber,
    String password,
  }) async {
    http.Response response =
        await http.post(Uri.encodeFull(APIConstants.ENDPOINT_LOGIN),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'X-ApiKey': '8f92cb92-c007-448b-b488-1650492dfd00',
              'Authorization': 'Basic S3ViZXJTYXR0YTpLdWJlclNhdHRhQDEyMzQ1',
              'A-Token': ''
            },
            body: jsonEncode({
              "Mobile": mobileNumber,
              "password": password,
            }));

    print('Login response: ${response.body}');
    return response;
  }

  Future<http.Response> fetchAllGames(String authToken) async {
    http.Response response = await http.post(
      Uri.encodeFull(APIConstants.ENDPOINT_FETCH_ALL_GAMES),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'X-ApiKey': '8f92cb92-c007-448b-b488-1650492dfd00',
        'Authorization': 'Basic S3ViZXJTYXR0YTpLdWJlclNhdHRhQDEyMzQ1',
        'A-Token': authToken
      },
    );

    print('All games response: ${response.body}');
    return response;
  }

  Future<http.Response> changePassword(
      String authToken, String password) async {
    http.Response response =
        await http.post(Uri.encodeFull(APIConstants.ENDPOINT_CHANGE_PASSWORD),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'X-ApiKey': '8f92cb92-c007-448b-b488-1650492dfd00',
              'Authorization': 'Basic S3ViZXJTYXR0YTpLdWJlclNhdHRhQDEyMzQ1',
              'A-Token': authToken
            },
            body: jsonEncode({
              "password": password,
            }));

    print('Change Password Response: ${response.body}');
    return response;
  }

  Future<http.Response> getWalletDetails(String authToken) async {
    http.Response response = await http.get(
      Uri.encodeFull(APIConstants.ENDPOINT_GET_WALLET_DETAILS),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'X-ApiKey': '8f92cb92-c007-448b-b488-1650492dfd00',
        'Authorization': 'Basic S3ViZXJTYXR0YTpLdWJlclNhdHRhQDEyMzQ1',
        'A-Token': authToken
      },
    );

    print('Wallet details: ${response.body}');
    return response;
  }
}
