import 'package:atomoon/components/primary_button.dart';
import 'package:atomoon/screens/signIn_or_signUp/register_screen.dart';
import 'package:atomoon/screens/signIn_or_signUp/login_screen.dart';
import 'package:atomoon/config/constants.dart';
import 'package:flutter/material.dart';

class SigninOrSignupScreen extends StatelessWidget {
  const SigninOrSignupScreen({super.key});

  static const TextStyle texto1 = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Color.fromARGB(255, 131, 134, 136));

  static const TextStyle texto2 = TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.w900,
      color: Color.fromARGB(255, 0, 0, 0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            children: [
              const Spacer(flex: 2),
              const Text("Seja Bem-vindo(a)",
                  textAlign: TextAlign.center, style: texto2),
              const Spacer(flex: 1),
              Image.asset(
                MediaQuery.of(context).platformBrightness == Brightness.light
                    ? "lib/assets/images/lua_semborda1.png"
                    : "lib/assets/images/lua_semborda1.png",
                height: 146,
              ),
              const Spacer(flex: 1),
              const Text(
                  "Esse é um aplicativo feito para\najudar você: autonomo ou \ncliente.",
                  textAlign: TextAlign.center,
                  style: texto1),
              const Spacer(),
              PrimaryButton(
                text: "Entrar",
                press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                ),
              ),
              const SizedBox(height: kDefaultPadding * 0.6),
              SecondButton(
                color: Theme.of(context).colorScheme.secondary,
                text: "Cadastrar",
                press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegisterScreen(),
                  ),
                ),
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
