import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Utils/appcolors.dart';
import 'aboutscreenpage.dart';
import 'complainetscreenpage.dart';
import 'contactscreenpage.dart';
import 'notificationscreen.dart';

class AboutScreen extends StatefulWidget {
  AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  bool notification = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundBlackColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 GestureDetector(
                   onTap: (){
                     Get.to(NotificationScreen());
                   },
                   child: const Text(
                      "Notification",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                 ),
                  Switch(
                      value: notification,
                      onChanged: (value) {
                        setState(() {
                          notification = value;
                        });
                      }),
                ],
              ),
            const SizedBox(height: 15,),

               GestureDetector(
                 onTap: (){
                   Get.to(AboutScreenPage());
                 },
                 child: const SizedBox(
                   width: double.infinity,
                   child: Text("About us",

                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                 ),
               ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: (){
                  Get.to(ContactScreenPage());
                },
                child: const SizedBox(
                  width: double.infinity,
                  child: Text("Contact us",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: (){
                  Get.to(ComplainentScreenPage());
                },
                child: const SizedBox(
                  width: double.infinity,
                  child: Text("Complaint",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
