import 'package:flutter/material.dart';
import 'package:atomoon/screens/screens.dart';
import 'package:atomoon/components/buttons.dart';
import 'package:atomoon/screens/home/pages/home_page.dart';

const bgColor = Color(0xFFF5F5F5);
const primaryColor = Color(0xFF00AFFF);

const styleNameOfCompany = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    letterSpacing: -1.2);

class Telas extends StatelessWidget {
  const Telas({Key? key}) : super(key: key);

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
                  child: Text('DEBUG: Telas do aplicativo',
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
                    text: 'Bem-vindo',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TypeOfWorkPage()),
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: 250.0,
                  height: 40.0,
                  child: RoundedDFBtn(
                    text: 'Categorias',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()),
                      );
                    },
                    isOutlinedBtn: true,
                  ),
                ),
                SizedBox(
                  width: 250.0,
                  height: 40.0,
                  child: RoundedDFBtn(
                    text: 'Test',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Test()),
                      );
                    },
                    isOutlinedBtn: true,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
