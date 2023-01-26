import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:network_packages_project/Controller/imgcontroller.dart';

import '../Utils/appcolors.dart';
import '../Utils/appimages.dart';

class FavouriteScreen extends StatelessWidget {


   FavouriteScreen({Key? key}) : super(key: key);

  List<String> imageList = [
    AppImages.ufoneLogo,
    AppImages.jazzLogo,
    AppImages.telenorLogo,
    AppImages.waridLogo,
    AppImages.ptclLogo,
    AppImages.nayatelLogo
  ];
    Imgcontroller _imgcontroller =Get.put(Imgcontroller());
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.backgroundBlackColor,
      body: SafeArea(
        child: Container(
          padding:  EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(("Favourtie")),

                ListView.builder(
                  shrinkWrap: true,
                    itemCount:_imgcontroller.getModelimgData.length,
                    itemBuilder: (context,index){
                  return Padding(
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
                            Image.asset(_imgcontroller.getModelimgData[index].img.toString(),width: 80.w,height: 60.h,),
                            SizedBox(width: 30.w,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(height: 10.w,),
                                Text(_imgcontroller.getModelimgData[index].Text.toString(),style: TextStyle(color: Colors.black),),
                                SizedBox(height: 8.w,),
                                Row(
                                  children: [
                                    Text(_imgcontroller.getModelimgData[index].text1.toString(),style: TextStyle(color: Colors.black),),
                                    SizedBox(width: 10.w,),
                                    Text(_imgcontroller.getModelimgData[index].text2.toString(),style: TextStyle(color: Colors.black),)
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
                  );
                }),

                // ListTile(
                //   leading: Image.asset('assets/images/ufone_logo.png',width: 80,height: 60,),
                //
                // ),
                
                // ListView.builder(
                //   shrinkWrap: true,
                //     itemCount: _imgcontroller.getModelimgData.length,
                //     itemBuilder:(context,index){
                //   return Container(
                //     width: 200.w,
                //     height: 70.h,
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(50),
                //       color: Colors.red,
                //
                //     ),
                //     child: Image.asset(_imgcontroller.getModelimgData[index].img.toString()),
                //   );
                // }),

                // ListView.builder(
                //     itemCount: imageList.length,
                //     shrinkWrap: true,
                //     physics: NeverScrollableScrollPhysics(),
                //     itemBuilder: (context, index) {
                //       return Container(
                //         height: 70.h,
                //         margin:  EdgeInsets.symmetric(vertical: 5.w),
                //         decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(10),
                //             color: Colors.white),
                //         child: Center(
                //           child: Image.asset(
                //             imageList[index],
                //             height: 50.h,
                //             fit: BoxFit.cover,
                //           ),
                //         ),
                //       );
                //     }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
