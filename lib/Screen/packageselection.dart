// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:network_packages_project/Screen/packagedetails.dart';
// import 'package:network_packages_project/Utils/appcolors.dart';
// import 'package:network_packages_project/Utils/appimages.dart';
// import 'package:network_packages_project/Widget/appBar.dart';
//
// class PackageSelectionScreen extends StatelessWidget {
//   String? name ;
//   PackageSelectionScreen({Key? key,required this.name,required this.image,required this.selectIndex}) : super(key: key);
//   int? selectIndex;
//   String? image ;
//   List<String> nameList = [
//     "Hourly",
//     "Daily",
//     "Weekly",
//     "Monthly",
//     "Yearly",
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     print("this is our name ${name.toString()} in select");
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBarWidget(
//           title: "All Ufone Packages",
//         ),
//         backgroundColor: AppColors.backgroundBlackColor,
//         body: Container(
//           padding: EdgeInsets.symmetric(horizontal: 20.w),
//           child: SingleChildScrollView(
//             physics: const BouncingScrollPhysics(),
//             child: Column(
//               children: [
//                 ListView.builder(
//                     itemCount: nameList.length,
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemBuilder: (context, index) {
//                   return InkWell(
//                     onTap: (){
//                       print("this is our name ${name.toString()}");
//                       Get.to(PackageDetailsScreen(
//                         name: name,
//                         selectIndex: selectIndex,
//                         image: image,
//                       ));
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.only(top: 16),
//                       child: Container(
//                         height: 90,
//                         width: double.infinity,
//                         // width: 300,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             color: Colors.white),
//                         child: SizedBox(
//                           height: 70,
//                           // width: 350,
//                           child: Row(
//                             children: [
//                               SizedBox(
//                                 width: 20.w,
//                               ),
//                               Image.asset(
//                                 image.toString(),
//                                 width: 80.w,
//                                 height: 60.h,
//                               ),
//                               SizedBox(
//                                 width: 30.w,
//                               ),
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//
//                                   Text(
//                                     nameList[index],
//                                     style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold,color: Colors.black),
//                                   ),
//
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 }),
//
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'dart:async';
import 'dart:io';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:network_packages_project/Screen/packagedetails.dart';
import 'package:network_packages_project/Utils/appcolors.dart';
import 'package:network_packages_project/Utils/appimages.dart';
import 'package:network_packages_project/Widget/appBar.dart';

class PackageSelectionScreen extends StatefulWidget {
  String? name ;
  PackageSelectionScreen({Key? key,required this.name,required this.image,required this.selectIndex}) : super(key: key);
  int? selectIndex;
  String? image ;

  @override
  State<PackageSelectionScreen> createState() => _PackageSelectionScreenState();
}

class _PackageSelectionScreenState extends State<PackageSelectionScreen> {
  List<String> nameList = [
    "Hourly",
    "Daily",
    "Weekly",
    "Monthly",
    "Yearly",
  ];
  Timer? _timer = Timer(const Duration(microseconds: 0), (){});
  int _start = 0;
  void startTimer() {
    const oneSec = Duration(seconds: 1);
    // _start = 0;
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        // for(int index = 0 ; index < weeklyDays.length ; index++){
        if (_start >= 3) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start++;
          });
        }
        // }
      },
    );
  }
  static int maxFailedLoadAttempts = 3;

  static final AdRequest request = AdRequest(
    keywords: <String>['foo', 'bar'],
    contentUrl: 'http://foo.com/bar.html',
    nonPersonalizedAds: true,
  );

  InterstitialAd? _interstitialAd;
  int _numInterstitialLoadAttempts = 0;


  bool _largePhoto = false;
  final BannerAd myBanner = BannerAd(
    adUnitId: 'ca-app-pub-3940256099942544/6300978111',
    size: AdSize.banner,
    request: AdRequest(),
    listener: BannerAdListener(),
  );


  bool timerValue = true;


  @override
  void initState() {
    super.initState();
    startTimer();
    myBanner.load();
    _createInterstitialAd();
    Timer(Duration(seconds: 3), (){
      timerValue = false;
      setState(() {

      });
    });

  }
  void _createInterstitialAd() {
    InterstitialAd.load(
        adUnitId: Platform.isAndroid
            ? 'ca-app-pub-3940256099942544/1033173712'
            : 'ca-app-pub-3940256099942544/4411468910',
        request: request,
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            print('$ad loaded');
            _interstitialAd = ad;
            _numInterstitialLoadAttempts = 0;
            _interstitialAd!.setImmersiveMode(true);
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('InterstitialAd failed to load: $error.');
            _numInterstitialLoadAttempts += 1;
            _interstitialAd = null;
            if (_numInterstitialLoadAttempts < maxFailedLoadAttempts) {
              _createInterstitialAd();
            }
          },
        ));
  }

  void _showInterstitialAd() {
    if (_interstitialAd == null) {
      print('Warning: attempt to show interstitial before loaded.');
      return;
    }
    _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) =>
          print('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        print('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        _createInterstitialAd();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        _createInterstitialAd();
      },
    );
    _interstitialAd!.show();
    _interstitialAd = null;
  }


  @override
  Widget build(BuildContext context) {
    print("this is our name ${widget.name.toString()} in select");
    return Scaffold(
      bottomNavigationBar:           Container(
        alignment: Alignment.center,
        width: myBanner.size.width.toDouble(),
        height: myBanner.size.height.toDouble(),
        child: AdWidget(ad: myBanner),
      ),
      appBar: AppBarWidget(
        title: "All Ufone Packages",
      ),
      backgroundColor: AppColors.backgroundBlackColor,
      body: timerValue ?Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(color: Colors.white,),
          Text(" براہ کرم ${_start.toString()} سیکنڈ انتظار کریں۔ ",textDirection: TextDirection.rtl,style: TextStyle(color: _start == 1 ? Colors.green: _start == 2 ? Colors.red:  Colors.white,fontWeight: FontWeight.bold),)
        ],
      ),) : PageTransitionSwitcher(
        duration: const Duration(milliseconds: 500),
        reverse: !_largePhoto,
        transitionBuilder: (
            Widget child,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            ) {
          return SharedAxisTransition(
            child: child,
            fillColor: Colors.white,
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            transitionType: SharedAxisTransitionType.vertical,
          );
        },
        child: Container(
          color: AppColors.backgroundBlackColor,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                ListView.builder(
                    itemCount: nameList.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){
                          _showInterstitialAd();
                          Get.to(PackageDetailsScreen(
                            selectionName: nameList[index],
                            name: widget.name,
                            selectIndex: widget.selectIndex,
                            image: widget.image,
                          ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Container(
                            height: 90,
                            width: double.infinity,
                            // width: 300,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: SizedBox(
                              height: 70,
                              // width: 350,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  Image.asset(
                                    widget.image.toString(),
                                    width: 80.w,
                                    height: 60.h,
                                  ),
                                  SizedBox(
                                    width: 30.w,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [

                                      Text(
                                        nameList[index],
                                        style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold,color: Colors.black),
                                      ),

                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),

              ],
            ),
          ),
        ),
      )
      ,
    );
  }
}
