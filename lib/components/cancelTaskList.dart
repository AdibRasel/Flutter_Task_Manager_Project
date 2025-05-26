import 'package:flutter/material.dart';

import '../api/apiClient.dart';

class cancelTaskList extends StatefulWidget {
  const cancelTaskList({super.key});

  @override
  State<cancelTaskList> createState() => _cancelTaskListState();
}

class _cancelTaskListState extends State<cancelTaskList> {


  List TaskItems = [];
  bool Loading = false;

  // পুরো ফেইজ যখন শো হবে তখন প্রথমে initState() ফাংশন কল হবে।
  void initState() {
    super.initState();
    CallData();
  }

  CallData() async{
    setState(() { Loading = true; });
   var data = await TaskListRequest("Cancled");
   setState(() {
     Loading = false;
     TaskItems = data;
   });
  }


  @override
  Widget build(BuildContext context) {
    return Loading?(Center(child: CircularProgressIndicator())):(Center(child: Text("Cancled"),));
  }
}