import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:task_manager/style/style.dart';

import '../../api/apiClient.dart';
import '../../utility/utility.dart';

class setPasswordScreen extends StatefulWidget {
  const setPasswordScreen({super.key});

  @override
  State<setPasswordScreen> createState() => _setPasswordScreenState();
}

class _setPasswordScreenState extends State<setPasswordScreen> {




  Map<String, String> FormValues = {"password":"", "confirmPassword":"", "OTP":""};

  bool Loading = false;

  InputOnChange(MapKey, TextValue){
    setState(() {
      FormValues.update(MapKey, (value)=>TextValue);
    });
  }



  FormOnSubmit()async{
    if(FormValues["password"]!.length==0){

      ErrorToast("Password Requred");

    }else if(FormValues["confirmPassword"]!.length==0){

      ErrorToast("Confirm Password Requred");

    }else if(FormValues["password"]!=FormValues["confirmPassword"]){

      ErrorToast("Password Not Match");

    }else{
      setState(() {
        Loading = true;
      });

      String? Email = await GetUserData("EmailVerification");
      String? OTP = await GetUserData("OTPVerification");

      String PostBody = json.encode({
        "Email": Email,
        "OTP": OTP,
        "NewPassword": FormValues["password"],
      });


      bool response = await SetPasswordRequest(PostBody);
      if(response == true){
        // Navigate to DashBoard Page
        // pushNamedAndRemoveUntil এর কাজ হচ্ছে যে রুটে আছি সেই রুটের উপর থেকে সবগুলো রুট মুছে ফেলে নতুন রুটে নিয়ে যাওয়া
        // যেমন আমি যদি loginScreen থেকে newTask এ যেতে চাই তাহলে loginScreen এর উপর থেকে সবগুলো রুট মুছে দিয়ে newTask এ নিয়ে যাবে
        Navigator.pushNamed(context, "/login");
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
                
             
                Text("Set Password", style: Head1Text(colorDarkBlue),),
                const SizedBox(height: 1,),
                Text("Minimum length password 8 character with Latter and number combination", style: Head6Text(colorLightGrey),),
                const SizedBox(height: 20,),
                TextFormField(
                  onChanged: (value){
                    InputOnChange("password", value);
                  },
                  obscureText: true,
                  obscuringCharacter: "*",
                  decoration: AppInputDecoration("Password"),
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  onChanged: (value){
                    InputOnChange("confirmPassword", value);
                  },
                  decoration: AppInputDecoration("Confirm Password"),
                ),
                const SizedBox(height: 20,),
                Container(
                  child: ElevatedButton(
                    style: AppButtonStyle(),
                    child: SuccessButtonChild("Confirm"),
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
                    SizedBox(width: 5,),
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




          ),
         ],
      ),
    );
  }
}