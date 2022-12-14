//import 'package:atomoon/api/http_api.dart';
//import 'package:atomoon/models/api_response.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
//import 'dart:convert';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginController = TextEditingController();
  final senhaController = TextEditingController();


  // ignore: unused_field
  String? _password = " ";
  bool esconderTexto = true;
  bool esconderTexto2 = true;
  var formKey = GlobalKey<FormState>();
  Color shadowColor = Colors.black;

  Future<void> readJson() async {
    //final String response = await rootBundle.loadString('assets/sample.json');
    //final data = await json.decode(response);
// ...
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
              color: Colors.black,
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Expanded(child: Container()),
          ],
        ),
        body: Center(
            child: Form(
                key: formKey,
                child: Container(
                    margin: const EdgeInsets.all(20),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 20,
                      runSpacing: 20,
                      children: [
                        Container(
                            alignment: Alignment.topCenter,
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Column(children: const [
                              Text(
                                "Atomoon",
                                style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 36, 58, 105),
                                    letterSpacing: -1.2),
                              ),
                            ])),
                        const SizedBox(height: 15),
                        Container(
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.only(bottom: 0),
                            child: Column(children: const [
                              Text(
                                "Entrar",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 35),
                              ),
                            ])),
                        Material(
                          elevation: 8,
                          shadowColor: shadowColor,
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'E-mail',
                              prefixIcon: const Padding(
                                padding: EdgeInsets.all(5),
                                child: Icon(Icons.email_rounded,
                                    color: Color.fromRGBO(36, 58, 105, 1)),
                              ),
                              border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                setState(() {
                                  shadowColor = Colors.transparent;
                                });
                                return 'E-mail obrigatório';
                              }
                              setState(() {
                                shadowColor = Colors.black;
                              });
                              return null;
                            },
                          ),
                        ),
                        Material(
                          elevation: 8,
                          shadowColor: shadowColor,
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Senha',
                              prefixIcon: const Padding(
                                padding: EdgeInsets.all(5),
                                child: Icon(
                                  Icons.key,
                                  color: Color.fromRGBO(36, 58, 105, 1),
                                ),
                              ),
                              border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(5)),
                              suffixIcon: IconButton(
                                  icon: const Icon(
                                    Icons.remove_red_eye_outlined,
                                    color: Color.fromRGBO(36, 58, 105, 1),
                                  ),
                                  onPressed: (() => setState(() {
                                        esconderTexto = !esconderTexto;
                                      }))),
                            ),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                setState(() {
                                  shadowColor = Colors.transparent;
                                });
                                return 'Senha obrigatória';
                              }
                              setState(() {
                                shadowColor = Colors.black;
                              });
                              return null;
                            },
                            onSaved: (val) => _password = val,
                            obscureText: esconderTexto,
                          ),
                        ),
                        Container(
                            alignment: Alignment.centerLeft,
                            child: TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "Esqueci minha senha",
                                  textAlign: TextAlign.right,
                                ))),
                        Container(
                          margin: (const EdgeInsets.only(
                              top: 15, left: 25, right: 25)),
                          height: 50,
                          width: 200,
                          decoration: const BoxDecoration(
                              color: Color.fromRGBO(36, 58, 105, 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(32))),
                          child: TextButton(
                              child: const Center(
                                child: Text(
                                  'Entrar',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              onPressed: () {
                                if (formKey.currentState?.validate() ?? false) {
                                  // API Login
                                  /*final login = loginController.text;
                                  final senha = senhaController.text;
                                  
                                  print("Login: $login , Senha: $senha " );  
                                  ApiResponse response = LoginApi.login(login, senha).then((value) => value); 
                                  if(!response.statusOk){
                                    print("Erro ao logar: ${response.msg}");
                                    return ;
                                  }*/

                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      '/home', (Route<dynamic> route) => false);
                                }
                              }),
                        ),
                      ],
                    )))));
  }
}
