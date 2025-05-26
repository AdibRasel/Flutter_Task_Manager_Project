import 'package:flutter/material.dart';

import '../api/apiClient.dart';

class completedTaskList extends StatefulWidget {
  const completedTaskList({super.key});

  @override
  State<completedTaskList> createState() => _completedTaskListState();
}

class _completedTaskListState extends State<completedTaskList> {




  List TaskItems = [];
  bool Loading = false;

  // পুরো ফেইজ যখন শো হবে তখন প্রথমে initState() ফাংশন কল হবে।
  void initState() {
    super.initState();
    CallData();
  }

  CallData() async{
    setState(() { Loading = true; });
   var data = await TaskListRequest("Completed");
   setState(() {
     Loading = false;
     TaskItems = data;
   });
  }


  @override
  Widget build(BuildContext context) {
    return Loading?(Center(child: CircularProgressIndicator())):(Center(child: Text("Completed"),));
  }
}