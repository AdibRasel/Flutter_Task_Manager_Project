import 'package:flutter/material.dart';
import 'package:taskmanager/style/style.dart';


class emailVerification extends StatefulWidget {
  const emailVerification({super.key});

  @override
  State<emailVerification> createState() => _emailVerificationState();
}

class _emailVerificationState extends State<emailVerification> {
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
                Text("Your Email Address", style: Head1Text(colorDarkBlue),),
                const SizedBox(height: 1,),
                Text("a 6 digit verification pin will send to email address", style: Head6Text(colorLightGrey),),
                const SizedBox(height: 20,),
                TextFormField(decoration: AppInputDecoration("Email Address"),),
                const SizedBox(height: 20,),
                Container(
                  child: ElevatedButton(
                    style: AppButtonStyle(),
                    child: SuccessButtonChild("Next"),
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
         ],
      ),
    );
  }
}