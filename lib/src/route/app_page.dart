import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtech/src/feature/todo/binding/todo_binding.dart';
import 'package:vtech/src/feature/todo/view/todo_view.dart';
import 'package:vtech/src/route/app_route.dart';

abstract class AppPage {
  static final pages = [
    GetPage(
      name: AppRoute.todo,
      page: () => const TodoView(),
      binding: TodoBinding(),
      preventDuplicates: true,
    ),
  ];
}
