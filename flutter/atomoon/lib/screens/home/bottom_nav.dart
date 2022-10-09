import 'package:atomoon/constants.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  int currentIndex = 0;

  BottomNav(
      {Key? key,
      required currentIndex})
      : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: kMainColor,
      iconSize: 25,
      selectedFontSize: 14,
      unselectedFontSize: 12,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
        BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Bate-papo'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
      ],
      selectedIconTheme: IconThemeData(color: kMainColor, size: 20),
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
      showUnselectedLabels: true,
      backgroundColor: Colors.white,
      onTap: (int index) {
        setState(() {
          widget.currentIndex = index;
        });
      },
    );
  }
}
