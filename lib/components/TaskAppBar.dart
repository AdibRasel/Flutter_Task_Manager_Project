import 'package:flutter/material.dart';
import 'package:taskmanager/style/style.dart';
import 'package:taskmanager/utility/utility.dart';

AppBar TaskAppBar() {
  return AppBar(
    backgroundColor: colorGreen,
    elevation: 0,
    toolbarHeight: 90,
    automaticallyImplyLeading: false,
    title: Row(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: Colors.white,
          child: ClipOval(
            // child: Image.memory(
            //   ShowBase64Image(""), // Base 64 Image Data
            //   fit: BoxFit.cover,
            //   width: 48,
            //   height: 48,
            // ),
            child: Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-pm5nsaoeEsJuLaMXPwSkXna5gYbPCAaK3A&s",
              fit: BoxFit.cover,
              width: 48,
              height: 48,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Rasel Hossain",
              style: Head7Text(colorWhite),
            ),
            Text(
              "adibrasel.com@gmail.com",
              style: Head9Text(colorWhite),
            ),
          ],
        ),
      ],
    ),
    actions: [
      IconButton(onPressed: () {}, icon: Icon(Icons.add_circle_outline)),
      IconButton(onPressed: () {}, icon: Icon(Icons.output)),
    ],
  );
}
