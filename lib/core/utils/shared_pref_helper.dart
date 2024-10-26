
//import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

/*/// save & get & Delete Token
const FlutterSecureStorage secureStorage = FlutterSecureStorage();
// Function to store the token securely
Future<void> saveToken(String token) async {
  await secureStorage.write(key: 'auth_token', value: token);
}

// Function to get the token from secure storage
Future<String?> getToken() async {
  return await secureStorage.read(key: 'auth_token');
}

// Function to clear the token (optional, if you need to log out the user)
Future<void> clearToken() async {
  await secureStorage.delete(key: 'auth_token');
}*/

// Get Or Create Uuid with Shared Preferences
Future<String> getOrCreateUuid() async {
  final prefs = await SharedPreferences.getInstance();
  String? uuid = prefs.getString('unique_id');
  if (uuid == null) {
    uuid = const Uuid().v4();
    await prefs.setString('unique_id', uuid);
  }
  return uuid;
}
