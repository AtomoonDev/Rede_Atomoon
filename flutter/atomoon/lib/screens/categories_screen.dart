import 'package:atomoon/screens/telas.dart';
import 'package:flutter/material.dart';
import 'package:atomoon/constants.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/category_card.dart';

const styleNameOfTitle = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 36, 58, 105),
    letterSpacing: -1.2);

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  int _currentIndex = 0;
  static const TextStyle opcaoEstilosa1 =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.green);
  static const TextStyle opcaoEstilosa2 = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: Colors.blue,
  );
  static const TextStyle opcaoEstilosa3 = TextStyle(
      fontSize: 30, fontWeight: FontWeight.bold, color: Colors.purple);

  // criar uma lista de tabela
  static List<Widget> _wdOpcoes = <Widget>[
    Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
              padding: const EdgeInsets.all(60),
              child: Image.asset('assets/a4.jpg',
                  height: 200, scale: 1.0, fit: BoxFit.fill)),
          Text('IHH RODOU', style: opcaoEstilosa1)
        ],
      ),
    ),
    Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
              padding: const EdgeInsets.all(60),
              child: Image.asset('assets/a2.jpg',
                  height: 200, scale: 1.0, fit: BoxFit.fill)),
          Text('Pedro ENCANAGENS', style: opcaoEstilosa2)
        ],
      ),
    ),
    Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
              padding: const EdgeInsets.all(60),
              child: Image.asset('assets/a3.jpg',
                  height: 200, scale: 1.0, fit: BoxFit.fill)),
          Text('Um Pedreiro qualquer', style: opcaoEstilosa3)
        ],
      ),
    )
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorsys.lightGrey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text('Atomoon', style: styleNameOfTitle),
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
      ),
      body: SafeArea(
          child: Container(
              child: CustomScrollView(slivers: [
        SliverList(
            delegate: SliverChildListDelegate([
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 60,
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        "Categorias",
                        style: const TextStyle(
                            color: Colorsys.darkGray,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                              border: const Border(
                                  bottom:
                                      BorderSide(color: Colorsys.lightGrey))),
                          child: DefaultTabController(
                              length: 2,
                              child: TabBar(
                                  indicator: const UnderlineTabIndicator(
                                    borderSide: const BorderSide(
                                      width: 3,
                                      color: Colorsys.cyan,
                                    ),
                                    insets: EdgeInsets.only(
                                        left: 0, right: 75, top: 10),
                                  ),
                                  labelPadding:
                                      const EdgeInsets.only(left: 0, right: 16),
                                  isScrollable: true,
                                  labelColor: Colors.black,
                                  unselectedLabelColor: Colors.grey,
                                  labelStyle: GoogleFonts.openSans(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                  unselectedLabelStyle: GoogleFonts.openSans(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                  tabs: [
                                    Container(
                                      height: 35.0,
                                      child: const Tab(
                                        child: const Text(
                                          "Recomendadas",
                                          style: TextStyle(
                                              color: Colorsys.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 35.0,
                                      child: const Tab(
                                        child: Text(
                                          "Favoritadas",
                                          style: const TextStyle(
                                              color: Colorsys.grey,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14),
                                        ),
                                      ),
                                    )
                                  ]))),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 140,
                        width: 500,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          image: const DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                  "lib/assets/images/card_img1.png")),
                        ),
                        child: Card(
                          elevation: 0,
                          color: Theme.of(context).primaryColor,
                          child: const Padding(
                            padding: const EdgeInsets.all(20),
                            child: const Text('O que você busca ?',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Poppins',
                                    fontSize: 32.0,
                                    fontWeight: FontWeight.w400)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const CategoryCard(
                          text: 'Jardineiro',
                          image: AssetImage("lib/assets/images/card_img1.png")),
                      const CategoryCard(
                          text: 'Jardineiro',
                          image: AssetImage("lib/assets/images/card_img1.png")),
                      const CategoryCard(
                          text: 'Jardineiro',
                          image: AssetImage("lib/assets/images/card_img1.png")),
                    ],
                  ),
                )
              ],
            ),
          )
        ]))
      ]))),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
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
        selectedIconTheme: IconThemeData(color: Colors.amberAccent, size: 20),
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 1),
        showUnselectedLabels: true,
        backgroundColor: Colors.white,
        onTap: (int i) {
          _onItemTapped(i);
        },
      ),
    );
  }
}

/*class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

}*/
