import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_page_getx_examp/pages/user_controller.dart';
import 'package:login_page_getx_examp/pages/third_page.dart'; // Üçüncü sayfa import edildi
import 'package:login_page_getx_examp/controllers/todo_controller.dart'; //Yapılacaklar listesi işlemlerini yönetmek için TodoController sınıfını içeri aktarıyorsunuz
import 'package:login_page_getx_examp/models/todo.dart'; //Yapılacaklar listesi için Todo modelini içeri aktarıyorsunuz

class SecondPage extends StatelessWidget {
  final UserController _userController =
      Get.find<UserController>(); //kullanıcının oturumu kapatma işlemleri
  final TodoController _todoController =
      Get.put(TodoController()); //yapılacaklar listesini yönetiyoruz.
  final TextEditingController _todoControllerField =
      TextEditingController(); //Yapılacaklar listesi için eklemelerde kullanılacak metin alanının denetleyicisini oluşturuyorsunuz.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // Başlangıçta seçili olan sekme
        onTap: (index) {
          if (index == 0) {
            // Ana sayfaya gitmek için yapılacak işlemler
          } else if (index == 1) {
            GetPage(
                name: '/secondpage',
                page: () => SecondPage()); // Üçüncü sayfayı aç
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Ana Sayfa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Üçüncü Sayfa',
          ),
        ],
      ),
      appBar: AppBar(
        title: Text('Todo List'),
        actions: [
          IconButton(
            onPressed: () {
              _userController.logout();
              Get.offAllNamed('/login');
            },
            icon: Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _todoControllerField,
                    decoration: InputDecoration(labelText: 'Todo Title'),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _todoController.addTodo(_todoControllerField.text);
                    _todoControllerField.clear();
                  },
                  child: Text('Ekle'),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: _todoController.todos.length,
                itemBuilder: (context, index) {
                  final todo = _todoController.todos[index];
                  return ListTile(
                    title: Text(todo.title),
                    leading: Checkbox(
                      value: todo.completed,
                      onChanged: (_) {
                        _todoController.toggleTodoStatus(todo.id);
                      },
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        _todoController.removeTodo(todo.id);
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
