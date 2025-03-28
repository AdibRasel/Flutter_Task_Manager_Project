
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';



const colorRed = Color.fromRGBO(231, 28, 36, 1);
const colorDark = Color.fromRGBO(136, 28, 63, 1);
const colorGreen = Color.fromRGBO(33, 191, 115, 1);
const colorBlue = Color.fromRGBO(52, 152, 219, 1);
const colorOrange = Color.fromRGBO(230, 126, 34, 1);
const colorWhite = Color.fromRGBO(255, 255, 255, 1);
const colorDarkBlue = Color.fromRGBO(44, 62, 80, 1);
const colorLightGrey = Color.fromRGBO(135, 142, 150, 1);
const colorLight = Color.fromRGBO(211, 211, 211, 1);



TextStyle Head1Text(textColor){
  return TextStyle(
    color: textColor,
    fontSize: 28,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w700,
  );
}

TextStyle Head6Text(textColor){
  return TextStyle(
    color: textColor,
    fontSize: 16,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
  );
}


InputDecoration AppInputDecoration(label){
  return InputDecoration(
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide (color:colorGreen, width: 1),
    ),
    fillColor: colorWhite,
    filled: true,
    contentPadding: const EdgeInsets.fromLTRB(20, 10, 10, 20),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: colorWhite, width: 0.0),
    ),
    border: const OutlineInputBorder(),
    labelText: label
  );
}



DecoratedBox AppDropDownStyle (child){
  return DecoratedBox(
    decoration: BoxDecoration(
      color: Colors.white, border: Border.all(color: Colors.white, width: 1),
      borderRadius: BorderRadius.all(10 as Radius),
    ),
    child: Padding(
      padding:  const EdgeInsets.only(left: 30, right: 30),
      child: child,
    ),
  );
}




SvgPicture ScreenBackground(context){
  return SvgPicture.asset(
    'assets/images/screen-back.svg',
    alignment: Alignment.center,
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    fit: BoxFit.fill,
  );
}



ButtonStyle AppButtonStyle(){
  return ElevatedButton.styleFrom(
    elevation: 1,
    padding: EdgeInsets.zero,
    backgroundColor: Colors.transparent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))
  );
}


TextStyle ButtonTextStyle(){
  return const TextStyle(
    fontSize: 16,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    color: colorWhite
  );
}


Ink SuccessButtonChild( String ButtonText){
  return Ink(
    decoration: BoxDecoration(color: colorGreen, borderRadius: BorderRadius.circular(6)),
    child: Container(
      height: 45,
      alignment: Alignment.center,
      child: Text(ButtonText, style: ButtonTextStyle(),),
    ),
  );
}



void SuccessToast(msg){
  Fluttertoast.showToast(
    msg: msg,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    toastLength: Toast.LENGTH_SHORT,
    backgroundColor: colorGreen,
    textColor: colorWhite,
    fontSize: 16.0
  );
}



void ErrorToast(msg){
  Fluttertoast.showToast(
    msg: msg,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    toastLength: Toast.LENGTH_SHORT,
    backgroundColor: colorRed,
    textColor: colorWhite,
    fontSize: 16.0
  );
}