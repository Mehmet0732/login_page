import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserController extends GetxController {
  final storage = FlutterSecureStorage();
  var isLoggedIn = false.obs;

  Future<void> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('https://reqres.in/api/login'),
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final token = data['token'];
      await storage.write(key: 'user_token', value: token);
      isLoggedIn.value = true;
    } else {
      isLoggedIn.value = false;
    }
  }

  Future<bool> checkLoginStatus() async {
    final token = await storage.read(key: 'user_token');
    return token != null;
  }

  Future<void> logout() async {
    await storage.delete(key: 'user_token');
    isLoggedIn.value = false;
  }
}
