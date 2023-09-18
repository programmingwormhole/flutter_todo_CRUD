class Todo {
  String title;
  String description;
  bool isDone;
  DateTime todoDate;
  int priorety;

  Todo({
    required this.title,
    required this.todoDate,
    required this.isDone,
    required this.description,
    required this.priorety,
  });
}
