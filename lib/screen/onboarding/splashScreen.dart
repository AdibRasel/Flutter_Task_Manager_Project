import 'dart:async';
import 'package:flutter/material.dart';
import 'package:task_manager/style/style.dart';
import 'package:task_manager/utility/utility.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateAfterDelay();
  }

  void _navigateAfterDelay() async {
    await Future.delayed(const Duration(seconds: 2));
    String? token = await GetUserData('token');

    if (mounted) {
      if (token == null) {
        Navigator.pushReplacementNamed(context, '/login');
      } else {
        Navigator.pushReplacementNamed(context, '/homeScreenLayout');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            padding: const EdgeInsets.all(30),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/MyImage.jpg",
                    width: 150,
                    alignment: Alignment.center,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Rasel Hossain Adib",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      color: colorGreen,
                    ),
                  ),
                  Text(
                    "Full Stack Developer",
                    style: Head6Text(colorDarkBlue),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
