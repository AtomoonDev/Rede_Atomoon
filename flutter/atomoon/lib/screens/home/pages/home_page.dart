import 'package:atomoon/screens/Home/bottom_nav.dart';
import 'package:atomoon/screens/telas.dart';
import 'package:flutter/material.dart';
import 'package:atomoon/constants.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dart:convert';

import '../../../components/category_card.dart';

class HomePage extends StatelessWidget {
  static const _padding = 24.0;
  static const _spacing = 24.0;
  const HomePage({super.key});

  Widget header() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Categorias',
            style: TextStyle(
              color: Colors.black,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Explore milhares de serviços!',
            style: TextStyle(
              color: Colors.black.withOpacity(0.6),
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget searchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        height: 46,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          color: Colors.black.withOpacity(0.2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Digite o nome de um trabalho',
              style: TextStyle(
                color: Colors.black.withOpacity(0.6),
              ),
            ),
            Icon(
              Icons.search_rounded,
              color: kSecondaryColor.withOpacity(0.6),
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  /*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 52),
          appBar(),
          const SizedBox(height: 24),
          header(),
          const SizedBox(height: 24),
          searchBar(),
          const SizedBox(height: 36),
          categories(),
          const SizedBox(height: 16),
          const AllDestinations(
            padding: _padding,
            spacing: _spacing,
          ),
          const SizedBox(height: 36),
          const TopDestinations(
            padding: _padding,
            spacing: _spacing,
          ),
        ],
      ),
    );
  }*/

  Widget categoriesTab(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Colorsys.lightGrey))),
        child: DefaultTabController(
            length: 2,
            child: TabBar(
                indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide(
                    width: 3,
                    color: Colorsys.cyan,
                  ),
                  insets: EdgeInsets.only(left: 0, right: 75, top: 10),
                ),
                labelPadding: const EdgeInsets.only(left: 0, right: 16),
                isScrollable: true,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                labelStyle: GoogleFonts.openSans(
                    fontSize: 15, fontWeight: FontWeight.bold),
                unselectedLabelStyle: GoogleFonts.openSans(
                    fontSize: 15, fontWeight: FontWeight.w600),
                tabs: [
                  Container(
                    height: 35.0,
                    child: const Tab(
                      child: Text(
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
                        style: TextStyle(
                            color: Colorsys.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                      ),
                    ),
                  )
                ])));
  }

  Widget cards() {
    /*
    List data;
    String rawJson =
        '[{"text":"Jardineiro","image": "lib/assets/images/card_img1.png"},' +
            '{"text":"Jardineiro","image": "lib/assets/images/card_img1.png"},' +
            '{"text":"Jardineiro","image": "lib/assets/images/card_img1.png"},' +
            '{"text":"Jardineiro","image": "lib/assets/images/card_img1.png"}' +
            ']';

    data = json.decode(rawJson);

    print(data);
    print("AQUI6");

    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Text(index.toString());
      },
    );*/

    return Column(children: const [
      CategoryCard(
          text: 'Jardineiro',
          image: AssetImage("lib/assets/images/card_img1.png")),
      CategoryCard(
          text: 'Jardineiro',
          image: AssetImage("lib/assets/images/card_img1.png")),
      CategoryCard(
          text: 'Jardineiro',
          image: AssetImage("lib/assets/images/card_img1.png")),
    ]);
  }

  Widget cardWhatYouWant(BuildContext context) {
    return Container(
      height: 100,
      width: 500,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Card(
        elevation: 0,
        color: Theme.of(context).primaryColor,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 90, vertical: 18),
          child: Text('O que você busca ?',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: CustomScrollView(slivers: [
      SliverList(
          delegate: SliverChildListDelegate([
        const SizedBox(height: 30),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                  const SizedBox(height: 20),
                  header(),
                  const SizedBox(height: 24),
                  searchBar(),
                  const SizedBox(height: 30),
                  categoriesTab(context),
                  const SizedBox(height: 25),
                  cardWhatYouWant(context),
                  const SizedBox(height: 10),
                  cards(),
                  const SizedBox(height: 10),
                ],
              ),
            )
          ],
        )
      ]))
    ]));
  }
}
