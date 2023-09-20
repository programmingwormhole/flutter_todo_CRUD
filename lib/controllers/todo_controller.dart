import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/models/todo_model.dart';

class TodoController extends GetxController {
  final todosList = <Todo>[].obs;

  List students = ['1', '2', '3'];

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

  triggerCheckBox(int index) {
    todosList[index].isDone = !todosList[index].isDone;
    todosList.refresh();
  }

  triggerDelete(int index) {
    todosList.removeAt(index);
    Get.snackbar(
      'Deleted',
      'No ${index + 1} data has been removed!',
      backgroundColor: Colors.white,
    );
  }

  updateData(
    String title,
    DateTime todoDate,
    String description,
    int priorety,
    bool isDone,
    int index,
  ) {
    todosList[index].title = title;
    todosList[index].description = description;
    todosList[index].todoDate = todoDate;
    todosList[index].priorety = priorety;
    todosList[index].isDone = isDone;
    todosList.refresh();
  }
}
