import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:network_packages_project/Utils/appcolors.dart';
import 'package:network_packages_project/Widget/appBar.dart';
import 'package:share_plus/share_plus.dart';


class MobileCodeDetailScreen extends StatelessWidget {
 List<String> namelist=[
   ' IMEI',' RAM Memory version',' FTA SW version:','FTA HW version:','Touchscreen version:'
   ,'test Bluetooth: '
 ];
 List<String> Codelist=[
   ' *#06#',' ##3264##','##1111##',"*#*#2222#*#*",'*#*#2663#*#*',
   ': *#*#232331#*#*'
 ];
  String? name;
   MobileCodeDetailScreen({required this.name,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundBlackColor,
      appBar: AppBarWidget(title: "$name Codes"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              ListView.builder(
                  itemCount: namelist.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        // height: 150.h,
                        padding: EdgeInsets.only(
                            left: 15.w, right: 15.w, top: 10.h, bottom: 10.h),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Name',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                                Text('Code',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                                
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                              Text(namelist[index],style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),

                                Text(Codelist[index],style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold))
                            ],),
                            SizedBox(
                              height: 7.h,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      ShareText();
                                    },
                                    child: Icon(Icons.share_outlined)),
                                GestureDetector(
                                    onTap: () {
                                      _callNumber(number: '232');
                                    },
                                    child: Icon(Icons.dialer_sip_outlined)),
                                GestureDetector(
                                    onTap: () {}, child: Icon(Icons.copy))
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }

  void ShareText() {
    Share.share('this is the share Text');
  }

  void _callNumber({required String number}) async {
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
  }
}
