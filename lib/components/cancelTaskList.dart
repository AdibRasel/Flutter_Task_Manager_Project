import 'package:flutter/material.dart';
import 'package:taskmanager/components/TaskList.dart';

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

  CallData() async {
    setState(() {
      Loading = true;
    });
    var data = await TaskListRequest("Cancled");
    setState(() {
      Loading = false;
      TaskItems = data;
    });
  }


  DeleteItem(id) async{
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text("Delete !"),
          content: Text("Onece delete, you can't get it back"),
          actions: [
            OutlinedButton(onPressed: () async {
                Navigator.pop(context);
                setState((){Loading= true;});
                await TaskDeleteRequest(id);
                await CallData();
              }, 
              child: Text("Yes")
            ),
            OutlinedButton(onPressed: (){
                Navigator.pop(context);
              }, 
              child: Text("No")
            )
          ],
        );
      }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Loading
        ? (const Center(child: CircularProgressIndicator()))
        : RefreshIndicator(
            onRefresh: () async {
              await CallData();
            },
            child: Center(
              child: TaskList(TaskItems, DeleteItem),
            ),
          );
  }
}
