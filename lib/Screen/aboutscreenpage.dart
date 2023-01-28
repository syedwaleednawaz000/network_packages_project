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
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(height: 10,),
                Center(child: Image.asset('assets/images/android_logo.png',fit: BoxFit.cover,color: Colors.white,height: 100,)),
                SizedBox(height: 10,),
                const Text('A software engineer is a person who applies the principles '
                    'of software engineering to design, develop, maintain, test, and '
                    'evaluate computer software. The term programmer is sometimes used '
                    'as a synonym, but may also lack connotations of engineering education '
                    'or skills.',textAlign: TextAlign.justify,
                  style: TextStyle(color: Colors.white),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
