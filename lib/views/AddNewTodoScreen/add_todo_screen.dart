import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/controllers/todo_controller.dart';
import 'package:todo_app/models/todo_model.dart';

import '../../utils/colors.dart';

class AddTodoScreen extends StatefulWidget {
  final String? type;
  final Todo? data;
  final int? index;

  const AddTodoScreen({
    super.key,
    this.type,
    this.data,
    this.index,
  });

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  int selectedValue = 0;
  DateTime selectedTime = DateTime.now();
  final controller = Get.put(TodoController());
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  void selectDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedTime,
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    );
    if (picked != selectedTime) {
      setState(() {
        selectedTime = picked!;
      });
    }
  }

  void updateData() {
    selectedValue = widget.data!.priorety;
    selectedTime = widget.data!.todoDate;
    _titleController.text = widget.data!.title;
    _descriptionController.text = widget.data!.description;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    widget.type == 'update' ? updateData() : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          widget.type == 'update' ? 'Update' : 'Add New',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Title',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Add Title',
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Description',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              TextFormField(
                controller: _descriptionController,
                minLines: 4,
                maxLines: 4,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Write Description',
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Date',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              InkWell(
                onTap: () {
                  selectDate();
                },
                child: TextFormField(
                  enabled: false,
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.calculate_outlined),
                    border: const OutlineInputBorder(),
                    hintText: selectedTime == DateTime.now()
                        ? 'Select Date'
                        : selectedTime.toLocal().toString().split(' ')[0],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Priorety',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text('Normal'),
                      value: 1,
                      groupValue: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value!;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text('Urgent'),
                      value: 2,
                      groupValue: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  widget.type == 'update'
                      ? controller.updateData(
                          _titleController.text,
                          selectedTime,
                          _descriptionController.text,
                          selectedValue,
                          controller.todosList[widget.index!].isDone,
                          widget.index!,
                        )
                      : controller.todoAdd(
                          _titleController.text,
                          selectedTime,
                          _descriptionController.text,
                          selectedValue,
                        );
                  Get.back();
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                    ),
                    child: Center(
                      child: Text(
                        widget.type == 'update' ? 'UPDATE TASK' : 'ADD TASK',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
