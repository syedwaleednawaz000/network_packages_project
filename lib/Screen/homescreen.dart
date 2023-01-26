import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:network_packages_project/Screen/packageselection.dart';
import 'package:network_packages_project/Utils/appcolors.dart';
import 'package:network_packages_project/Utils/appimages.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  List<String> imageList = [
    AppImages.ufoneLogo,
    AppImages.zongLogo,
    AppImages.jazzLogo,
    AppImages.telenorLogo,
    AppImages.waridLogo,
    AppImages.ptclLogo,
    AppImages.nayatelLogo
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundBlackColor,
      body: SafeArea(
        child: Container(
          padding:  EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListView.builder(
                    itemCount: imageList.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      Get.to(()=> PackageSelectionScreen());
                    },
                    child: Container(
                      height: 70.h,
                      margin:  EdgeInsets.symmetric(vertical: 5.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Center(
                        child: Image.asset(
                          imageList[index],
                          height: 50.h,
                          fit: BoxFit.cover,
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
