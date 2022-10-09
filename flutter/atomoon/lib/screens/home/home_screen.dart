import 'package:atomoon/screens/home/bottom_nav.dart';
import 'package:atomoon/screens/home/pages/chat_page.dart';
import 'package:atomoon/screens/home/pages/home_page.dart';
import 'package:atomoon/screens/home/pages/profile_page.dart';
import 'package:atomoon/screens/home/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:atomoon/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // criar uma lista de tabela
  static List<Widget> _navPages = <Widget>[
    const HomePage(),
    const ChatPage(),
    const ProfilePage(),
    const SettingsPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  AppBar appBar(){
    return AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text('Atomoon', style: kNameOfCompanyStyle),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert, color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: Colors.black),
          ),
        ],
      );
  }

  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;

    return Scaffold(
      backgroundColor: Colorsys.lightGrey,
      appBar: appBar(),
      body: _navPages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNav(currentIndex: _selectedIndex),
    );
  }
}
