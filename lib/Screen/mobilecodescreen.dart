import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utils/appcolors.dart';

class MobileCodeScreen extends StatelessWidget {
  MobileCodeScreen({Key? key}) : super(key: key);
  List<String> mobileNames = [
    "Android",
    "iOS",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundBlackColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 70.h,
                margin: EdgeInsets.symmetric(vertical: 5.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: const Center(
                  child: Text("Android"),
                ),
              ),
              SizedBox(height: 10.h,),
              Container(
                height: 70.h,
                margin: EdgeInsets.symmetric(vertical: 5.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: const Center(
                  child: Text("iOS"),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
