import 'package:flutter/material.dart';
import 'package:network_packages_project/Utils/appcolors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Container(
                height: 57,
                margin: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.containerGreyColor
                ),
                child: Center(
                  child: Image.asset("assets/images/ufone_logo.png",height: 30,),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
