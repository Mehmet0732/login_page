class Todo {
  //Todo sınıfını tanımlıyoruz
  final String id;
  final String title;
  bool completed;

  Todo({
    required this.id,
    required this.title,
    this.completed = false,
  });
}
