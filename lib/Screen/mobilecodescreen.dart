import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:network_packages_project/Screen/mobielcodedetailscreen.dart';

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
              InkWell(
                onTap: (){
                  Get.to(()=> MobileCodeDetailScreen(
                    index: 0,
                    name: "Android",
                  ));
                },
                child: Container(
                  height: 70,
                  margin: EdgeInsets.symmetric(vertical: 5.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        child: Image.asset('assets/images/android_logo.png',width: 80.w,fit: BoxFit.cover,),
                      ),
                      SizedBox(width: 10.w,),
                      Text('Secret key',style: TextStyle(fontSize: 25.sp,fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.h,),
              InkWell(
                onTap: (){
                  Get.to(()=> MobileCodeDetailScreen(
                    name: "iOS",
                    index: 1,
                  ));
                },
                child: Container(
                  height: 70.h,
                  margin: EdgeInsets.symmetric(vertical: 5.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Image.asset('assets/images/ios_logo.png',width: 80.w,fit: BoxFit.cover),
                      SizedBox(width: 10.h,),
                      Text('Secret key',style: TextStyle(fontSize: 25.sp,fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
