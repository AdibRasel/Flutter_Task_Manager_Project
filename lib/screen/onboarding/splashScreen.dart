import 'package:flutter/material.dart';
import 'package:task_manager/style/style.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            padding: EdgeInsets.all(30),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/MyImage.jpg", width: 150, alignment: Alignment.center,),
                  SizedBox(height: 10,),
                  Text("Rasel Hossain Adib", style: TextStyle(fontSize: 20, fontFamily: "Poppins", fontWeight: FontWeight.w600, color: colorGreen),),
                  Text("Full Stack Developer", style: Head6Text(colorDarkBlue),)
                ],
              )
            ),
          )
        ],
      )
    );
  }
}