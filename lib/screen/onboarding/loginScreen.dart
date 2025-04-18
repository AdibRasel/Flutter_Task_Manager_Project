import 'package:flutter/material.dart';
import 'package:taskmanager/api/apiClient.dart';
import 'package:taskmanager/style/style.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {

  Map<String, String> FormValues = {"email":"","password":"",};

  bool Loading = false;

  InputOnChange(MapKey, TextValue){
    setState(() {
      FormValues.update(MapKey, (value)=>TextValue);
    });
  }



  FormOnSubmit()async{
    if(FormValues["email"]!.length==0){
      ErrorToast("Email Address Requred");
    }else if(FormValues["password"]!.length==0){
      ErrorToast("Password Requred");
    }else{
      setState(() {
        Loading = true;
      });
      bool response = await LoginRequest(FormValues);
      if(response == true){
        // Navigate to DashBoard Page
        // pushNamedAndRemoveUntil এর কাজ হচ্ছে যে রুটে আছি সেই রুটের উপর থেকে সবগুলো রুট মুছে ফেলে নতুন রুটে নিয়ে যাওয়া
        // যেমন আমি যদি loginScreen থেকে newTask এ যেতে চাই তাহলে loginScreen এর উপর থেকে সবগুলো রুট মুছে দিয়ে newTask এ নিয়ে যাবে
        Navigator.pushNamedAndRemoveUntil(context, "/newTask", (route)=> false);
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
          Center(
            child: Container(
             child: Loading ? 
             Center(child: CircularProgressIndicator()) : 
             SingleChildScrollView(
               // Add your content here
                padding: const EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Get Started With", style: Head1Text(colorDarkBlue),),
                    const SizedBox(height: 1,),
                    Text("Rasel Hossain Adib", style: Head6Text(colorLightGrey),),
                    const SizedBox(height: 20,),
            
            
                    TextFormField(
                      onChanged: (TextValue){
                        InputOnChange("email", TextValue);
                      },
                      decoration:AppInputDecoration("Email Address"),
                    ),
                    const SizedBox(height: 20,),
                    
                    
                    TextFormField(
                      onChanged: (TextValue){
                        InputOnChange("password", TextValue);
                      },
                      decoration:AppInputDecoration("Password"),
                    ),
                    const SizedBox(height: 20,),
                    Container(
                      child: ElevatedButton(
                        style: AppButtonStyle(),
                        child: SuccessButtonChild("Login"),
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
                          },
                          child: Text("Sign in", style: Head6Text(colorGreen),)
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