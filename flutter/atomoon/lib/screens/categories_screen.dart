import 'package:atomoon/screens/telas.dart';
import 'package:flutter/material.dart';
import 'package:atomoon/widget/colorsys.dart';

const styleNameOfTitle = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    letterSpacing: -1.2);

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorsys.lightGrey,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: const Text('Atomoon', style: styleNameOfTitle),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.more_vert, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: Colors.white),
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin:
                  const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
              child: const Center(
                  child: Text(
                      'Você veio em busca de trabalho ou em busca de trabalhadores',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -1.2))),
            ),
            Wrap(
              direction: Axis.vertical,
              spacing: 20, // <-- Spacing between children
              children: [
                SizedBox(
                    width: 250.0,
                    height: 40.0,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Theme.of(context).primaryColor,
                        onSurface: Colors.white,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                      ),
                      onPressed: () {
                          Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Telas()),
                        );
                      },
                      child: const Text('Trabalho'),
                    )),
                SizedBox(
                    width: 250.0,
                    height: 40.0,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        primary: Colors.white,
                        side: BorderSide(color: Theme.of(context).primaryColor),
                        backgroundColor: Colors.transparent,
                        onSurface: Colors.white,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Telas()),
                        );
                      },
                      child: const Text(
                        'Trabalhadores',
                        style: TextStyle(),
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
