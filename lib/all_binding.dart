import 'package:get/get.dart';
import 'package:todo_app/controllers/todo_controller.dart';

class AllBindings extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => TodoController());
  }

}