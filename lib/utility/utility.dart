


import 'package:shared_preferences/shared_preferences.dart';

 // User এর সকল ডাটা SharedPreferences এর মাধ্যমে সেভ করে রাখা হয়েছে। 
Future StoreUserData(UserData)async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  await prefs.setString('token', UserData['token']);
  await prefs.setString('userId', UserData['data']['userId']);
  await prefs.setString('email', UserData['data']['email']);
  await prefs.setString('fullName', UserData['data']['fullName']);
  await prefs.setString('mobile', UserData['data']['mobile']);
  await prefs.setString('photo', UserData['data']['photo']);
  await prefs.setString('createdDate', UserData['data']['createdDate']);

}



Future SetEmailVerification(Email)async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  await prefs.setString('EmailVerification', Email);
}



Future SetOTPVerification(OTP)async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  await prefs.setString('OTPVerification', OTP);
}




Future<String?> GetUserData(key)async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  String? MyData = await prefs.getString(key);
  return MyData;

  // token = await prefs.getString('token');
  // userId = await prefs.getString('userId');
  // email = await prefs.getString('email');
  // fullName = await prefs.getString('fullName');
  // mobile = await prefs.getString('mobile');
  // photo = await prefs.getString('photo');
  // createdDate = await prefs.getString('createdDate');

}