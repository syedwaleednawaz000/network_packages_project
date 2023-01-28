import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:network_packages_project/Utils/appcontant.dart';
import 'package:network_packages_project/Widget/appBar.dart';

import '../Widget/appbarwidgetsecond.dart';
class ComplainentScreenPage extends StatefulWidget {
   const ComplainentScreenPage({Key? key}) : super(key: key);

  @override
  State<ComplainentScreenPage> createState() => _ComplainentScreenPageState();
}

class _ComplainentScreenPageState extends State<ComplainentScreenPage> {
  TextEditingController complaintTextEditingController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBarWidgetSecond(title: 'Complainent'),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:   [
              SizedBox(height: 15.h,),
               Card(
                 child: SizedBox(
                   width: double.infinity,
                   child: TextField(
                     controller: emailEditingController,
                     decoration:  InputDecoration(
                       contentPadding: EdgeInsets.only(left: 10.w),
                       focusColor: Colors.blue,
                       hintText: 'Enter Email or Phone Number',
                       fillColor: Colors.white
                     ),
                   ),
                 ),
               ),
               Card(
                 child: SizedBox(
                   width: double.infinity,
                   height: 150.h,
                   child:  TextField(
                     controller: complaintTextEditingController,
                     minLines: 1,
                     maxLines: null,
                     // expands: true,
                     decoration:  InputDecoration(
                         contentPadding: EdgeInsets.only(left: 10.w),
                       enabledBorder: InputBorder.none,
                       focusedBorder: InputBorder.none,
                       hintText: "Enter Your Massage"
                     ),
                   ),
                 ),
               ),
              SizedBox(height: 10.h,),
              Align(
                alignment: Alignment.topRight,
                child: ElevatedButton(
                    onPressed: (){
                  if(emailEditingController.text.toString().contains("@")){
                  if(emailEditingController.text.length < 6){
                    AppConstant.flutterToastError(message: "enter valid email");
                  }else{
                    if(complaintTextEditingController.text.length < 10){
                      AppConstant.flutterToastError(message: "complaint must be greater then 10 character");
                    }else{
                      AppConstant.flutterToastWithMessage(
                        message: "Congratulation successfully submit your complaint",
                      );
                      Get.back();
                    }
                  }
                  }else{
                    AppConstant.flutterToastError(message: "Please enter valid email");
                  }
                }, child: const Text('Submit',style: TextStyle(color: Colors.black),)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
