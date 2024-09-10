import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vtech/src/constant/app_edge_insets.dart';
import 'package:vtech/src/feature/todo/controller/todo_controller.dart';

class TodoView extends GetView<TodoController> {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List')
      ),
      body: Padding(
        padding: AppEdgeInsets.instance.primary,
        child: Column(
          children: [
            TextField(
              controller: controller.textController,
              decoration: InputDecoration(
                labelText: 'Add or Edit Todo',
                suffixIcon: IconButton(
                  icon: Icon(controller.editingIndex.value == null ? Icons.add : Icons.update),
                  onPressed: () => controller.addValueTodo(),
                ),
              ),
              onSubmitted: (_) =>controller.submitValueTodo(),
            ),
           const  SizedBox(height: 10),
            TextField(
              onChanged: controller.setFilterText,
              decoration: const InputDecoration(
                labelText: 'Filter Todos'
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Obx(() {
                final todos = controller.filteredTodos;
                return ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    final todo = todos[index];
                    return ListTile(
                      title: Text(
                        todo.text,
                        style: TextStyle(
                          decoration: todo.completed
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(
                              todo.completed
                                  ? Icons.check_box
                                  : Icons.check_box_outline_blank,
                            ),
                            onPressed: () => controller.toggleCompletion(index),
                          ),
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () => controller.editTodo(todo),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => controller.removeTodo(index),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }),
            ),
            Obx(()=>controller.filteredTodos.isEmpty ? const Text('No result. Create a new one instead') :const SizedBox.shrink(),),
          ],
        ),
      ),
    );
  }
}
