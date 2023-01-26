import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:network_packages_project/Utils/appcolors.dart';
import 'package:network_packages_project/Utils/appimages.dart';
import 'package:network_packages_project/Widget/appBar.dart';
class PackageSelectionScreen extends StatelessWidget {
  const PackageSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarWidget(
          title: "All Ufone Packages",
        ),
        backgroundColor: AppColors.backgroundBlackColor,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
          Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Container(
            height: 90,
            width: double.infinity,
            // width: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white),
            child: Container(
              height: 70,
              // width: 350,
              child: Row(
                children: [
                  SizedBox(width: 20.w,),
                  Image.asset(AppImages.ufoneLogo,width: 80.w,height: 60.h,),
                  SizedBox(width: 30.w,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.w,),
                      Text("test",style: TextStyle(color: Colors.black),),
                      SizedBox(height: 8.w,),
                      Row(
                        children: [
                          Text("test12",style: TextStyle(color: Colors.black),),
                          SizedBox(width: 10.w,),
                          Text("test234",style: TextStyle(color: Colors.black),)
                        ],
                      ),


                    ],
                  ),
                  const Spacer(),
                  Padding(
                    padding:  EdgeInsets.only(bottom: 50.h,right: 10.w),
                    child: Icon(Icons.favorite,color: Colors.red,),
                  )
                ],
              ),
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
