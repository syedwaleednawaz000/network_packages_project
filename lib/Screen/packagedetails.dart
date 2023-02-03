import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:network_packages_project/Model/details_model.dart';
import 'package:network_packages_project/Utils/appcolors.dart';
import 'package:network_packages_project/Utils/appcontant.dart';
import 'package:network_packages_project/Widget/appBar.dart';
import 'package:share_plus/share_plus.dart';

class PackageDetailsScreen extends StatelessWidget {
  int? selectIndex;
  PackageDetailsScreen({Key? key, required this.selectIndex,required this.image}) : super(key: key);

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
              FutureBuilder(
                  future: DefaultAssetBundle.of(context).loadString("assets/Json/UfoneJson/monthly.json"),
                  initialData: Hive.box<DetailsModel>('details').listenable(),
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
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    print(" data length ${myData.length}");
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    // height: 150.h,
                                    padding: EdgeInsets.only(
                                        left: 10.w,
                                        right: 10.w,
                                        top: 10.h,
                                        bottom: 10.h),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context).size.width*0.2,
                                              child: Image.asset(
                                                image.toString(),
                                                width: 50,
                                                height: 50,
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context).size.width*0.45,
                                              child: Text(
                                                myData[index]['package_name'],style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight:
                                                  FontWeight.bold)
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context).size.width*0.1,
                                              child: InkWell(
                                                  onTap: () {
                                                    // Adding to hive database using box
                                                    Hive.box<DetailsModel>('details').add(
                                                            DetailsModel(
                                                                packageName: myData[index]['package_name'],
                                                                price: myData[index]['price'],
                                                                onNetMints: myData[index]['on_minutes'],
                                                                ofNetMints: myData[index]['off_minute'],
                                                                mb: myData[index]['mb'],
                                                                socialMB: myData[index]['social_mb'],
                                                                sMS: myData[index]['sms'],
                                                                activationCode: myData[index]['activation_code'],
                                                                deactivationCode: '*8374#',
                                                                //this index used for image condition in fav screen
                                                                companyImage: selectIndex.toString()));
                                                    AppConstant
                                                        .flutterToastWithMessage(
                                                            message:
                                                                "Successfully Added");
                                                  },
                                                  child: const Icon(
                                                    Icons.favorite_outline,
                                                    color: Colors.black,
                                                  )),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: const [
                                            Text('Rs',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text('On Net Minutes',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text('Off Net Minutes',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children:  [
                                            Container(
                                              width: MediaQuery.of(context).size.width*0.1,
                                              child: Text(myData[index]['price'],
                                                  style: const TextStyle(
                                                      fontSize: 15),),
                                            ),
                                            SizedBox(width: MediaQuery.of(context).size.width*0.2,),
                                            Container(
                                              width: MediaQuery.of(context).size.width*0.357,
                                              child: Text(myData[index]['on_minutes'],
                                                  style: const TextStyle(
                                                      fontSize: 15,)),
                                            ),
                                            Text(myData[index]['off_minute'],
                                                style: const TextStyle(
                                                    fontSize: 15,)),
                                          ],
                                        ),
                                        Divider(thickness: 1,height: 4,),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: const [
                                            Text('MB',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text('Social MB',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text('SMS',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width*0.3,
                                              child: Text(myData[index]['mb'],
                                                  style: const TextStyle(
                                                      fontSize: 13,)),
                                            ),
                                             SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                                             SizedBox(
                                               width: MediaQuery.of(context).size.width*0.37,
                                               child: Text(myData[index]['social_mb'],
                                                  style: const TextStyle(
                                                      fontSize: 13,)),
                                             ),
                                            // const Spacer(),
                                            Text(myData[index]['sms'],
                                                style: const TextStyle(
                                                    fontSize: 13,)),
                                          ],
                                        ),
                                        Divider(thickness: 1,height: 4,),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: const [
                                            Text(
                                              'Activation Code:',
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text('Deactivation Code:',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children:  [
                                            Text(
                                              myData[index]['activation_code'],
                                              style: const TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold),
                                            ),

                                            const Text('23534',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ],
                                        ),
                                        Divider(thickness: 1,height: 4,),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            GestureDetector(
                                                onTap: () {
                                                  shareText();
                                                },
                                                child: const Icon(
                                                    Icons.share_outlined)),
                                            GestureDetector(
                                                onTap: () {
                                                  _callNumber(number: '232');
                                                },
                                                child: const Icon(
                                                    Icons.dialer_sip_outlined)),
                                            GestureDetector(
                                                onTap: () {
                                                  FlutterClipboard.copy(
                                                          "just for test")
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

  void _callNumber({required String number}) async {
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
  }
}
