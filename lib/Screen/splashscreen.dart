import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:network_packages_project/Screen/bottomnaviagtionscreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 2), (){
      Get.to(()=> DashBoardScreen());
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Text(("Splash")),
            ],
          ),
        ),
      ),
    );
  }
}
