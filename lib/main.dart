import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:login_page_getx_examp/pages/user_controller.dart';
import 'pages/login_page.dart';
import 'pages/second_page.dart';
import 'pages/third_page.dart';
import 'pages/fourth_page.dart';

//Bu bir denemedir.
void main() async {
  //Asenkron çalışabilecek bir main fonksiyonu tanımlıyoruz. Uygulamayı kapatınca kaldığı yerden devam etmesi amacıyla
  await GetStorage.init(); //Getstorage başlatıyoruz.

  String initialRoute =
      '/login'; //Uygulamanın hangi sayfa ile başlayacağını belirtiyoruz.
  final _userController = Get.put(
      UserController()); //bir nesne oluşturuldu. GETX ile bağladık. Oturum durumunu kontrol etmek ve yönlendirmek için kullandık.
  bool isLoggedIn = await _userController
      .checkLoginStatus(); //kullanıcının giriş yapmış olup olmadığını kontrol eder. Eğer giriş yapılmışsa, isLoggedIn değişkeni true olarak ayarlanır.
  if (isLoggedIn) {
    initialRoute =
        '/secondpage'; //kullanıcı giriş yapmışsa, uygulama "secondpage" ile başlayacak.
  }

  runApp(MyApp(initialRoute));
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  MyApp(this.initialRoute);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //GetX kullanım için ana bileşen olarak ayarlıyoruz.
      title: 'Login App with GETX', //Projemizin başlığı
      theme: ThemeData(
        //Temanın genel görünüm ayarları burada yapılır
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner:
          false, //Debug yazısını göstermemek için kullandık
      initialRoute: initialRoute,
      getPages: [
        //Sayfa yönlendirmeleeri için kullanıyoruz.
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/secondpage', page: () => SecondPage()),
        // GetPage(name: '/thirdpage', page: () => ThirdPage()),
        //GetPage(name: '/fourthpage', page: () => FourthPage()),
      ],
    );
  }
}
