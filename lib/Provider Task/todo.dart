// tasks done by 20sw116
import 'package:flutter/material.dart';
import 'package:madlabtasks_20sw116/Provider%20Task/todoProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (context) => TodoProvider(),
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Todo App with Provider'),
            backgroundColor: Colors.pink[300],
          ),
          body: TodoListScreen(),
        ),
      ),
    );
  }
}

class TodoListScreen extends StatelessWidget {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: _textController,
            decoration: InputDecoration(
                labelText: ("Task"),
                hintText: "Add a new Task",
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.black), // Border color when focused
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0))),
          ),
        ),

        // by using consumer widget, we dont have to specify context.0f<todoList>.watch().
        Consumer<TodoProvider>(
          builder: (context, todoList, child) {
            return Expanded(
              child: ListView.builder(
                itemCount: todoList.todos.length,
                itemBuilder: (context, index) {
                  final todo = todoList.todos[index];
                  return ListTile(
                    title: Text(todo.task),
                    leading: Checkbox(
                      value: todo.isDone,
                      onChanged: (_) {
                        todoList.toggleTodoStatus(index);
                      },
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        todoList.removeTodo(index);
                      },
                    ),
                  );
                },
              ),
            );
          },
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
          onPressed: () {
            if (_textController.text.isNotEmpty) {
              Provider.of<TodoProvider>(context, listen: false)
                  .addTodo(_textController.text);
              _textController.clear();
            }
          },
          child: const Text('Add Task'),
        ),
      ],
    );
  }
}
