import 'package:get/get.dart';
import 'package:todo_app/models/todo_model.dart';

class TodoController extends GetxController {
  final todosList = <Todo>[].obs;

  todoAdd(
    String title,
    DateTime todoDate,
    String description,
      int priorety,
  ) {
    todosList.add(Todo(
      title: title,
      todoDate: todoDate,
      isDone: false,
      description: description,
      priorety: priorety,
    ));
  }

}
