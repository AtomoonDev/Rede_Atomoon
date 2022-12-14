import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  // ignore: unused_field
  String? _password = " ";
  bool esconderTexto = true;
  bool esconderTexto2 = true;
  var formKey = GlobalKey<FormState>();
  Color shadowColor = Colors.black;
  bool senha1 = true;
  bool senha2 = true;

  Widget componentWithShadow(Widget component) {
    return Material(elevation: 8, shadowColor: shadowColor, child: component);
  }

  Widget _buildNameField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Nome',
        prefixIcon: Padding(
          padding: EdgeInsets.all(5),
          child: Icon(
            Icons.account_circle_outlined,
            color: Color.fromRGBO(36, 58, 105, 1),
          ),
        ),
      ),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          setState(() {
            shadowColor = Colors.transparent;
          });
          return 'Nome obrigatório';
        }
        setState(() {
          shadowColor = Colors.black;
        });
        return null;
      },
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'E-mail',
        prefixIcon: Padding(
          padding: EdgeInsets.all(5),
          child:
              Icon(Icons.email_rounded, color: Color.fromRGBO(36, 58, 105, 1)),
        ),
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
    );
  }

  // ignore: unused_element
  Widget _buildPasswordField() {
    return TextFormField(
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
            borderSide: const BorderSide(color: Colors.black),
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
                      spacing: 0,
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
                        const SizedBox(height: 90),
                        Container(
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.only(bottom: 0),
                            child: Column(children: const [
                              Text(
                                "Criar conta",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ])),
                        componentWithShadow(_buildNameField()),
                        componentWithShadow(_buildEmailField()),
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
                        Material(
                          elevation: 8,
                          shadowColor: shadowColor,
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Confirme sua senha',
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
                                        esconderTexto2 = !esconderTexto2;
                                      }))),
                            ),
                            validator: (String? value) {
                              if (senha1 != senha2) {}
                              if (value == null || value.isEmpty) {
                                shadowColor = Colors.transparent;
                                return 'Senha obrigatoria';
                              }
                              return null;
                            },
                            onSaved: (val) => _password = val,
                            obscureText: esconderTexto2,
                          ),
                        ),
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
                                  'Criar conta',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              onPressed: () {
                                if (formKey.currentState?.validate() ?? false) {
                                  setState(() {
                                    shadowColor = Colors.black;
                                  });
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      '/home', (Route<dynamic> route) => false);
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
