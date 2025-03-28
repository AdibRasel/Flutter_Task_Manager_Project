import 'package:flutter/material.dart';
import 'package:taskmanager/style/style.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
         children: [
           ScreenBackground(context),
          Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Get Started With", style: Head1Text(colorDarkBlue),),
                const SizedBox(height: 1,),
                Text("Rasel Hossain Adib", style: Head6Text(colorLightGrey),),
                const SizedBox(height: 20,),
                TextFormField(decoration: AppInputDecoration("Email Address"),),
                const SizedBox(height: 20,),
                TextFormField(decoration: AppInputDecoration("Password"),),
                const SizedBox(height: 20,),
                Container(
                  child: ElevatedButton(
                    style: AppButtonStyle(),
                    child: SuccessButtonChild("Login"),
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
                      child: Text("Sign in", style: Head6Text(colorGreen),)
                    ),
                  ],
                )
              ],
            ),
          ),
         ],
      ),
    );
  }
}