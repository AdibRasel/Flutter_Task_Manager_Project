import 'package:flutter/material.dart';
import 'package:taskmanager/components/TaskAppBar.dart';
import 'package:taskmanager/components/appBottomNav.dart';

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
  int TabIndex = 0;

  onItemTapped(int index) {
    setState(() {
      TabIndex = index;
    });
  }

  final widgetOptions = [
    newTaskList(),
    progressTaskList(),
    completedTaskList(),
    cancelTaskList(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TaskAppBar(),
      body: widgetOptions.elementAt(TabIndex),
      bottomNavigationBar: appBottomNav(TabIndex, onItemTapped),
    );
  }
}
