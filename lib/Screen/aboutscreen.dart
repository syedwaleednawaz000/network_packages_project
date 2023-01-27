import 'package:flutter/material.dart';

import '../Utils/appcolors.dart';

class AboutScreen extends StatefulWidget {
   AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  bool notification=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundBlackColor,
      body: SafeArea(
        child: Container(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text("Notification",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                   Switch(value: notification, onChanged: (value){
                     setState(() {
                       notification=value;
                     });
                   }),
                 ],
               ),
               SizedBox(height: 30,),
                           SizedBox(height: 30,),
               Text("About us",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20)),
              SizedBox(height: 30,),
               Text("Contact us",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20)),
              SizedBox(height: 30,),
              Text("complaint",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20)),


            ],
          ),
        ),
      ),
    );
  }
}


