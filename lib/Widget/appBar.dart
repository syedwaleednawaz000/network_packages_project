import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:network_packages_project/Utils/appcolors.dart';

import '../Screen/notificationscreen.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
   AppBarWidget({Key? key,required  this.title}) : super(key: key);
  String? title;
  @override
  // TODO: implement preferredSize
  Size get preferredSize =>  Size.fromHeight(50.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backgroundBlackColor,
      title:  Container(
          padding: const EdgeInsets.only(left: 10),
          child:  Text(title.toString(),style: TextStyle(color: Colors.white),)),
      elevation: 0,
      automaticallyImplyLeading: false,
      actions:  [
        InkWell(
            onTap: (){
              Get.to(()=> NotificationScreen());
            },
            child: const Icon(Icons.notification_important_outlined,color: Colors.white,)),
        SizedBox(width: 22.w)
      ],

    );
  }


}
