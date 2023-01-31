import 'dart:io';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hive/hive.dart';
import 'package:network_packages_project/Model/details_model.dart';
import 'package:network_packages_project/Utils/appcolors.dart';
import 'package:network_packages_project/Utils/appcontant.dart';
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
      appBar: AppBarWidget(title: " Details Of Package"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        // height: 150.h,
                        padding: EdgeInsets.only(
                            left: 15.w, right: 15.w, top: 10.h, bottom: 10.h),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
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
                                InkWell(
                                    onTap: () {
                                      // Adding to hive database using box
                                      Hive.box<DetailsModel>('details').add(
                                          DetailsModel(
                                              price: '340',
                                              onNetMints: '569',
                                              ofNetMints: '234',
                                              mb: '1024',
                                              socialMB: '3490',
                                              sMS: '10000',
                                              activationCode: '*7548#',
                                              deactivationCode: '*8374#',
                                              shareImage: AppImages.jazzLogo,
                                              sipCallImage: 'sip call',
                                              copyImage: 'copy'));
                                      AppConstant.flutterToastWithMessage(
                                          message: "Successfully Added");
                                    },
                                    child: const Icon(
                                      Icons.favorite_outline,
                                      color: Colors.black,
                                    )),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('Rs 120',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                                Text('200 mints',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                                Text('onMints',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            SizedBox(
                              height: 7.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('MB 1000',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                                Text('SMS',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                                Text('Social MB',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            SizedBox(
                              height: 7.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Activation Code:',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text('Deactivation Code:',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            SizedBox(
                              height: 7.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  '08943',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text('23534',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
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
                                      shareText();
                                    },
                                    child: const Icon(Icons.share_outlined)),
                                GestureDetector(
                                    onTap: () {
                                      _callNumber(number: '232');
                                    },
                                    child:
                                        const Icon(Icons.dialer_sip_outlined)),
                                GestureDetector(
                                    onTap: () {
                                      FlutterClipboard.copy("just for test")
                                          .then((value) {
                                        AppConstant.flutterToast();
                                        if (kDebugMode) {
                                          print('copied');
                                        }
                                      });
                                    },
                                    child: const Icon(Icons.copy))
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }

  void shareText() {
    Share.share('this is the share Text');
  }

  void _callNumber({required String number}) async {
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
  }
}
