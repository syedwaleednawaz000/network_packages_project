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
  TextEditingController textEditingController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBarWidgetSecond(title: 'Complainent'),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children:   [
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
              child: Card(
                child: SizedBox(
                  width: double.infinity,
                  child: TextField(
                    controller: emailEditingController,
                    decoration: const InputDecoration(
                      focusColor: Colors.blue,
                      hintText: 'Enter Email or Phone Number',
                      fillColor: Colors.white
                    ),
                  ),
                ),
              ),
            ),
             Card(
               child: Container(
                 width:300.w ,
                 height: 150.h,
                 child:  TextField(
                   controller: textEditingController,
                   minLines: 1,
                   maxLines: null,
                   expands: true,
                   decoration: const InputDecoration(
                     enabledBorder: InputBorder.none,
                     focusedBorder: InputBorder.none,
                     hintText: "Enter Your Massage"
                   ),
                 ),
               ),
             ),

            Padding(
              padding: const EdgeInsets.only(left: 220),
              child: ElevatedButton(onPressed: (){
                if(emailEditingController.text.toString().contains("@")){
                if(emailEditingController.text.length < 6){
                  AppConstant.flutterToastError(message: "enter valid email");
                }else{
                  if(textEditingController.text.length < 10){
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
              }, child: const Text('Submit',style: TextStyle(color: Colors.white),)),
            )
          ],
        ),
      ),
    );
  }
}
