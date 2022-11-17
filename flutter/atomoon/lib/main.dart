import 'package:atomoon/screens/splash/splash_screen.dart';
import 'package:atomoon/screens/welcome/welcome_screen.dart';
import 'package:atomoon/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.light,
  ));
  runApp(const AtomoonApp());
}

class AtomoonApp extends StatelessWidget {
  const AtomoonApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Atomoon',
      theme: lightThemeData(context),
      darkTheme: darkThemeData(context),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => SplashScreen(),
      },
      //home: WelcomeScreen(),
    );
  }
}
