import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:network_packages_project/Utils/appcolors.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({Key? key}) : super(key: key);
  @override
  // TODO: implement preferredSize
  Size get preferredSize =>  Size.fromHeight(50.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backgroundBlackColor,
      title:  Container(
          padding: const EdgeInsets.only(left: 10),
          child: const Text("All Network Packages")),
      elevation: 0,
      automaticallyImplyLeading: false,
      actions:  [
        const Icon(Icons.notification_important_outlined),
        SizedBox(width: 22.w)
      ],

    );
  }


}
