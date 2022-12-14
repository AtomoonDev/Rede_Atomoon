// display info about categorie
import 'package:flutter/material.dart';
import 'package:atomoon/config/constants.dart';

class CategoryInfo extends StatelessWidget {
  CategoryInfo({super.key});

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

  // lista com trabalhadores
  final List<String> workers = <String>['João Paulo', 'Maria', 'Pedro'];

  Widget _buildWorkerCard(String worker) {
    String categoria = 'Encanador';
    String descricao = 'Trabalho com encanamento';
    return Container(
      height: kSpacingUnit * 12,
      width: kSpacingUnit * 12,
      margin: const EdgeInsets.only(top: kSpacingUnit * 0.08),
      child: Stack(
        children: <Widget>[
          // card with name, categorie and description
          const CircleAvatar(
            radius: kSpacingUnit * 6,
            backgroundImage: AssetImage('lib/assets/images/profile_icon.png'),
          ),
          Text(worker,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              )),
          Text(categoria,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              )),
          Text(descricao,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              )),
        ],
      ),
    );
  }

  Widget cards() {
    return Expanded(
      child: Column(
        children: <Widget>[
          // interate listr
          for (final worker in workers) _buildWorkerCard(worker),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: CustomScrollView(slivers: [
      SliverList(
          delegate: SliverChildListDelegate([
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
