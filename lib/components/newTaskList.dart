import 'package:flutter/material.dart';
import 'package:taskmanager/api/apiClient.dart';
import 'package:taskmanager/components/TaskList.dart';
import 'package:taskmanager/style/style.dart';
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

  CallData() async {
    setState(() {
      Loading = true;
    });
    var data = await TaskListRequest("New");
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
              child: Text("Yes", style: TextStyle(color: colorWhite),),
              style: AppStatusButtonStyle(colorRed),
            ),
            OutlinedButton(onPressed: (){
                Navigator.pop(context);
              }, 
              child: Text("No", style: TextStyle(color: colorWhite),),
              style: AppStatusButtonStyle(colorBlue),
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
