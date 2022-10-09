import 'package:atomoon/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => RegisterState();
}

class RegisterState extends State<Register> {
  String? _password = " ";
  bool esconderTexto = true;
  bool esconderTexto2 = true;
  var formKey = GlobalKey<FormState>();
  Color shadowColor = Colors.black;
  bool senha1 = true;
  bool senha2 = true;

  Widget ComponentWithShadow(Widget component) {
    return Material(elevation: 8, shadowColor: shadowColor, child: component);
  }

  Widget _BuildNameField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Nome',
        prefixIcon: Padding(
          child: Icon(
            Icons.account_circle_outlined,
            color: Color.fromRGBO(36, 58, 105, 1),
          ),
          padding: EdgeInsets.all(5),
        ),
      ),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          setState(() {
            shadowColor = Colors.transparent;
          });
          return 'Nome Obrigatório';
        }
        setState(() {
          shadowColor = Colors.black;
        });
      },
    );
  }

  Widget _BuildEmailField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'E-mail',
        prefixIcon: Padding(
          child:
              Icon(Icons.email_rounded, color: Color.fromRGBO(36, 58, 105, 1)),
          padding: EdgeInsets.all(5),
        ),
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
      },
    );
  }

  Widget _BuildPasswordField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Senha',
        prefixIcon: Padding(
          child: Icon(
            Icons.key,
            color: Color.fromRGBO(36, 58, 105, 1),
          ),
          padding: EdgeInsets.all(5),
        ),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(5)),
        suffixIcon: IconButton(
            icon: Icon(
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
      },
      onSaved: (val) => _password = val,
      obscureText: esconderTexto,
    );
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
              icon: Icon(Icons.arrow_back),
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
                    margin: EdgeInsets.all(20),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 0,
                      runSpacing: 20,
                      children: [
                        Container(
                            alignment: Alignment.topCenter,
                            padding: EdgeInsets.only(bottom: 10),
                            child: Column(children: [
                              Text(
                                "Atomoon",
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 36, 58, 105),
                                  letterSpacing: -1.2),
                              ),
                            ])),
                        SizedBox(height: 90),
                       Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.only(bottom: 0),
                            child: Column(children: [
                              Text(
                                "Criar conta",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                        ])),
                        ComponentWithShadow(_BuildNameField()),
                        ComponentWithShadow(_BuildEmailField()),
                        Material(
                          elevation: 8,
                          shadowColor: shadowColor,
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Senha',
                              prefixIcon: Padding(
                                child: Icon(
                                  Icons.key,
                                  color: Color.fromRGBO(36, 58, 105, 1),
                                ),
                                padding: EdgeInsets.all(5),
                              ),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(5)),
                              suffixIcon: IconButton(
                                  icon: Icon(
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
                            },
                            onSaved: (val) => _password = val,
                            obscureText: esconderTexto,
                          ),
                        ),
                        Material(
                          elevation: 8,
                          shadowColor: shadowColor,
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Confirme sua senha',
                              prefixIcon: Padding(
                                child: Icon(
                                  Icons.key,
                                  color: Color.fromRGBO(36, 58, 105, 1),
                                ),
                                padding: EdgeInsets.all(5),
                              ),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(5)),
                              suffixIcon: IconButton(
                                  icon: Icon(
                                    Icons.remove_red_eye_outlined,
                                    color: Color.fromRGBO(36, 58, 105, 1),
                                  ),
                                  onPressed: (() => setState(() {
                                        esconderTexto2 = !esconderTexto2;
                                      }))),
                            ),
                            validator: (String? value) {
                              if (senha1 != senha2) {}
                              if (value == null || value.isEmpty) {
                                shadowColor = Colors.transparent;
                                return 'Senha obrigatoria';
                              }
                            },
                            onSaved: (val) => _password = val,
                            obscureText: esconderTexto2,
                          ),
                        ),
                        Container(
                          margin:
                              (EdgeInsets.only(top: 15, left: 25, right: 25)),
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(36, 58, 105, 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(32))),
                          child: TextButton(
                              child: Center(
                                child: Text(
                                  'Criar conta',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              onPressed: () {
                                if (formKey.currentState?.validate() ?? false) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomeScreen()));
                                  setState(() {
                                    shadowColor = Colors.black;
                                  });
                                }
                                setState(() {
                                  shadowColor = Colors.transparent;
                                });
                              }),
                        ),
                      ],
                    )))));
  }
}
