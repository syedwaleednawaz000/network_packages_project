import 'package:flutter/material.dart';
import 'package:network_packages_project/Widget/appBar.dart';

import '../Utils/appcolors.dart';
import '../Widget/appbarwidgetsecond.dart';
class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidgetSecond(
        title: "Notification",),
      backgroundColor: AppColors.backgroundBlackColor,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                itemBuilder: (context,index){
              return  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 8),
                child: Card(
                  child: ListTile(
                    leading: Icon(Icons.notifications,color: Colors.blue,),

                    title: Text('Today Notification',),
                    subtitle: Text('This is the Google notifacation here',),
                    trailing: Text('1/27/2023',),
                  ),
                ),
              );
            })

          ],
        ),
      ),
    );
  }
}
