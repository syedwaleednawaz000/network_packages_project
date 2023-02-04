// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:network_packages_project/Screen/packageselection.dart';
// import 'package:network_packages_project/Utils/appcolors.dart';
// import 'package:network_packages_project/Utils/appimages.dart';
//
// class HomeScreen extends StatelessWidget {
//   HomeScreen({Key? key}) : super(key: key);
//   List<String> nameList = [
//     'Ufone',
//     'Zong',
//     'Jazz',
//     'Telenor',
//     'Warid',
//     'PTCL',
//     'NAYATEL',
//   ];
//   List<String> imageList = [
//     AppImages.ufoneLogo,
//     AppImages.zongLogo,
//     AppImages.jazzLogo,
//     AppImages.telenorLogo,
//     AppImages.waridLogo,
//     AppImages.ptclLogo,
//     AppImages.nayatelLogo
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.backgroundBlackColor,
//       body: SafeArea(
//         child: Container(
//           padding:  EdgeInsets.symmetric(horizontal: 20.w),
//           child: SingleChildScrollView(
//             physics: const BouncingScrollPhysics(),
//             child: Column(
//               // mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ListView.builder(
//                     itemCount: imageList.length,
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemBuilder: (context, index) {
//                   return InkWell(
//                     onTap: (){
//                       Get.to(()=> PackageSelectionScreen(
//                         selectIndex: index,
//                         name: nameList[index],
//                         image: imageList[index],
//                       ));
//                       print("this is our name ${nameList[index].toString()}");
//                     },
//                     child: Container(
//                       height: 70.h,
//                       margin:  EdgeInsets.symmetric(vertical: 5.w),
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           color: Colors.white),
//                       child: Center(
//                         child: Image.asset(
//                           imageList[index],
//                           height: 50.h,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                   );
//                 }),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:network_packages_project/Screen/packageselection.dart';
import 'package:network_packages_project/Utils/appcolors.dart';
import 'package:network_packages_project/Utils/appimages.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  List<String> nameList = [
    'Ufone',
    'Zong',
    'Jazz',
    'Telenor',
    'Warid',
    'PTCL',
    'NAYATEL',
  ];
  List<String> imageList = [
    AppImages.ufoneLogo,
    AppImages.zongLogo,
    AppImages.jazzLogo,
    AppImages.telenorLogo,
    AppImages.waridLogo,
    AppImages.ptclLogo,
    AppImages.nayatelLogo
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundBlackColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListView.builder(
                    itemCount: imageList.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        height: 70.h,
                        margin: EdgeInsets.symmetric(vertical: 5.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: OpenContainer(
                          transitionType: ContainerTransitionType.fade,
                          closedBuilder:
                              (BuildContext _, VoidCallback openContainer) {
                            return GestureDetector(
                              onTap: openContainer,
                              child: Center(
                                child: Image.asset(
                                  imageList[index],
                                  height: 50.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                          openBuilder: (BuildContext _, VoidCallback __) {
                            return PackageSelectionScreen(
                              selectIndex: index,
                              name: nameList[index],
                              image: imageList[index],
                            );
                          },
                          onClosed: (_) => print('Closed'),
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
