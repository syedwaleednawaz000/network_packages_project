import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:network_packages_project/Screen/bottomnaviagtionscreen.dart';
import 'package:network_packages_project/Utils/appimages.dart';

import '../Utils/appcolors.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  DateTime now = DateTime.now();
  String formattedDate = '';
  @override
  void initState() {
    formattedDate = DateFormat('dd-MM-yyyy').format(now);
    // formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
    Timer(const Duration(seconds: 4), (){
      Get.offAll(()=> const DashBoardScreen());
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundBlackColor,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height*1,
          decoration:  BoxDecoration(
            // image: DecorationImage(
            //   image: AssetImage('assets/images/main_logo.png',),fit: BoxFit.fill
            // )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:  [
               Center(
                   // height: MediaQuery.of(context).size.height*0.3,
                   // width: MediaQuery.of(context).size.width*0.8,
                   // decoration: BoxDecoration(
                   //   shape: BoxShape.circle
                   // ),
                   child: Image.asset('assets/images/main_logo.png',fit: BoxFit.cover,)),
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'All Network Packages',
                    textStyle:  TextStyle(
                      fontSize: 32.0.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    speed: const Duration(milliseconds: 150),
                  ),
                ],

                totalRepeatCount: 4,
                pause: const Duration(milliseconds: 1000),
                displayFullTextOnTap: true,
                stopPauseOnTap: true,
              ),
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    '${formattedDate.toString()}',
                    textStyle: const TextStyle(
                      fontSize: 32.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    speed: const Duration(milliseconds: 200),
                  ),
                ],

                totalRepeatCount: 4,
                pause: const Duration(milliseconds: 1000),
                displayFullTextOnTap: true,
                stopPauseOnTap: true,
              )
            ],
          ),
        ),
      ),
    );
  }
}
