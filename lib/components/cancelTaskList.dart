import 'package:flutter/material.dart';
import 'package:taskmanager/components/TaskList.dart';
import 'package:taskmanager/style/style.dart';

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
    var data = await TaskListRequest("Canceld");
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
          title: const Text("Delete !"),
          content: const Text("Onece delete, you can't get it back"),
          actions: [
            OutlinedButton(onPressed: () async {
                Navigator.pop(context);
                setState((){Loading= true;});
                await TaskDeleteRequest(id);
                await CallData();
              }, 
              child: const Text("Yes")
            ),
            OutlinedButton(onPressed: (){
                Navigator.pop(context);
              }, 
              child: const Text("No")
            )
          ],
        );
      }
    );
  }


  UpdateStatus(id)async{
    setState(() {
      Loading = true;
    });
    await TaskUpdateRequest(id, Status);
    CallData();
    setState(() {
      Status = "Canceld";
    });
  }

  String Status = "Canceld";
  StatusChange (id) async {
    showModalBottomSheet(
      context: context, 
      builder: (context){
         return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState){
            return Container(
              padding: const EdgeInsets.all(30),
              height: 300,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  RadioListTile(
                    title: const Text("New"),
                    value: "New",
                    groupValue: Status,
                    onChanged: (value) {
                      setState(() {
                        Status = value.toString();
                      });
                    },
                  ),

                  RadioListTile(
                    title: const Text("Progress"),
                    value: "Progress",
                    groupValue: Status,
                    onChanged: (value) {
                      setState(() {
                        Status = value.toString();
                      });
                    },
                  ),

                  RadioListTile(
                    title: const Text("Completed"),
                    value: "Completed",
                    groupValue: Status,
                    onChanged: (value) {
                      setState(() {
                        Status = value.toString();
                      });
                    },
                  ),

                  RadioListTile(
                    title: const Text("Canceld"),
                    value: "Canceld",
                    groupValue: Status,
                    onChanged: (value) {
                      setState(() {
                        Status = value.toString();
                      });
                    },
                  ),

                  Container(
                    child: ElevatedButton(
                      style: AppButtonStyle(),
                      child: SuccessButtonChild("Confirm"),
                      onPressed: () {
                        Navigator.pop(context);
                        UpdateStatus(id);
                      },
                    ),
                  ),


                ],
              ),
            );
          }
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
              child: TaskList(TaskItems, DeleteItem, StatusChange),
            ),
          );
  }
}
