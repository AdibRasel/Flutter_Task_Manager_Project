import 'package:flutter/material.dart';
import 'package:taskmanager/style/style.dart';

import '../../api/apiClient.dart';


class registrationScreen extends StatefulWidget {
  const registrationScreen({super.key});

  @override
  State<registrationScreen> createState() => _registrationScreenState();
}

class _registrationScreenState extends State<registrationScreen> {

Map<String, String> FormValues = {"email":"","firstName":"", "lastName":"", "mobile":"", "password":"", "photo":"", "confirmPassword":""};	

  bool Loading = false;

  InputOnChange(MapKey, TextValue){
    setState(() {
      FormValues.update(MapKey, (value)=>TextValue);
    });
  }



  

  FormOnSubmit()async{
    if(FormValues["email"]!.length==0){
      ErrorToast("Email Address Requred");
    }else if(FormValues["firstName"]!.length==0){

      ErrorToast("First Name Requred");

    }else if(FormValues["lastName"]!.length==0){

      ErrorToast("Last Name Requred");

    }else if(FormValues["mobile"]!.length==0){

      ErrorToast("Mobile Requred");

    }else if(FormValues["password"]!.length==0){

      ErrorToast("Password Requred");

    }else if(FormValues["confirmPassword"]!.length==0){

      ErrorToast("Confirm Password Requred");

    }else if(FormValues["password"]!=FormValues["confirmPassword"]){

      ErrorToast("Password Not Match");

    }
    
    
    
    else{
      setState(() {
        Loading = true;
      });
      bool response = await RegistrationRequest(FormValues);
      if(response == true){
        // Navigate to DashBoard Page
        // pushNamedAndRemoveUntil এর কাজ হচ্ছে যে রুটে আছি সেই রুটের উপর থেকে সবগুলো রুট মুছে ফেলে নতুন রুটে নিয়ে যাওয়া
        // যেমন আমি যদি loginScreen থেকে newTask এ যেতে চাই তাহলে loginScreen এর উপর থেকে সবগুলো রুট মুছে দিয়ে newTask এ নিয়ে যাবে
        Navigator.pushNamedAndRemoveUntil(context, "/login", (route)=> false);
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
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Join With Us", style: Head1Text(colorDarkBlue),),
                  const SizedBox(height: 20,),
                  TextFormField(
                    onChanged: (TextValue){
                      InputOnChange("email", TextValue);
                    },
                    decoration: AppInputDecoration("Email"),
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    onChanged: (TextValue){
                      InputOnChange("firstName", TextValue);
                    },
                    decoration: AppInputDecoration("First Name"),
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    onChanged: (TextValue){
                      InputOnChange("lastName", TextValue);
                    },
                    decoration: AppInputDecoration("Last Name"),
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    onChanged: (TextValue){
                      InputOnChange("mobile", TextValue);
                    },
                    decoration: AppInputDecoration("Mobile"),
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    onChanged: (TextValue){
                      InputOnChange("password", TextValue);
                    },
                    decoration: AppInputDecoration("Password"),
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    onChanged: (TextValue){
                      InputOnChange("confirmPassword", TextValue);
                    },
                    decoration: AppInputDecoration("Confirm Password"),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    child: ElevatedButton(
                      style: AppButtonStyle(),
                      child: SuccessButtonChild("Registration"),
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



          ),
         ],
      ),
    );
  }
}