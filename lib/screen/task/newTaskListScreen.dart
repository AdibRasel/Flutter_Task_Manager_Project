import 'package:flutter/material.dart';
import 'package:taskmanager/utility/utility.dart';

class newTaskListScreen extends StatefulWidget {
  const newTaskListScreen({super.key});

  @override
  State<newTaskListScreen> createState() => _newTaskListScreenState();
}

class _newTaskListScreenState extends State<newTaskListScreen> {

  String email = "";


  @override
  void initState() {
    // TODO: implement initState
    CallUserData();
  }

  CallUserData() async {
    var test = await GetUserData("token");

    if (test != null) {
      setState(() {
        email = test;
      });
    } else {
      // null হলে কিছু fallback বা default behavior রাখো
      print("Email not found in SharedPreferences");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Task"),
      ),
      body: Center(
        child: Text(email),
      ),
    );
  }
}