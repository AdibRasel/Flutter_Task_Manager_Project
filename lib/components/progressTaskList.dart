import 'package:flutter/material.dart';

import '../api/apiClient.dart';

class progressTaskList extends StatefulWidget {
  const progressTaskList({super.key});

  @override
  State<progressTaskList> createState() => _progressTaskListState();
}

class _progressTaskListState extends State<progressTaskList> {


  List TaskItems = [];
  bool Loading = false;

  // পুরো ফেইজ যখন শো হবে তখন প্রথমে initState() ফাংশন কল হবে।
  void initState() {
    super.initState();
    CallData();
  }

  CallData() async{
    setState(() { Loading = true; });
   var data = await TaskListRequest("Progress");
   setState(() {
     Loading = false;
     TaskItems = data;
   });
  }


  @override
  Widget build(BuildContext context) {
    return Loading?(Center(child: CircularProgressIndicator())):(Center(child: Text("Progress"),));
  }
}