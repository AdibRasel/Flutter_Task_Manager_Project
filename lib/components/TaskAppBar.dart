import 'package:flutter/material.dart';
import 'package:taskmanager/style/style.dart';
import 'package:taskmanager/utility/utility.dart';

AppBar TaskAppBar(context, ProfileDate) {
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
              child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle, // 50% round
            ),
            child: ClipOval(
              // Image টাকেও গোল করতে হবে
              child: Image.memory(
                ShowBase64Image(ProfileDate['photo']), // Base64 Image Data
                fit: BoxFit.cover,
                width: 48,
                height: 48,
              ),
            ),
          )),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ProfileDate["fullName"],
              style: Head7Text(colorWhite),
            ),
            Text(
              ProfileDate["email"],
              style: Head9Text(colorWhite),
            ),
          ],
        ),
      ],
    ),
    actions: [
      IconButton(
          onPressed: () {
            Navigator.pushNamed(context, "/CreateTask");
          },
          icon: Icon(Icons.add_circle_outline)),
      IconButton(
          onPressed: () async {
            await RemoveToken();
            Navigator.pushNamedAndRemoveUntil(
                context, "/login", (route) => false);
          },
          icon: Icon(Icons.output)),
    ],
  );
}
