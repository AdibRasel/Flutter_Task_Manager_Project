import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:taskmanager/style/style.dart';


class pinVerificationScreen extends StatefulWidget {
  const pinVerificationScreen({super.key});

  @override
  State<pinVerificationScreen> createState() => _pinVerificationScreenState();
}

class _pinVerificationScreenState extends State<pinVerificationScreen> {
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
                Text("PIN Verification", style: Head1Text(colorDarkBlue),),
                const SizedBox(height: 10,),
                Text("A 6 digit pin has bean send to your email address", style: Head6Text(colorLightGrey),),
                const SizedBox(height: 20,),
                PinCodeTextField(
                  appContext: context, 
                  length: 6,
                  pinTheme: AppOTPStyle(),
                  animationType: AnimationType.fade,
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                  onCompleted: (pin){

                  },
                  onChanged: (value){

                  },

                ),
                const SizedBox(height: 20,),
                Container(
                  child: ElevatedButton(
                    style: AppButtonStyle(),
                    child: SuccessButtonChild("Verify"),
                    onPressed: (){}, 
                  ),
                ),

                const SizedBox(height: 10,),


                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Have account?", style: Head6Text(colorLightGrey),),
                    const SizedBox(width: 5,),
                    InkWell(
                      onTap: (){

                      },
                      child: Text("Sign in", style: Head6Text(colorGreen),)
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}