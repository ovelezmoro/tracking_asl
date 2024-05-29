import 'dart:convert';
import 'package:TrackingASL/constants/constants.dart';
import 'package:TrackingASL/data/decunica.dart';
import 'package:TrackingASL/dto/filtro.dart';
import 'package:TrackingASL/storage/secure.dart';
import 'package:http/http.dart' as http;

class DecunicaApi {
  Future<List<Decunica>?> getAll(String longtail, Filtro filtro) async {
    SecureStorage storage = SecureStorage.getInstance();
    var token = await storage.readSecureData('jwt');

    var client = http.Client();
    var uri = Uri.parse('${Constants.baseURL}/decunica?desde=2024-01-01&hasta=2024-04-22');

    var response = await client.get(uri, headers: { "Authorization" : "Bearer $token" });
    if (response.statusCode == 200) {
      return fromJson(const Utf8Decoder().convert(response.bodyBytes));
    }
    return null;
  }
}