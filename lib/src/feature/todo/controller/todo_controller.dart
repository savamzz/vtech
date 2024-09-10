import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vtech/src/feature/todo/model/todo_item.dart';

class TodoController extends GetxController {

  //Define Variable to use on UI
  RxList<TodoItem> todos = <TodoItem>[].obs;
  RxList<TodoItem> filteredTodos = <TodoItem>[].obs;
  RxString filterText = RxString('');
  RxnInt editingIndex = RxnInt();

  //Define TextEditingController
  final TextEditingController textController = TextEditingController();

  //Function to add value to todo
  void addValueTodo(){
    if (editingIndex.value == null) {
      _addTodo(textController.text);
    } else {
      _updateTodo(editingIndex.value!, textController.text);
      editingIndex.value = null;
    }
    textController.clear();
  }


  //Function to submit value to todo
  void submitValueTodo(){
    if (editingIndex.value == null) {
      _addTodo(textController.text);
    } else {
      _updateTodo(editingIndex.value!, textController.text);
      editingIndex.value = null;
    }
    textController.clear();
  }

  //Function to edit item from todo
  void editTodo(TodoItem todo){
    editingIndex.value = todos.indexOf(todo);
    textController.text = todo.text;
  }

  //Function to filter item from todo
  void filterTodos() {
    if (filterText.value.isEmpty) {
      filteredTodos.assignAll(todos);
    } else {
      filteredTodos.assignAll(
          todos.where((todo) => todo.text.contains(filterText.value))
      );
    }
  }

  //Function to add item from todo
  void _addTodo(String text) {
    if (text.trim().isEmpty) {
      Fluttertoast.showToast(msg: 'Item cannot be empty');
      return;
    }

    if (todos.any((todo) => todo.text == text)) {
      Fluttertoast.showToast(msg: 'Item already exists');
      return;
    }

    todos.add(TodoItem(text: text, completed: false));
    filterTodos();
  }

  //Function to remove item from todo
  void removeTodo(int index) {
    todos.removeAt(index);
    filterTodos();
  }

  //Function to do update item from todo
  void _updateTodo(int index, String newText) {
    if (newText.trim().isEmpty) {
      Fluttertoast.showToast(msg: 'Item cannot be empty');
      return;
    }

    if (todos.any((todo) => todo.text == newText)) {
      Fluttertoast.showToast(msg: 'Item already exists');
      return;
    }

    todos[index].text = newText;
    filterTodos();
  }

  //Function to toggle item
  void toggleCompletion(int index) {
    todos[index].completed = !todos[index].completed;
    filterTodos();
  }

  //Function to set filter text
  void setFilterText(String text) {
    filterText.value = text;
    filterTodos();
  }
}

