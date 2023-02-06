import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:network_packages_project/Screen/mobielcodedetailscreen.dart';

import '../Utils/appcolors.dart';

class MobileCodeScreen extends StatefulWidget {
  MobileCodeScreen({Key? key}) : super(key: key);

  @override
  State<MobileCodeScreen> createState() => _MobileCodeScreenState();
}

class _MobileCodeScreenState extends State<MobileCodeScreen> {
  List<String> mobileNames = [
    "Android",
    "iOS",
  ];
  static int maxFailedLoadAttempts = 3;

  static final AdRequest request = AdRequest(
    keywords: <String>['foo', 'bar'],
    contentUrl: 'http://foo.com/bar.html',
    nonPersonalizedAds: true,
  );
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
  InterstitialAd? _interstitialAd;
  int _numInterstitialLoadAttempts = 0;


  bool _largePhoto = false;
  final BannerAd myBanner = BannerAd(
    adUnitId: 'ca-app-pub-3940256099942544/6300978111',
    size: AdSize.largeBanner,
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
    return Scaffold(
      backgroundColor: AppColors.backgroundBlackColor,
      bottomNavigationBar: Container(
        alignment: Alignment.center,
        width: myBanner.size.width.toDouble(),
        height: myBanner.size.height.toDouble(),
        child: AdWidget(ad: myBanner),
      ),
      body: timerValue ? Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(color: Colors.white,),
          Text(" براہ کرم ${_start.toString()} سیکنڈ انتظار کریں۔ ",textDirection: TextDirection.rtl,style: TextStyle(color: _start == 1 ? Colors.green: _start == 2 ? Colors.red:  Colors.white,fontWeight: FontWeight.bold),)
        ],
      ),): SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: (){
                  _showInterstitialAd();
                  Get.to(()=> MobileCodeDetailScreen(
                    index: 0,
                    image: 'assets/images/android_logo.png',
                    name: "Android",
                  ));
                },
                child: Container(
                  height: 70,
                  margin: EdgeInsets.symmetric(vertical: 5.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        child: Image.asset('assets/images/android_logo.png',width: 80.w,),
                      ),
                      SizedBox(width: 10.w,),
                      Text('Hidden key',style: TextStyle(fontSize: 25.sp,fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.h,),
              InkWell(
                onTap: (){
                  Get.to(()=> MobileCodeDetailScreen(
                    name: "iOS",
                    index: 1,
                    image: 'assets/images/ios_logo.png',
                  ));
                },
                child: Container(
                  height: 70.h,
                  margin: EdgeInsets.symmetric(vertical: 5.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Image.asset('assets/images/ios_logo.png',width: 80.w),
                      SizedBox(width: 10.h,),
                      Text('Hidden key',style: TextStyle(fontSize: 25.sp,fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
