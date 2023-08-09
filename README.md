# login_page

# login_page_getx_examp

A new Flutter module project.

## Getting Started

For help getting started with Flutter development, view the online
[documentation](https://flutter.dev/).

For instructions integrating Flutter modules to your existing applications,
see the [add-to-app documentation](https://flutter.dev/docs/development/add-to-app).



# GetX kullanımı için

pubspec.yaml klasörüne get: ^4.3.8 eklenmesi gerekiyor. 

# Getx kullanım için Dikkat

.android>app>build.gradle klasörü içerisinde minSdkVersion 18 olarak ayarlanması gerekmektedir. En düşük

# Kodun sayfa, sınıf düzenleri için bir pages sayfası oluşturuyoruz ve kodlarımızı bölüyoruz.

Bu sayfa da user_controller.dart isimli bir sayfa oluşturuyoruz. Bu sayfada http istekleri ve oturum istekleri kontrol ediliyor.

# pubspec.yaml klasörüne eklenmesi gereken kütüphaneler
  http: ^0.13.3 HTTP istekleri için kullanıyoruz.
  get: ^4.3.8  Getx kullanımı için ihtiyaç duymaktayız
  flutter_secure_storage: ^5.0.3 secure stroge için kullanıyoruz.
  get_storage: ^2.0.3  kaldığı sayfadan devam etme özelliği için kullanıyoruz
  uuid: ^3.0.4 

# pages klasörü içerisinde diğer sayfaları oluşturuyoruz. 
Pages sayfa içerisinde; 
Fourth ve third sadece bottom navigotr içerisinde gösterim olması için kullanıldı bir etkinliği bulunmamaktadır. 

login_page sayfası giriş sayfası olarak tasarlanmıştır. 
second_page sayfasında todolist gösterimi yapılmaktadır. 
user_controller.dart sayfasında http oturum istekleri yapılmaktadır. 

# todo list 

Second sayfada görüntüleniyor herhangi bir ön yüz çalışması yapılmamıştır.
