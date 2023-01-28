import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:network_packages_project/Widget/appBar.dart';

import '../Utils/appcontant.dart';
import '../Widget/appbarwidgetsecond.dart';
class ContactScreenPage extends StatefulWidget {
  const ContactScreenPage({Key? key}) : super(key: key);

  @override
  State<ContactScreenPage> createState() => _ContactScreenPageState();
}

class _ContactScreenPageState extends State<ContactScreenPage> {
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController phoneEditingController = TextEditingController();
  TextEditingController messageEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBarWidgetSecond(title: 'Contact Us'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              const ListTile(
                leading: Icon(Icons.person,color: Colors.white,),
                title: Text('Syed Waleed Nawaz',style: TextStyle(color: Colors.white),),
                subtitle: Text('Software Engineer',style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(height: 10,),
              const Text('Fill the below Information',textAlign: TextAlign.start,style: TextStyle(color: Colors.white,fontSize:25,fontWeight: FontWeight.bold),),
              const SizedBox(height: 10,),
               Card(
                child: TextField(
                  controller: nameTextEditingController,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 10),
                    hintText: 'Enter Your Name'
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Card(
                child: TextField(
                  controller: emailEditingController,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 10),
                      hintText: 'Enter Your Email'
                  ),

                ),
              ),
              SizedBox(height: 10,),
              Card(
                child: TextField(
                  controller: phoneEditingController,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 10),
                      hintText: 'Enter Your Phone'
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Card(
                child: TextField(
                  controller: messageEditingController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 10),
                      hintText: 'Enter Your Massage'
                  ),

                ),
              ),
              const SizedBox(height: 10,),
              Align(
                alignment: Alignment.topRight,
                child: ElevatedButton(
                    onPressed: (){
                      if(emailEditingController.text.toString().contains("@")){
                        if(emailEditingController.text.length < 6){
                          AppConstant.flutterToastError(message: "enter valid email");
                        }else{
                          if(nameTextEditingController.text.length < 10){
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
