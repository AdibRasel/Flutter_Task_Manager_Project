import 'package:flutter/material.dart';
import 'package:taskmanager/style/style.dart';

BottomNavigationBar appBottomNav(currentIndex, onItemTapped) {
  return BottomNavigationBar(
    items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home_outlined),
        label: "Home",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.list_alt),
        label: "New",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.access_time_rounded),
        label: "Progress",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.check_circle_outline),
        label: "Completed",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.cancel_outlined),
        label: "Canceled",
      ),
    ],
    selectedItemColor: colorGreen,
    unselectedItemColor: colorLightGrey,
    currentIndex: currentIndex,
    showUnselectedLabels: true,
    showSelectedLabels: true,
    onTap: onItemTapped,
    type: BottomNavigationBarType.fixed,
  );
}
