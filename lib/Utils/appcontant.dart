import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:network_packages_project/Utils/appcolors.dart';

class AppConstant{

  static flutterToast() => Fluttertoast.showToast(
      msg: "Successfully Copy",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      // webPosition: "right",
      backgroundColor: AppColors.backgroundBlackColor,
      textColor: Colors.white,
      fontSize: 16.0
  );
  static flutterToastError({required String message}) => Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      // webPosition: "right",
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
  );
  static flutterToastWithMessage({required String message}) => Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      // webPosition: "right",
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
  );
}