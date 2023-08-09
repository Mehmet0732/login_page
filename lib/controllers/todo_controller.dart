import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../models/todo.dart';

// GetX kontrolörünü tanımlar.
//Bu kontrolör, yapılacaklar listesini
// yönetmek ve işlemek için kullanılır.

class TodoController extends GetxController {
  var todos = <Todo>[].obs;

  void addTodo(String title) {
    final newTodo = Todo(id: Uuid().v4(), title: title);
    todos.add(newTodo);
  }

  void toggleTodoStatus(String id) {
    final todo = todos.firstWhere((todo) => todo.id == id);
    todo.completed = !todo.completed;
  }

  void removeTodo(String id) {
    todos.removeWhere((todo) => todo.id == id);
  }
}
