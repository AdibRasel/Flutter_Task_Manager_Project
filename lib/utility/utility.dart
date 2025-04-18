


import 'package:shared_preferences/shared_preferences.dart';

 // User এর সকল ডাটা SharedPreferences এর মাধ্যমে সেভ করে রাখা হয়েছে। 
void StoreUserData(UserData)async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  await prefs.setString('token', UserData['token']);
  await prefs.setString('userId', UserData['data']['userId']);
  await prefs.setString('email', UserData['data']['email']);
  await prefs.setString('fullName', UserData['data']['fullName']);
  await prefs.setString('mobile', UserData['data']['mobile']);
  await prefs.setString('photo', UserData['data']['photo']);
  await prefs.setString('createdDate', UserData['data']['createdDate']);

}




Future<String?> GetUserData(key)async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  String? MyData = await prefs.getString(key);
  return MyData;

  // await prefs.setString('token', UserData['token']);
  // await prefs.setString('userId', UserData['data']['userId']);
  // await prefs.setString('email', UserData['data']['email']);
  // await prefs.setString('fullName', UserData['data']['fullName']);
  // await prefs.setString('mobile', UserData['data']['mobile']);
  // await prefs.setString('photo', UserData['data']['photo']);
  // await prefs.setString('createdDate', UserData['data']['createdDate']);

}