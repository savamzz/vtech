import 'package:get/get.dart';
import 'package:vtech/src/feature/todo/controller/todo_controller.dart';

class TodoBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => TodoController());
  }

}