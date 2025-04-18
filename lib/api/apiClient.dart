import 'dart:convert'; // json incode decode
import 'package:taskmanager/style/style.dart';
import 'package:http/http.dart' as http;

const BaseURL = "https://flutter-backend-all-api.onrender.com/api/v1";
Map<String, String> RequestHeader = {
  'Content-Type': 'application/json',
};


//================== User Releted API Request Start =============================

// Login Request
Future <bool> LoginRequest(FormValues) async {

  var URL = Uri.parse("${BaseURL}/login");
  var PostBody= json.encode(FormValues);

  var response = await http.post(URL, headers: RequestHeader, body: PostBody);

  var ResultCode = response.statusCode;
  var ResultBody = json.decode(response.body);

  if(ResultCode == 200 && ResultBody['status']== "success"){
    SuccessToast("Request Success");
    return true;
  }else {
    ErrorToast("Request fail! try again");
    return false;
  }

}

// Registration Request
Future <bool> RegistrationRequest(FormValues) async {

  var URL = Uri.parse("${BaseURL}/registration");
  var PostBody= json.encode(FormValues);

  var response = await http.post(URL, headers: RequestHeader, body: PostBody);

  var ResultCode = response.statusCode;
  var ResultBody = json.decode(response.body);

  if(ResultCode == 200 && ResultBody['status']== "success"){
    SuccessToast("Request Success");
    return true;
  }else {
    ErrorToast("Request fail! try again");
    return false;
  }

}



// Verify Email Request
Future <bool> VerifyEmailRequest(Email) async {

  var URL = Uri.parse("${BaseURL}/RecoverVerifyEmail/${Email}");

  var response = await http.get(URL, headers: RequestHeader);

  var ResultCode = response.statusCode;
  var ResultBody = json.decode(response.body);

  if(ResultCode == 200 && ResultBody['status']== "success"){
    SuccessToast("Request Success");
    return true;
  }else {
    ErrorToast("Request fail! try again");
    return false;
  }

}




// Verify OTP Request
Future <bool> VerifyOTPRequest(Email, OTP) async {

  var URL = Uri.parse("${BaseURL}/RecoverVerifyOTP/${Email}/${OTP}");

  var response = await http.get(URL, headers: RequestHeader);

  var ResultCode = response.statusCode;
  var ResultBody = json.decode(response.body);

  if(ResultCode == 200 && ResultBody['status']== "success"){
    SuccessToast("Request Success");
    return true;
  }else {
    ErrorToast("Request fail! try again");
    return false;
  }

}




// Set Password Request
Future <bool> SetPasswordRequest(FormValues) async {

  var URL = Uri.parse("${BaseURL}/RecoverResetPass");
  var PostBody= json.encode(FormValues);

  var response = await http.post(URL, headers: RequestHeader, body: PostBody);

  var ResultCode = response.statusCode;
  var ResultBody = json.decode(response.body);

  if(ResultCode == 200 && ResultBody['status']== "success"){
    SuccessToast("Request Success");
    return true;
  }else {
    ErrorToast("Request fail! try again");
    return false;
  }

}



//================== User Releted API Request End =============================
