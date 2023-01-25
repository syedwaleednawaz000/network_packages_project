import 'package:flutter/material.dart';

class MobileCodeScreen extends StatelessWidget {
  const MobileCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Text(("Mobile Code")),
            ],
          ),
        ),
      ),
    );
  }
}
