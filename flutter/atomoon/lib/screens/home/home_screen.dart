import 'package:atomoon/screens/home/pages/chat/chat_page.dart';
import 'package:atomoon/screens/home/pages/home/home_page.dart';
import 'package:atomoon/screens/home/pages/profile/profile_page.dart';
import 'package:atomoon/screens/home/pages/settings/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:atomoon/config/constants.dart';

class HomeScreen extends StatefulWidget {
  final int? dfCurrentPage;
  const HomeScreen({this.dfCurrentPage, super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const routeName = '/home';

  int currentPage = 0;
  late PageController pc;

  @override
  void initState() {
    super.initState();
    currentPage = widget.dfCurrentPage ?? currentPage;
    pc = PageController(initialPage: currentPage);
  }

  @override
  void dispose() {
    super.dispose();
    pc.dispose();
  }

  AppBar appBar() {
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
          icon: const Icon(Icons.notification_add_rounded), color: Color.fromARGB(255, 64, 93, 156),
        ),
      ],
    );
  }

  PageView pageView() {
    List<Widget> navPages = <Widget>[
      const HomePage(),
      const ChatPage(),
      const ProfilePage(),
      SettingsPage()
    ];

    setPaginaAtual(int pagina) {
      setState(() {
        currentPage = pagina;
      });
    }

    return PageView(
      controller: pc,
      onPageChanged: setPaginaAtual,
      children: navPages,
    );
  }

  BottomNavigationBar bottomNav() {
    return BottomNavigationBar(
      currentIndex: currentPage,
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
      selectedIconTheme: const IconThemeData(color: kMainColor, size: 20),
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      showUnselectedLabels: true,
      backgroundColor: Colors.white,
      onTap: (int pageIndex) {
        setState(() {
          pc.animateToPage(pageIndex,
              duration: const Duration(milliseconds: 500), curve: Curves.ease);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorsys.lightGrey,
      appBar: appBar(),
      body: pageView(),
      bottomNavigationBar: bottomNav(),
    );
  }
}
