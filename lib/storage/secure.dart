
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  // ignore: prefer_typing_uninitialized_variables
  static var instancia;

  static getInstance() {
    instancia ??= SecureStorage();
    return instancia;
  }

  writeSecureData(String key, String? value) async {
    await storage.write(key: key, value: value);
  }

  readSecureData(String key) async {
    try {
      String value = await storage.read(key: key) ?? 'No data found!';
      return value;  
    } catch (e) {
      return '';
    }
    
  }

  deleteSecureData(String key) async {
    await storage.delete(key: key);
  }
}