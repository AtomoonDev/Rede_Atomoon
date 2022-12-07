import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:atomoon/config/routes.dart';
import 'package:atomoon/config/theme.dart';

// import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();

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
        routes: routes);
  }
}
