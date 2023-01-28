import 'dart:convert';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:network_packages_project/Utils/appcolors.dart';
import 'package:network_packages_project/Utils/appcontant.dart';
import 'package:network_packages_project/Widget/appBar.dart';
import 'package:share_plus/share_plus.dart';


class MobileCodeDetailScreen extends StatelessWidget {
  int? index;
  String? name;
  String? image;
   MobileCodeDetailScreen({required this.image,required this.index,required this.name,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundBlackColor,
      appBar: AppBarWidget(title: "$name Hidden Key"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              FutureBuilder(
                  future: DefaultAssetBundle.of(context).loadString( index == 0 ? "assets/Json/MobidelCodeJson/androidsecretjson.json" : "assets/Json/MobidelCodeJson/iossecretjson.json"),
                  builder: (context, snapshot) {
                    var myData = json.decode(snapshot.data.toString());
                    if (myData == null) {
                      return const Center(
                        child: Text(
                          "Loading...",
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                      );
                    } else {
                      return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ListView.builder(
                                  itemCount: myData.length,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        // height: 150.h,
                                        padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 10.h, bottom: 10.h),
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Colors.white),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(height: 10,),
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                SizedBox(
                                                    height: 50,
                                                    width: 80,
                                                    child: Image.asset(image!)),
                                                const SizedBox(width: 5,),
                                                Text("${name} Find ${myData[index]['name'].toString().substring(0,11)}",overflow: TextOverflow.ellipsis,),
                                              ],
                                            ),
                                            const SizedBox(height: 10,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                SizedBox(
                                                  // color: Colors.yellow,
                                                  width: MediaQuery.of(context).size.width*0.38,
                                                  child: Text(myData[index]['name'],overflow: TextOverflow.ellipsis,style: const TextStyle(
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold)),
                                                ),

                                                SizedBox(
                                                  // color: Colors.yellow,
                                                  width: MediaQuery.of(context).size.width*0.38,
                                                  child: Align(
                                                    alignment: Alignment.topRight,
                                                    child: Text(myData[index]['code'],overflow: TextOverflow.ellipsis,style: const TextStyle(
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.bold)),
                                                  ),
                                                )
                                              ],),
                                            SizedBox(
                                              height: 15.h,
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
                                                      callNumber(number: myData[index]['code']);
                                                    },
                                                    child: const Icon(Icons.dialer_sip_outlined)),
                                                GestureDetector(
                                                    onTap: () {
                                                      FlutterClipboard.copy(myData[index]['code']).then(( value ) {
                                                        AppConstant.flutterToast();
                                                        if (kDebugMode) {
                                                          print('copied');
                                                        }
                                                      });
                                                    }, child: const Icon(Icons.copy))
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            ],
                          ));
                    }
                  }),
               ],
          ),
        ),
      ),
    );
  }

  void shareText() {
    Share.share('this is the share Text');
  }

  void callNumber({required String number}) async {
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
  }
}