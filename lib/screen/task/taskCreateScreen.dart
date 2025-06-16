import 'package:flutter/material.dart';
import 'package:task_manager/api/apiClient.dart';
import 'package:task_manager/style/style.dart';
import 'package:task_manager/utility/utility.dart';

class taskCreateScreen extends StatefulWidget {
  const taskCreateScreen({super.key});

  @override
  State<taskCreateScreen> createState() => _taskCreateScreenState();
}

class _taskCreateScreenState extends State<taskCreateScreen> {
  bool Loading = false;

  Map<String, String> FormValues = {
    "UserID": "",
    "createdEmail": "",
    "createdName": "",
    "title": "",
    "description": "",
    "status": "New",
  };


  @override
  void initState() {
    super.initState();
    readUserData();
  }

  Future<void> readUserData() async {
    String? userId = await GetUserData("userId");
    String? email = await GetUserData("email");
    String? fullName = await GetUserData("fullName");

    setState(() {
      FormValues["UserID"] = userId ?? "";
      FormValues["createdEmail"] = email ?? "";
      FormValues["createdName"] = fullName ?? "";
    });
  }

  InputOnChange(MapKey, TextValue) {
    setState(() {
      FormValues.update(MapKey, (value) => TextValue);
    });
  }

  FormOnSubmit() async {
    if (FormValues["title"]!.length == 0) {
      ErrorToast("Title Requred");
    } else if (FormValues["description"]!.length == 0) {
      ErrorToast("Description Requred");
    } else {
      setState(() {
        Loading = true;
      });
      bool response = await TaskCreateRequest(FormValues);
      // bool response = await true;

      if (response == true) {
        // Navigate to DashBoard Page
        // pushNamedAndRemoveUntil এর কাজ হচ্ছে যে রুটে আছি সেই রুটের উপর থেকে সবগুলো রুট মুছে ফেলে নতুন রুটে নিয়ে যাওয়া
        // যেমন আমি যদি loginScreen থেকে newTask এ যেতে চাই তাহলে loginScreen এর উপর থেকে সবগুলো রুট মুছে দিয়ে newTask এ নিয়ে যাবে
        Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
      } else {}
      setState(() {
        Loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorGreen,
        title: Text("Create New Task"),
      ),
      body: Stack(
        children: [
          ScreenBackground(context),
          Center(
            child: Container(
              child: Loading
                  ? Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      // Add your content here
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Add New Task",
                            style: Head1Text(colorDarkBlue),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            onChanged: (TextValue) {
                              InputOnChange("title", TextValue);
                            },
                            decoration: AppInputDecoration("Title"),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            onChanged: (TextValue) {
                              InputOnChange("description", TextValue);
                            },
                            maxLines: 10,
                            decoration: AppInputDecoration("Description"),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: ElevatedButton(
                              style: AppButtonStyle(),
                              child: SuccessButtonChild("Create"),
                              onPressed: () {
                                FormOnSubmit();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
