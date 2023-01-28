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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ListTile(
                leading: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                title: Text(
                  'Syed Waleed Nawaz',
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text('Software Engineer',
                    style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Fill the below Information',
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                child: TextField(
                  controller: nameTextEditingController,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 10),
                      hintText: 'Enter Your Name'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                child: TextField(
                  controller: emailEditingController,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 10),
                      hintText: 'Enter Your Email'),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                child: TextField(
                  controller: phoneEditingController,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 10),
                      hintText: 'Enter Your Phone'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                child: TextField(
                  controller: messageEditingController,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 10),
                      hintText: 'Enter Your Massage'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topRight,
                child: ElevatedButton(
                    onPressed: () {
                      if (nameTextEditingController.text.isNotEmpty) {
                        if (emailEditingController.text.length > 6) {
                          if(phoneEditingController.text.length > 10){
                            if(messageEditingController.text.length > 10){
                              AppConstant.flutterToastWithMessage(message: "we will contact after some time!");
                              Get.back();
                            }else{
                              AppConstant.flutterToastError(message: "message length must be greater then 10 character");
                            }
                          }else{
                            AppConstant.flutterToastError(message: "enter valid phone number");
                          }
                        } else {
                          AppConstant.flutterToastError(
                              message: "enter valid email");
                        }
                      } else {
                        AppConstant.flutterToastError(
                            message: "name is not empty");
                      }
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(color: Colors.black),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
