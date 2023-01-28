import 'package:flutter/material.dart';
import 'package:network_packages_project/Widget/appBar.dart';

import '../Widget/appbarwidgetsecond.dart';
class AboutScreenPage extends StatefulWidget {
  const AboutScreenPage({Key? key}) : super(key: key);

  @override
  State<AboutScreenPage> createState() => _AboutScreenPageState();
}

class _AboutScreenPageState extends State<AboutScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBarWidgetSecond(title: 'About'),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 20,),
              Center(child: Image.asset('assets/images/android_logo.png',width: 100,height: 100,)),
              const Text('A software engineer is a person who applies the principles of software engineering to design, develop, maintain, test, and evaluate computer software. The term programmer is sometimes used as a synonym,'
                  ' but may also lack connotations of engineering education or skills.',style: TextStyle(color: Colors.white),)
            ],
          ),
        ),
      ),
    );
  }
}
