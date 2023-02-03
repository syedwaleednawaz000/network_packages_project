import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:network_packages_project/Screen/packagedetails.dart';
import 'package:network_packages_project/Utils/appcolors.dart';
import 'package:network_packages_project/Utils/appimages.dart';
import 'package:network_packages_project/Widget/appBar.dart';

class PackageSelectionScreen extends StatelessWidget {
  String? name ;
  PackageSelectionScreen({Key? key,required this.name,required this.image,required this.selectIndex}) : super(key: key);
  int? selectIndex;
  String? image ;
  List<String> nameList = [
    "Hourly",
    "Daily",
    "Weekly",
    "Monthly",
    "Yearly",
  ];

  @override
  Widget build(BuildContext context) {
    print("this is our name ${name.toString()} in select");
    return SafeArea(
      child: Scaffold(
        appBar: AppBarWidget(
          title: "All Ufone Packages",
        ),
        backgroundColor: AppColors.backgroundBlackColor,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                ListView.builder(
                    itemCount: nameList.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      print("this is our name ${name.toString()}");
                      Get.to(PackageDetailsScreen(
                        name: name,
                        selectIndex: selectIndex,
                        image: image,
                      ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Container(
                        height: 90,
                        width: double.infinity,
                        // width: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: SizedBox(
                          height: 70,
                          // width: 350,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 20.w,
                              ),
                              Image.asset(
                                image.toString(),
                                width: 80.w,
                                height: 60.h,
                              ),
                              SizedBox(
                                width: 30.w,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  Text(
                                    nameList[index],
                                    style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold,color: Colors.black),
                                  ),

                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
