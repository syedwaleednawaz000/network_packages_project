import 'package:flutter/material.dart';
import 'package:network_packages_project/Widget/appBar.dart';

import '../Widget/appbarwidgetsecond.dart';
class ContactScreenPage extends StatefulWidget {
  const ContactScreenPage({Key? key}) : super(key: key);

  @override
  State<ContactScreenPage> createState() => _ContactScreenPageState();
}

class _ContactScreenPageState extends State<ContactScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBarWidgetSecond(title: 'Contact Us'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [

              ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                return   Card(
                  child: ListTile(
                    leading: Icon(Icons.camera_alt),
                    title: Text('My Name '),
                    subtitle: Text('i have dont software Engineering in 2021'),
                  ),
                );
              }),
              SizedBox(height: 10,),
              Text('Please Fill the below Information',style: TextStyle(color: Colors.white,fontSize:25,fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              const Card(
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left:60),
                    hintText: 'Enter Your Name'
                  ),
                ),
              ),
              SizedBox(height: 10,),
              const Card(
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left:60),
                      hintText: 'Enter Your Email'
                  ),

                ),
              ),
              SizedBox(height: 10,),
              const Card(
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left:60),
                      hintText: 'Enter Your Phone'
                  ),
                ),
              ),
              SizedBox(height: 10,),
              const Card(
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left:60),
                      hintText: 'Enter Your Massage'
                  ),

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
