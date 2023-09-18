import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/utils/colors.dart';
import 'package:todo_app/views/AddNewTodoScreen/add_todo_screen.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: ListView.builder(
        itemCount: 15,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: ListTile(
              leading: Container(
                height: 100,
                width: 80,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Center(
                  child: Text(
                    '10:20\nAM',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
              ),
              title: const Text(
                'Meeting With Team',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'Something here',
                style: TextStyle(
                  color: Colors.black.withOpacity(.5),
                ),
              ),
              trailing: Checkbox(
                  activeColor: AppColors.primaryColor,
                  shape: const CircleBorder(),
                  value: true,
                  onChanged: (value) {}),
            ),
          );
        },
      ),
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
