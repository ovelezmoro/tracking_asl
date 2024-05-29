import 'dart:convert';
import 'package:TrackingASL/constants/constants.dart';
import 'package:TrackingASL/data/token.dart';
import 'package:http/http.dart' as http;

class TokenApi {
  Future<Token?> login({String? username, String? password}) async {
    var client = http.Client();
    var uri = Uri.parse(Constants.baseURL + '/login?username=$username&password=$password');
    var response = await client.post(uri);
    if (response.statusCode == 200) {
      return fromJson(const Utf8Decoder().convert(response.bodyBytes));
    }
    return null;
  }
}