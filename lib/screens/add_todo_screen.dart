import 'package:flutter/material.dart';
import '../services/todo_service.dart';
import '../models/task_model.dart';

class AddTodoScreen extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  final TodoService _todoService = TodoService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Todo'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _bodyController,
              decoration: InputDecoration(labelText: 'Body'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final todo = Todo(
                  id: '', // The ID will be set by the server
                  title: _titleController.text,
                  body: _bodyController.text,
                  completed: false,
                );
                try {
                  await _todoService.addTodo(todo);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Todo added successfully')),
                  );
                  Navigator.pop(context);
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Failed to add todo: ${e.toString()}')),
                  );
                }
              },
              child: Text('Add Todo'),
            ),
          ],
        ),
      ),
    );
  }
}