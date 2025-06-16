import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manager/style/style.dart';
import 'package:task_manager/utility/utility.dart';

import '../../api/apiClient.dart';


class pinVerificationScreen extends StatefulWidget {
  const pinVerificationScreen({super.key});

  @override
  State<pinVerificationScreen> createState() => _pinVerificationScreenState();
}

class _pinVerificationScreenState extends State<pinVerificationScreen> {




  Map<String, String> FormValues = {"OTP":""};

  bool Loading = false;

  InputOnChange(MapKey, TextValue){
    setState(() {
      FormValues.update(MapKey, (value)=>TextValue);
    });
  }



  FormOnSubmit()async{
    if(FormValues["OTP"]!.length==0){
      ErrorToast("OTP Requred");
    }else{
      setState(() {
        Loading = true;
      });

      String? Email = await GetUserData("EmailVerification");

      bool response = await VerifyOTPRequest(Email, FormValues["OTP"]);
      if(response == true){
        // Navigate to DashBoard Page
        // pushNamedAndRemoveUntil এর কাজ হচ্ছে যে রুটে আছি সেই রুটের উপর থেকে সবগুলো রুট মুছে ফেলে নতুন রুটে নিয়ে যাওয়া
        // যেমন আমি যদি loginScreen থেকে newTask এ যেতে চাই তাহলে loginScreen এর উপর থেকে সবগুলো রুট মুছে দিয়ে newTask এ নিয়ে যাবে
        Navigator.pushNamed(context, "/setPassword");
      }else{

      }
      setState(() {
        Loading = false;
      });
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(


            child: Loading ?


            (Center(child: CircularProgressIndicator())) : Container(



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
                    InputOnChange("OTP", value);
                  },

                ),
                const SizedBox(height: 20,),
                Container(
                  child: ElevatedButton(
                    style: AppButtonStyle(),
                    child: SuccessButtonChild("Verify"),
                    onPressed: (){
                      FormOnSubmit();
                    }, 
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
                        Navigator.pushNamed(context, "/registration");
                      },
                      child: Text("Sign in", style: Head6Text(colorGreen),)
                    ),
                  ],
                )
              ],
            ),


            ),



          )
        ],
      ),
    );
  }
}