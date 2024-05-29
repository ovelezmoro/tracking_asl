import 'dart:convert';
import 'package:TrackingASL/constants/constants.dart';
import 'package:TrackingASL/data/user.dart';
import 'package:TrackingASL/storage/secure.dart';
import 'package:http/http.dart' as http;

class UserApi {

  Future<User?> user() async {
    SecureStorage storage = SecureStorage.getInstance();
    var token = await storage.readSecureData('jwt');

    var client = http.Client();
    var uri = Uri.parse(Constants.baseURL + '/user');
    var response = await client.get(uri, headers: { 'Authorization' : 'Bearer $token' });

    if (response.statusCode == 200) {
      return fromJson(const Utf8Decoder().convert(response.bodyBytes));
    }
    return null;
  }

}