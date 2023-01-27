import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:network_packages_project/Controller/imgcontroller.dart';
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
  List<String> code =[];
  List<String> NameList = [
    "Ufone",
    "Jazz",
    "Telenor",
    "Warid",
    "ptcl",
    "nayate"
  ];

  List<String> faveIcons=[

  ];
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
                                  Icon(Icons.favorite,color: Colors.pinkAccent,),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const[
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
                                children: [
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
                                    'Activation Code: 2123',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text('Deactivation Code: 2143',
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
                                  GestureDetector(
                                      onTap: () {
                                        ShareText();
                                      },
                                      child: Icon(Icons.share_outlined)),
                                  GestureDetector(
                                      onTap: () {
                                        _callNumber(number: '232');
                                      },
                                      child: Icon(Icons.dialer_sip_outlined)),
                                  GestureDetector(
                                      onTap: () {
                                        FlutterClipboard.copy('hekkk').then(( value ) =>
                                            print('copied'));
                                      }, child: Icon(Icons.copy))
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }),

                // ListView.builder(
                //   shrinkWrap: true,
                //     itemCount:_imgcontroller.getModelimgData.length,
                //     itemBuilder: (context,index){
                //   return Padding(
                //     padding: const EdgeInsets.only(top: 16),
                //     child: Container(
                //       height: 90,
                //       width: double.infinity,
                //       // width: 300,
                //       decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(10),
                //           color: Colors.white),
                //       child: Container(
                //         height: 70,
                //         // width: 350,
                //         child: Row(
                //           children: [
                //             SizedBox(width: 20.w,),
                //             Image.asset(_imgcontroller.getModelimgData[index].img.toString(),width: 80.w,height: 60.h,),
                //             SizedBox(width: 30.w,),
                //             Column(
                //               mainAxisAlignment: MainAxisAlignment.start,
                //               children: [
                //                 SizedBox(height: 10.w,),
                //                 Text(_imgcontroller.getModelimgData[index].Text.toString(),style: TextStyle(color: Colors.black),),
                //                 SizedBox(height: 8.w,),
                //                 Row(
                //                   children: [
                //                     Text(_imgcontroller.getModelimgData[index].text1.toString(),style: TextStyle(color: Colors.black),),
                //                     SizedBox(width: 10.w,),
                //                     Text(_imgcontroller.getModelimgData[index].text2.toString(),style: TextStyle(color: Colors.black),)
                //                   ],
                //                 ),
                //
                //
                //               ],
                //             ),
                //             const Spacer(),
                //             Padding(
                //               padding:  EdgeInsets.only(bottom: 50.h,right: 10.w),
                //               child: Icon(Icons.favorite,color: Colors.red,),
                //             )
                //           ],
                //         ),
                //       ),
                //     ),
                //   );
                // }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void ShareText() {
    Share.share('this is the favarite shere screen');
  }

  void _callNumber({required String number}) async {
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
  }
}
