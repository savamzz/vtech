import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtech/src/feature/todo/view/todo_view.dart';
import 'package:vtech/src/route/app_page.dart';
import 'package:vtech/src/route/app_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo List',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      initialRoute: AppRoute.todo,
      getPages: AppPage.pages,
    );
  }
}

