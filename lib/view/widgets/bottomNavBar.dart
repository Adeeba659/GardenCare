// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:GardenCare/view/screens/encyclo.dart';
import 'package:GardenCare/view/screens/history.dart';
import 'package:GardenCare/view/screens/home_page.dart';
import 'package:GardenCare/view/screens/take_pic.dart';
import 'package:flutter/material.dart';
import '../../utils/theme.dart';

class BottomNavBar extends StatefulWidget {
  //const BottomNavBar({required Key key}) : super(key: key);

  int passedIndex = 0;

  BottomNavBar(this.passedIndex);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late int _selectedIndex = widget.passedIndex;

  List<Widget> _screens = [
    home_page(),
    TakePic(),
    encyclo(),
    history(),
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.passedIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Perform navigation to the selected screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => _screens[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: primaryColor,
      selectedItemColor: primaryColor,
      unselectedItemColor: secondaryColor,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.image),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: '',
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }
}
