import 'package:flutter/material.dart';
import 'package:taskmanager/style/style.dart';


class registrationScreen extends StatefulWidget {
  const registrationScreen({super.key});

  @override
  State<registrationScreen> createState() => _registrationScreenState();
}

class _registrationScreenState extends State<registrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
         children: [
           ScreenBackground(context),
          Container(
            padding: const EdgeInsets.all(30),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Join With Us", style: Head1Text(colorDarkBlue),),
                  const SizedBox(height: 20,),
                  TextFormField(decoration: AppInputDecoration("Email"),),
                  const SizedBox(height: 20,),
                  const SizedBox(height: 20,),
                  TextFormField(decoration: AppInputDecoration("First Name"),),
                  const SizedBox(height: 20,),
                  const SizedBox(height: 20,),
                  TextFormField(decoration: AppInputDecoration("Last Name"),),
                  const SizedBox(height: 20,),
                  const SizedBox(height: 20,),
                  TextFormField(decoration: AppInputDecoration("Mobile"),),
                  const SizedBox(height: 20,),
                  TextFormField(decoration: AppInputDecoration("Password"),),
                  const SizedBox(height: 20,),
                  const SizedBox(height: 20,),
                  TextFormField(decoration: AppInputDecoration("Confirm Password"),),
                  const SizedBox(height: 20,),
                  Container(
                    child: ElevatedButton(
                      style: AppButtonStyle(),
                      child: SuccessButtonChild("Registration"),
                      onPressed: (){}, 
                    ),
                  ),

                const SizedBox(height: 10,),


                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Have account?", style: Head6Text(colorLightGrey),),
                    SizedBox(width: 5,),
                    InkWell(
                      onTap: (){

                      },
                      child: Text("Log in", style: Head6Text(colorGreen),)
                    ),
                  ],
                )
                ],
              ),
            ),
          ),
         ],
      ),
    );;
  }
}