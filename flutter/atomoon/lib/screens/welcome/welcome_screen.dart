import 'package:atomoon/screens/signIn_or_signUp/signin_or_signup_screen.dart';
import 'package:flutter/material.dart';

import 'package:atomoon/config/constants.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,/*
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color.fromRGBO(8, 22, 49, 1), Color.fromRGBO(148, 158, 255, 1)] ))
                ,*/
          child: Column(
          children: [
            const Spacer(flex: 2),
            Image.asset("lib/assets/images/lua_semborda1.png"),
            const Spacer(flex: 3),
            Text(
              "Aplicativo Atomoon",
              //
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Text(
              "O App para buscar trabalhos em sua área.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .color!
                    .withOpacity(0.64),
              ),
            ),
            const Spacer(flex: 3),
            FittedBox(
              child: TextButton(
                  onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SigninOrSignupScreen(),
                        ),
                      ),
                  child: Row(
                    children: [
                      Text(
                        "Pular",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .color!
                                  .withOpacity(0.8),
                            ),
                      ),
                      const SizedBox(width: kDefaultPadding / 4),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .color!
                            .withOpacity(0.8),
                      )
                    ],
                  )),
            )
          ],
        ),),
      ),
    );
  }
}
