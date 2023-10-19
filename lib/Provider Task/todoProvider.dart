// todo provider class
import 'package:flutter/material.dart';
import 'package:madlabtasks_20sw116/Provider%20Task/todoModel.dart';

class TodoProvider extends ChangeNotifier {
  final List<Todo> todos = [];

  List<Todo> get todo => todos;

  void addTodo(String task) {
    todos.add(Todo(task: task));
    notifyListeners();
  }

  void toggleTodoStatus(int index) {
    todos[index].isDone = !todos[index].isDone;
    notifyListeners();
  }

  void removeTodo(int index) {
    todos.removeAt(index);
    notifyListeners();
  }
}
