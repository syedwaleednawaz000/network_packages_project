import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:network_packages_project/Screen/bottomnaviagtionscreen.dart';
import 'package:network_packages_project/Utils/appimages.dart';

import '../Utils/appcolors.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  DateTime now = DateTime.now();
  String formattedDate = '';
  @override
  void initState() {
    formattedDate = DateFormat('dd-MM-yyyy').format(now);
    // formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
    Timer(const Duration(seconds: 2), (){
      Get.offAll(()=> const DashBoardScreen());
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundBlackColor,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            // image: DecorationImage(
            //   image: AssetImage(AppImages.splashLogo,),fit: BoxFit.cover
            // )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:  [
              const Center(child: Text(("All packages Updated to"),style: TextStyle(color: Colors.white),)),
              Center(child: Text(("${formattedDate.toString()}"),style: const TextStyle(color: Colors.white),)),
            ],
          ),
        ),
      ),
    );
  }
}
