
import 'package:flutter/material.dart';
import 'package:network_packages_project/Screen/aboutscreen.dart';
import 'package:network_packages_project/Screen/favouritescreen.dart';
import 'package:network_packages_project/Screen/homescreen.dart';
import 'package:network_packages_project/Screen/mobilecodescreen.dart';

class DashBoardScreen extends StatefulWidget {
  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  List<Widget> screens = [const HomeScreen(),const FavouriteScreen(),const MobileCodeScreen(),const AboutScreen() ];

  int index = 0;
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        elevation: 0,
        backgroundColor: Colors.white,
        currentIndex: index,
        selectedItemColor: Colors.green,
        onTap: (int value) {
          setState(() {
            index = value;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),

          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border_sharp,
            ),
            label: 'Favourite',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.qr_code,
            ),
            label: 'Mobile Code',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_box_outlined,
            ),
            label: 'About',
          )
        ],
      ),
    );
  }
}

