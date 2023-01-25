import 'package:flutter/material.dart';

import '../Utils/appcolors.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundBlackColor,
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Text(("About")),
            ],
          ),
        ),
      ),
    );
  }
}
