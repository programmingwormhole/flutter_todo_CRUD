import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/controllers/todo_controller.dart';
import 'package:todo_app/utils/colors.dart';
import 'package:todo_app/views/AddNewTodoScreen/add_todo_screen.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TodoController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'Todo App',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert_rounded,
                color: Colors.white,
              )),
        ],
      ),
      body: Obx(() => ListView.builder(
            itemCount: controller.todosList.length,
            itemBuilder: (context, index) {
              final data = controller.todosList[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: ListTile(
                  onLongPress: () {
                    controller.triggerDelete(index);
                  },
                  onTap: () {
                    Get.to(
                      AddTodoScreen(
                        type: 'update',
                        data: data,
                        index: index,
                      ),
                    );
                  },
                  leading: Container(
                    height: 100,
                    width: 80,
                    decoration: BoxDecoration(
                      color: data.priorety == 1
                          ? AppColors.primaryColor
                          : Colors.red,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        data.todoDate.toLocal().toString().split(' ')[0],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    data.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration:
                          data.isDone ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  subtitle: Text(
                    data.description,
                    style: TextStyle(
                      color: Colors.black.withOpacity(.5),
                    ),
                  ),
                  trailing: Checkbox(
                      activeColor: AppColors.primaryColor,
                      shape: const CircleBorder(),
                      value: data.isDone,
                      onChanged: (value) {
                        controller.triggerCheckBox(index);
                      }),
                ),
              );
            },
          )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        shape: const CircleBorder(),
        onPressed: () {
          Get.to(() => const AddTodoScreen());
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
