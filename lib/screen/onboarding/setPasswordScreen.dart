import 'package:flutter/material.dart';
import 'package:taskmanager/style/style.dart';

class setPasswordScreen extends StatefulWidget {
  const setPasswordScreen({super.key});

  @override
  State<setPasswordScreen> createState() => _setPasswordScreenState();
}

class _setPasswordScreenState extends State<setPasswordScreen> {
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
                
             
                Text("Set Password", style: Head1Text(colorDarkBlue),),
                const SizedBox(height: 1,),
                Text("Minimum length password 8 character with Latter and number combination", style: Head6Text(colorLightGrey),),
                const SizedBox(height: 20,),
                TextFormField(decoration: AppInputDecoration("Password"),),
                const SizedBox(height: 20,),
                TextFormField(decoration: AppInputDecoration("Confirm Password"),),
                const SizedBox(height: 20,),
                Container(
                  child: ElevatedButton(
                    style: AppButtonStyle(),
                    child: SuccessButtonChild("Confirm"),
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