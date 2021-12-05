import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../controller/heading_controller.dart';
import '../screen/accounts.dart';
import 'package:provider/provider.dart';

import 'filter_screen.dart';
import 'home_screen.dart';
import 'new_collection.dart';

class MainScreen extends StatelessWidget {
  final screens = [
    HomeScreen(),
    NewCollectionScreen(),
    FilterScreen(),
    Accounts()
  ];
  final List<IconData> icons = [
    Icons.home,
    FontAwesomeIcons.compass,
    Icons.search,
    Icons.person
  ];
  final List<String> labels = [
    '',
    '',
    '',
    '',
  ];

  @override
  Widget build(BuildContext context) {
    final bottomController =
        Provider.of<HeadingController>(context, listen: true);
    return Scaffold(
      body: screens[bottomController.bottomIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF14363c),
        //fixedColor: Color(0xFF14363c),
        selectedLabelStyle: TextStyle(fontSize: 0),
        unselectedLabelStyle: TextStyle(fontSize: 0),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        iconSize: 30.0,
        type: BottomNavigationBarType.fixed,
        currentIndex: bottomController.bottomIndex,
        onTap: (bottomValue) => bottomController.bottomNavState(bottomValue),
        items: List.generate(
          icons.length,
          (index) => BottomNavigationBarItem(
            icon: Icon(icons[index]),
            label: labels[index],
          ),
        ),
      ),
    );
  }
}
