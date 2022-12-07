import 'package:atomoon/screens/telas.dart';
import 'package:flutter/material.dart';
import 'package:atomoon/components/buttons.dart';

const styleNameOfCompany = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    letterSpacing: -1.2);

class TypeOfWorkPage extends StatelessWidget {
  const TypeOfWorkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Atomoon', style: styleNameOfCompany),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image:
                  const AssetImage('lib/assets/images/fundo-telainicial.png'),
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.6),
                BlendMode.darken,
              )),
        ),
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
                  child: RoundedDFBtn(
                    text: 'Trabalho',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TelasTest()),
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: 250.0,
                  height: 40.0,
                  child: RoundedDFBtn(
                    text: 'Trabalhadores',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TelasTest()),
                      );
                    },
                    isOutlinedBtn: true,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
