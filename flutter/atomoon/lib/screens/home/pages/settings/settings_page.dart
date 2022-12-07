import 'package:atomoon/config/constants.dart';
import 'package:atomoon/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late bool modoEscuro;

  bool _notification = true;
  bool _news = false;
  bool _offer = false;
  bool _appUpdate = true;

  @override
  void initState() {
    super.initState();
    modoEscuro = false;
  }

  Brightness _getBrightness() {
    return modoEscuro ? Brightness.dark : Brightness.light;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        brightness: _getBrightness(),
      ),
      child: Scaffold(
        backgroundColor: modoEscuro ? null : Colors.grey.shade200,
        appBar: AppBar(
          elevation: 0,
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarBrightness: _getBrightness()),
          iconTheme:
              IconThemeData(color: modoEscuro ? Colors.white : Colors.black),
          backgroundColor: Colors.transparent,
          title: Text(
            'Configurações',
            style: TextStyle(color: modoEscuro ? Colors.white : Colors.black),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(FontAwesomeIcons.moon),
              onPressed: () {
                setState(() {
                  modoEscuro = !modoEscuro;
                });
              },
            )
          ],
        ),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Card(
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    color: kMainColor,
                    child: ListTile(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const HomeScreen(dfCurrentPage: 3)),
                            (route) => false);
                      },
                      title: const Text(
                        "João Paulo",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      leading: const CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://images.unsplash.com/photo-1528953030358-b0c7de371f1f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=651&q=80'),
                      ),
                      trailing: const Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Card(
                    elevation: 4.0,
                    margin: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 16.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: const Icon(
                            Icons.lock_outline,
                            color: kMainColor,
                          ),
                          title: const Text("Trocar Senha"),
                          trailing: const Icon(Icons.keyboard_arrow_right),
                          onTap: () {
                            //open change password
                          },
                        ),
                        _buildDivider(),
                        ListTile(
                          leading: const Icon(
                            FontAwesomeIcons.language,
                            color: kMainColor,
                          ),
                          title: const Text("Mudar idioma"),
                          trailing: const Icon(Icons.keyboard_arrow_right),
                          onTap: () {
                            //open change language
                          },
                        ),
                        _buildDivider(),
                        ListTile(
                          leading: const Icon(
                            Icons.location_on,
                            color: kMainColor,
                          ),
                          title: const Text("Mudar endereço"),
                          trailing: const Icon(Icons.keyboard_arrow_right),
                          onTap: () {
                            //open change location
                          },
                        ),
                        _buildDivider(),
                        ListTile(
                          leading: const Icon(
                            Icons.exit_to_app,
                            color: kMainColor,
                          ),
                          title: const Text("Sair da conta"),
                          trailing: const Icon(Icons.keyboard_arrow_right),
                          onTap: () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                '/auth', (Route<dynamic> route) => false);
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    "Configurações de Notificação",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    ),
                  ),
                  SwitchListTile(
                    activeColor: Color.fromARGB(255, 255, 187, 0),
                    contentPadding: const EdgeInsets.all(0),
                    value: _notification,
                    title: const Text("Receber notificações"),
                    onChanged: (val) {
                      setState(() {
                        _notification = val;
                      });
                    },
                  ),
                  SwitchListTile(
                    activeColor: Color.fromARGB(255, 255, 187, 0),
                    contentPadding: EdgeInsets.all(0),
                    value: _news,
                    title: Text("Receber noticias"),
                    onChanged: (val) {
                      setState(() {
                        _news = val;
                      });
                    },
                  ),
                  SwitchListTile(
                    activeColor: Color.fromARGB(255, 255, 187, 0),
                    contentPadding: const EdgeInsets.all(0),
                    value: _offer,
                    title: const Text("Receber ofertas"),
                    onChanged: (val) {
                      setState(() {
                        _offer = val;
                      });
                    },
                  ),
                  SwitchListTile(
                    activeColor: Color.fromARGB(255, 255, 187, 0),
                    contentPadding: EdgeInsets.all(0),
                    value: _appUpdate,
                    title: Text("Receber atualizações de versão do app"),
                    onChanged: (val) {
                      setState(() {
                        _appUpdate = val;
                      });
                    },
                  ),
                  const SizedBox(height: 60.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      width: double.infinity,
      height: 1.0,
      color: Colors.grey.shade400,
    );
  }
}
