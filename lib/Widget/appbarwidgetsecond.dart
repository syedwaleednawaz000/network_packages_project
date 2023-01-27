import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:network_packages_project/Utils/appcolors.dart';

class AppBarWidgetSecond extends StatelessWidget
    implements PreferredSizeWidget {
  AppBarWidgetSecond({Key? key, required this.title}) : super(key: key);
  String? title;

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: AppColors.backgroundBlackColor,
      title: Container(
          padding: const EdgeInsets.only(left: 10),
          child: Text(title.toString())),
      elevation: 0,
      automaticallyImplyLeading: false,
    );
  }
}
