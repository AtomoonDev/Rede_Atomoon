import 'dart:async';

import 'package:atomoon/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    initEnter();
  }

  Widget logoAtoomon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'lib/assets/images/logo_app.png',
          width: MediaQuery.of(context).size.width * 0.70,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 12),
        Image.asset(
          'lib/assets/images/logo_moon.png',
          width: 62,
          height: 62,
          fit: BoxFit.cover,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Color.fromARGB(255, 17, 23, 43)],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width,
                height: 500,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    logoAtoomon(),
                    const SizedBox(height: 80),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  void initEnter() {
    Timer(const Duration(seconds: 5), () {
      //Navigator.of(context).pushReplacement(CustomPage);
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => const WelcomeScreen()));
    });
  }
}
