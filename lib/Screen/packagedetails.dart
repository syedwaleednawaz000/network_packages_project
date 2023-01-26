import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:network_packages_project/Utils/appcolors.dart';
import 'package:network_packages_project/Widget/appBar.dart';
import 'package:share_plus/share_plus.dart';
import 'package:file_picker/file_picker.dart';


import '../Utils/appimages.dart';

class PackageDetailsScreen extends StatelessWidget {
  PackageDetailsScreen({Key? key, required this.image}) : super(key: key);

  List<String> NameList = ["Ufone"];

  String? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundBlackColor,
      appBar: AppBarWidget(title: "All Details Of Package"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                // height: 150.h,
                padding: EdgeInsets.only(left: 15.w,right: 15.w,top: 10.h,bottom: 10.h),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          image.toString(),
                          width: 50,
                          height: 50,
                        ),
                        Text(
                          NameList[0],
                        ),
                        Icon(Icons.handshake_rounded),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Rs 120',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                        Text('200 mints',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                        Text('onMints',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('MB 1000',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                        Text('SMS',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                        Text('Social MB',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Activation Code: 2123',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),

                        Text('Deactivation Code: 2143',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),

                      ],
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: () {
                             ShareText();
                              // FlutterShare.share(
                              //     title:
                              //     'https://play.google.com/store/apps/details?id=com.instructivetch.testapp');
                              // FlutterShare.share(title: 'https://play.google.com/store/apps/details?id=com.instructivetch.testapp');
                            },
                            child: Icon(Icons.share_outlined)),
                        GestureDetector(
                            onTap: () {
                               _callNumber(number: '232');
                            }, child: Icon(Icons.dialer_sip_outlined)),
                        GestureDetector(onTap: () {

                        }, child: Icon(Icons.copy))
                      ],
                    )
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );

  }





  void ShareText(){
    Share.share('this is the share Text');
  }

  void _callNumber({required String number}) async {
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
  }
}
