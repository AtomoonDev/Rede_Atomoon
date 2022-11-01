import 'package:flutter/material.dart';
import 'package:atomoon/screens/signIn_or_signUp/login_screen.dart';
import 'package:atomoon/screens/splash/splash_page.dart';

final routes = {
  //'/enter': (BuildContext context) => new EnterPage(),
  '/login': (BuildContext context) => new LoginPage(),
  //'/root': (BuildContext context) => new RootPage(),
  '/': (BuildContext context) => new SplashPage(),
};
