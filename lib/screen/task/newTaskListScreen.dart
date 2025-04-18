import 'package:flutter/material.dart';

class newTaskListScreen extends StatefulWidget {
  const newTaskListScreen({super.key});

  @override
  State<newTaskListScreen> createState() => _newTaskListScreenState();
}

class _newTaskListScreenState extends State<newTaskListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Task"),
      ),
      body: Center(
        child: Text("This is the new task list screen."),
      ),
    );
  }
}