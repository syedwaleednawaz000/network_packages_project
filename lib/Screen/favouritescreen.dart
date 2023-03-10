import 'package:clipboard/clipboard.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:network_packages_project/Controller/imgcontroller.dart';
import 'package:network_packages_project/Model/details_model.dart';
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
  final Imgcontroller _imgcontroller = Get.put(Imgcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundBlackColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                ValueListenableBuilder<Box<DetailsModel>>(
                  valueListenable:
                      Hive.box<DetailsModel>('details').listenable(),
                  builder: (context, Box box, _) {
                    if (box.path == null) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      );
                    } else {
                      return ListView.builder(
                          itemCount: box.values.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final detail = box.getAt(index);
                            print("this si our length ${box.length}");
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                // height: 150.h,
                                padding: EdgeInsets.only(
                                    left: 15.w,
                                    right: 15.w,
                                    top: 10.h,
                                    bottom: 10.h),
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
                                        Container(
                                          width: MediaQuery.of(context).size.width*0.2,
                                          child: Image.asset(
                                            detail.companyImage.toString() == "0" ? AppImages.ufoneLogo :
                                            detail.companyImage.toString() == "1" ? AppImages.zongLogo:
                                            detail.companyImage.toString() == "2" ? AppImages.jazzLogo :
                                            detail.companyImage.toString() == "3" ? AppImages.telenorLogo:
                                            detail.companyImage.toString() == "4" ? AppImages.waridLogo :
                                            detail.companyImage.toString() == "5" ? AppImages.ptclLogo :
                                            AppImages.nayatelLogo,
                                            width: 50,
                                            height: 50,
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context).size.width*0.4,
                                          child: Text(detail.packageName.toString(),
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context).size.width*0.1,
                                          child: InkWell(
                                              onTap: () {
                                                // hive remove code here
                                                box.deleteAt(index);
                                                AppConstant.flutterToastWithMessage(
                                                    message:
                                                        "Successfully Deleted");
                                              },
                                              child: Row(
                                                children: [
                                                  Spacer(),
                                                  const Icon(
                                                    Icons.favorite,
                                                    color: Colors.pinkAccent,
                                                  ),
                                                ],
                                              )),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children:  [
                                        Text('RS',
                                            style: TextStyle(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.bold)),
                                        Text('On Net Minutes',
                                            style: TextStyle(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.bold)),
                                        Text('Off Net Minutes',
                                            style: TextStyle(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    SizedBox(height: 7,),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context).size.width*0.3,
                                          child: Text(detail.price.toString(),
                                              style: const TextStyle(
                                                  fontSize: 15,)),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context).size.width*0.3,
                                          child: Text(detail.onNetMints.toString(),
                                              style: const TextStyle(
                                                  fontSize: 15,)),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context).size.width*0.1,
                                          child: Text(detail.ofNetMints.toString(),
                                              style: const TextStyle(
                                                  fontSize: 15,)),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children:  [

                                        Container(
                                          width: MediaQuery.of(context).size.width*0.3,
                                          child: Text('Internet MB',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context).size.width*0.3,
                                          child: Text('Social MB',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context).size.width*0.1,
                                          child: Text('SMS',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context).size.width*0.3,
                                          child: Text(detail.mb.toString(),
                                              style: const TextStyle(
                                                  fontSize: 15,)),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context).size.width*0.3,
                                          child: Text(detail.socialMB.toString(),
                                              style: const TextStyle(
                                                  fontSize: 15,)),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context).size.width*0.1,
                                          child: Text(detail.sMS.toString(),
                                              style: const TextStyle(
                                                  fontSize: 15,)),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Activation Code',
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text('Deactivation Code',
                                            style: TextStyle(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          detail.activationCode.toString(),
                                          style: TextStyle(
                                              fontSize: 15.sp,),
                                        ),
                                        SizedBox(width: 102.w,),
                                        Text(detail.deactivationCode.toString(),
                                            style: TextStyle(
                                                fontSize: 15.sp,)),
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
                                              shareText(
                                                shareText: codeNumber[index],
                                              );
                                            },
                                            child: const Icon(
                                                Icons.share_outlined)),
                                        GestureDetector(
                                            onTap: () {
                                              _callNumber(
                                                  number: codeNumber[index]);
                                            },
                                            child: const Icon(
                                                Icons.dialer_sip_outlined)),
                                        GestureDetector(
                                            onTap: () {
                                              FlutterClipboard.copy(
                                                      codeNumber[index])
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
                          });
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void shareText({required String shareText}) {
    Share.share(shareText);
  }

  void _callNumber({required String number}) async {
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
  }
}
