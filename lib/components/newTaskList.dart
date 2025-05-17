import 'package:flutter/material.dart';
import 'package:taskmanager/utility/utility.dart';

class newTaskList extends StatefulWidget {
  const newTaskList({super.key});

  @override
  State<newTaskList> createState() => _newTaskListState();
}

class _newTaskListState extends State<newTaskList> {

  


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Welcome to New Task List"),
    );
  }
}