import 'package:clipboard/clipboard.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:network_packages_project/Controller/imgcontroller.dart';
import 'package:network_packages_project/Utils/appcontant.dart';
import 'package:share_plus/share_plus.dart';

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
  List<String> codeNumber = [
    "123",
    "234",
    "345",
    "456",
    "5676",
    "567",
  ];
  List<String> NameList = [
    "Ufone",
    "Jazz",
    "Telenor",
    "Warid",
    "ptcl",
    "nayate"
  ];

  List<String> faveIcons = [];
  Imgcontroller _imgcontroller = Get.put(Imgcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundBlackColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Text(("Favourtie")),
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _imgcontroller.getModelimgData.length,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    _imgcontroller.getModelimgData[index].img
                                        .toString(),
                                    width: 50,
                                    height: 50,
                                  ),
                                  Text(NameList[index]),
                                  InkWell(
                                      onTap: () {
                                        // hive remove code here
                                      },
                                      child: const Icon(
                                        Icons.favorite,
                                        color: Colors.pinkAccent,
                                      )),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Activation Code:',
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text('Deactivation Code:',
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              SizedBox(
                                height: 7.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${codeNumber[index]}',
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text('2143',
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              SizedBox(
                                height: 7.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                      child: const Icon(
                                          Icons.dialer_sip_outlined)),
                                  GestureDetector(
                                      onTap: () {
                                        FlutterClipboard.copy(codeNumber[index])
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
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void shareText() {
    Share.share('this is the favarite shere screen');
  }

  void _callNumber({required String number}) async {
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
  }
}
