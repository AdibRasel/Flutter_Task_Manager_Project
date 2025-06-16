import 'package:flutter/material.dart';
import 'package:task_manager/style/style.dart';

import '../../api/apiClient.dart';


class emailVerification extends StatefulWidget {
  const emailVerification({super.key});

  @override
  State<emailVerification> createState() => _emailVerificationState();
}

class _emailVerificationState extends State<emailVerification> {


  Map<String, String> FormValues = {"email":"",};

  bool Loading = false;

  InputOnChange(MapKey, TextValue){
    setState(() {
      FormValues.update(MapKey, (value)=>TextValue);
    });
  }



  FormOnSubmit()async{
    if(FormValues["email"]!.length==0){
      ErrorToast("Email Address Requred");
    }else{
      setState(() {
        Loading = true;
      });
      bool response = await VerifyEmailRequest(FormValues["email"]);
      if(response == true){
        // Navigate to DashBoard Page
        // pushNamedAndRemoveUntil এর কাজ হচ্ছে যে রুটে আছি সেই রুটের উপর থেকে সবগুলো রুট মুছে ফেলে নতুন রুটে নিয়ে যাওয়া
        // যেমন আমি যদি loginScreen থেকে newTask এ যেতে চাই তাহলে loginScreen এর উপর থেকে সবগুলো রুট মুছে দিয়ে newTask এ নিয়ে যাবে
        Navigator.pushNamed(context, "/pinVerification");
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
            padding: const EdgeInsets.all(30),

            child: Loading ?


            (Center(child: CircularProgressIndicator())) : Container(


            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Your Email Address", style: Head1Text(colorDarkBlue),),
                const SizedBox(height: 1,),
                Text("a 6 digit verification pin will send to email address", style: Head6Text(colorLightGrey),),
                const SizedBox(height: 20,),
                TextFormField(
                  onChanged: (TextValue){
                    InputOnChange("email", TextValue);
                  },
                  decoration: AppInputDecoration("Email Address"),
                ),
                const SizedBox(height: 20,),
                Container(
                  child: ElevatedButton(
                    style: AppButtonStyle(),
                    child: SuccessButtonChild("Next"),
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
                        Navigator.pushNamed(context, "/login");
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
    );
  }
}