import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  final Function(int) onTap;
  final int selectedIndex;
  final String text;
  final List<BottomNavigationBarItem> btnNavItems;

  const BottomNav(
      {Key? key,
      required this.onTap,
      required this.text,
      required this.selectedIndex,
      required this.btnNavItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: btnNavItems,
      currentIndex: selectedIndex,
      selectedItemColor: const Color.fromARGB(255, 0, 0, 0),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      onTap: onTap,
    );
  }
}
