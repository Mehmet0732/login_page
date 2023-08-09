import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:login_page_getx_examp/pages/user_controller.dart';

class LoginPage extends StatelessWidget {
  //Bu denetleyiciler, kullanıcının girdiği e-posta ve şifre değerlerini almak ve işlemek için kullanılır.
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  bool success = await _loginUser();
                  if (success) {
                    Get.offAllNamed('/secondpage'); //Sayfa yönlendirme
                  } else {
                    Get.snackbar('Error',
                        'Login failed'); //Hata mesajı için gösteriyoruz
                  }
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _loginUser() async {
    //Kullanıcının giriş yapmasını sağlayan bir asenkron fonksiyondur.

    return true;
  }
}
