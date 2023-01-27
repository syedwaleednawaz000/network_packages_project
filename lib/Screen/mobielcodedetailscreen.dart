import 'dart:convert';

import 'package:clipboard/clipboard.dart';
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
   MobileCodeDetailScreen({required this.index,required this.name,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundBlackColor,
      appBar: AppBarWidget(title: "$name Codes"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              index == 0 ?              FutureBuilder(
                  future: DefaultAssetBundle.of(context).loadString("assets/Json/MobidelCodeJson/androidsecretjson.json"),
                  builder: (context, snapshot) {
                    var mydata = json.decode(snapshot.data.toString());
                    if (mydata == null) {
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
                                  itemCount: mydata.length,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
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
                                                Text('Name',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.bold)),
                                                Text('Code',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.bold)),

                                              ],
                                            ),
                                            SizedBox(height: 10,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Container(
                                                  // color: Colors.yellow,
                                                  width: MediaQuery.of(context).size.width*0.38,
                                                  child: Text(mydata[index]['name'],overflow: TextOverflow.ellipsis,style: const TextStyle(
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold)),
                                                ),

                                                SizedBox(
                                                  // color: Colors.yellow,
                                                  width: MediaQuery.of(context).size.width*0.38,
                                                  child: Align(
                                                    alignment: Alignment.topRight,
                                                    child: Text(mydata[index]['code'],overflow: TextOverflow.ellipsis,style: const TextStyle(
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.bold)),
                                                  ),
                                                )
                                              ],),
                                            SizedBox(
                                              height: 7.h,
                                            ),

                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                                    child: const Icon(Icons.dialer_sip_outlined)),
                                                GestureDetector(
                                                    onTap: () {}, child: Icon(Icons.copy))
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
                  }):               FutureBuilder(
                  future: DefaultAssetBundle.of(context).loadString("assets/Json/MobidelCodeJson/iossecretjson.json"),
                  builder: (context, snapshot) {
                    var mydata = json.decode(snapshot.data.toString());
                    if (mydata == null) {
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
                                  itemCount: mydata.length,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
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
                                              children: const [
                                                Text('Name',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.bold)),
                                                Text('Code',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.bold)),

                                              ],
                                            ),
                                            SizedBox(height: 10,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Container(
                                                  // color: Colors.yellow,
                                                  width: MediaQuery.of(context).size.width*0.38,
                                                  child: Text(mydata[index]['name'],overflow: TextOverflow.ellipsis,style: const TextStyle(
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.bold)),
                                                ),

                                                Container(
                                                  // color: Colors.yellow,
                                                  width: MediaQuery.of(context).size.width*0.38,
                                                  child: Align(
                                                    alignment: Alignment.topRight,
                                                    child: Text(mydata[index]['code'],overflow: TextOverflow.ellipsis,style: const TextStyle(
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.bold)),
                                                  ),
                                                )
                                              ],),
                                            SizedBox(
                                              height: 7.h,
                                            ),

                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                GestureDetector(
                                                    onTap: () {
                                                      ShareText();
                                                    },
                                                    child: const Icon(Icons.share_outlined)),
                                                GestureDetector(
                                                    onTap: () {
                                                      _callNumber(number: mydata[index]['code']);
                                                    },
                                                    child: const Icon(Icons.dialer_sip_outlined)),
                                                GestureDetector(
                                                    onTap: () {
                                                      FlutterClipboard.copy(mydata[index]['code']).then(( value ) {
                                                        AppConstant.flutterToast();
                                                        print('copied');
                                                      });
                                                    }, child: Icon(Icons.copy))
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
                  })
            ],
          ),
        ),
      ),
    );
  }

  void ShareText() {
    Share.share('this is the share Text');
  }

  void _callNumber({required String number}) async {
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
  }
}