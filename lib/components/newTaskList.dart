import 'package:flutter/material.dart';
import 'package:taskmanager/api/apiClient.dart';
import 'package:taskmanager/utility/utility.dart';

class newTaskList extends StatefulWidget {
  const newTaskList({super.key});

  @override
  State<newTaskList> createState() => _newTaskListState();
}

class _newTaskListState extends State<newTaskList> {

  List TaskItems = [];
  bool Loading = false;

  // পুরো ফেইজ যখন শো হবে তখন প্রথমে initState() ফাংশন কল হবে।
  void initState() {
    super.initState();
    CallData();
  }

  CallData() async{
    setState(() { Loading = true; });
   var data = await TaskListRequest("New");
   setState(() {
     Loading = false;
     TaskItems = data;
   });
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(TaskItems.toString()),
    );
  }
}