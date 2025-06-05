import 'package:flutter/material.dart';
import 'package:taskmanager/components/TaskAppBar.dart';
import 'package:taskmanager/components/appBottomNav.dart';
import 'package:taskmanager/utility/utility.dart';

import '../../components/cancelTaskList.dart';
import '../../components/completedTaskList.dart';
import '../../components/newTaskList.dart';
import '../../components/progressTaskList.dart';

class homeScreenLayout extends StatefulWidget {
  const homeScreenLayout({super.key});

  @override
  State<homeScreenLayout> createState() => _homeScreenLayoutState();
}

class _homeScreenLayoutState extends State<homeScreenLayout> {
  Map<String, String> ProfileDate = {
    "userId": "",
    "email": "",
    "fullName": "",
    "mobile": "",
    "photo": DefaultProfilePic,
    "createdDate": "",
  };

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    ReadAppBarData();
  }

  Future<void> ReadAppBarData() async {
    String? userId = await GetUserData("userId");
    String? email = await GetUserData("email");
    String? fullName = await GetUserData("fullName");
    String? mobile = await GetUserData("mobile");
    String? photo = await GetUserData("photo");
    String? createdDate = await GetUserData("createdDate");

    setState(() {
      String finalPhoto = DefaultProfilePic;
      if (photo != null && photo.trim().isNotEmpty && photo != "null") {
        finalPhoto = photo;
      }
      ProfileDate = {
        "userId": userId ?? "",
        "email": email ?? "",
        "fullName": fullName ?? "",
        "mobile": mobile ?? "",
        "photo": finalPhoto,
        "createdDate": createdDate ?? "",
      };
      isLoading = false;
    });
  }

  int TabIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      TabIndex = index;
    });
  }

  final List<Widget> widgetOptions = [
    newTaskList(),
    progressTaskList(),
    completedTaskList(),
    cancelTaskList(),
  ];

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: TaskAppBar(context, ProfileDate),
      body: widgetOptions.elementAt(TabIndex),
      bottomNavigationBar: appBottomNav(TabIndex, onItemTapped),
    );
  }
}
