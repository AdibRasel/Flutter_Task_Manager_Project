import 'package:flutter/material.dart';
import 'package:taskmanager/screen/onboarding/emailVerification.dart';
import 'package:taskmanager/screen/onboarding/loginScreen.dart';
import 'package:taskmanager/screen/onboarding/pinVerificationScreen.dart';
import 'package:taskmanager/screen/onboarding/registrationScreen.dart';
import 'package:taskmanager/screen/onboarding/setPasswordScreen.dart';
import 'package:taskmanager/screen/onboarding/splashScreen.dart';
import 'package:taskmanager/screen/task/homeScreenLayout.dart';
// import 'package:taskmanager/screen/task/newTaskListScreen.dart';

import 'utility/utility.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  String ? token = await GetUserData('token');

  // এখানে token এর মাধ্যমে চেক করা হচ্ছে যে, ইউজার লগিন করেছে কিনা।
  // যদি লগিন করে থাকে তাহলে newTaskListScreen এ নিয়ে যাবে।
  // আর যদি লগিন না করে থাকে তাহলে loginScreen এ নিয়ে যাবে।

  if(token==null){
    runApp( const MyApp("/login"));
    // runApp( const MyApp("/newTask"));
  }else{
    runApp( const MyApp("/"));
    // runApp( const MyApp("/login"));
  }

  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  final String FirstRoute;
  const MyApp(this.FirstRoute, {super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Manager',
      
      initialRoute: FirstRoute,
      routes: {
        // '/': (context)=> splashScreen(),
        '/': (context)=> homeScreenLayout(),
        '/homeScreenLayout': (context)=> homeScreenLayout(),
        '/login': (context)=> loginScreen(),
        '/registration': (context)=> registrationScreen(),
        '/emailVerification': (context)=> emailVerification(),
        '/pinVerification': (context)=> pinVerificationScreen(),
        '/setPassword': (context)=> setPasswordScreen(),
        // '/newTask': (context)=> newTaskListScreen(),
      },


    );
  }
}
