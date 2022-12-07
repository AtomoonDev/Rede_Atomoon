import 'package:atomoon/screens/home/home_screen.dart';
import 'package:atomoon/screens/signIn_or_signUp/signin_or_signup_screen.dart';
import 'package:atomoon/screens/signIn_or_signUp/login_screen.dart';
import 'package:atomoon/screens/signIn_or_signUp/register_screen.dart';
import 'package:atomoon/screens/splash/splash_screen.dart';

final routes = {
  // Rotas do app, '/' é a rota inicial
  '/': (context) => const SplashScreen(),
  '/auth': (context) => const SigninOrSignupScreen(),
  '/login': (context) => const LoginScreen(),
  '/register': (context) => const RegisterScreen(),
  '/home': (context) => const HomeScreen(),
};
