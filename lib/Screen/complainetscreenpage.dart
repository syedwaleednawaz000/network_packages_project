import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:network_packages_project/Widget/appBar.dart';

import '../Widget/appbarwidgetsecond.dart';
class ComplainentScreenPage extends StatefulWidget {
   ComplainentScreenPage({Key? key}) : super(key: key);

  @override
  State<ComplainentScreenPage> createState() => _ComplainentScreenPageState();
}

class _ComplainentScreenPageState extends State<ComplainentScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBarWidgetSecond(title: 'Complainent'),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children:   [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0,vertical: 20),
              child: Card(
                child: Container(
                  width: 300.w,
                  child: const TextField(
                    decoration: InputDecoration(
                      focusColor: Colors.blue,
                      hintText: 'Enter Email or Phone Number',
                      fillColor: Colors.white

                    ),
                  ),
                ),
              ),
            ),

             Card(
               child: Container(
                 width:300.w ,
                 height: 150.h,
                 child: const TextField(
                   decoration: InputDecoration(
                     enabledBorder: InputBorder.none,
                     focusedBorder: InputBorder.none,
                     hintText: "Enter Your Massage"
                   ),
                 ),
               ),
             ),

            Padding(
              padding: const EdgeInsets.only(left: 220),
              child: ElevatedButton(onPressed: (){}, child: Text('Submit',style: TextStyle(color: Colors.white),)),
            )
          ],
        ),
      ),
    );
  }
}
