import 'package:flutter/material.dart';
import 'package:network_packages_project/Screen/aboutscreen.dart';
import 'package:network_packages_project/Screen/favouritescreen.dart';
import 'package:network_packages_project/Screen/homescreen.dart';
import 'package:network_packages_project/Screen/mobilecodescreen.dart';
import 'package:network_packages_project/Utils/appcolors.dart';
import 'package:network_packages_project/Widget/appBar.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  List<Widget> screens = [
     HomeScreen(),
     FavouriteScreen(),
     MobileCodeScreen(),
     AboutScreen()
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      backgroundColor: AppColors.backgroundBlackColor,
      body: screens[index],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            canvasColor: AppColors.containerGreyColor),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            unselectedItemColor: Colors.white,
            elevation: 0,
            showUnselectedLabels: true,
            currentIndex: index,
            // backgroundColor: Colors.pink,
            selectedItemColor: AppColors.selectIconColor,
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
                // tooltip: "fav",
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
        ),
      ),
    );
  }
}
