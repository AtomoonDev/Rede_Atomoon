import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class Payment extends StatefulWidget {
  const Payment({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  var numberController = TextEditingController();
  final _autoValidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text('Metodo de pagamento'),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Form(
              key: _formKey,
              autovalidateMode: _autoValidateMode,
              child: ListView(
                children: <Widget>[
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: 250,
                    width: 120,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage('lib/assets/images/credit_card.png'),
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(
                        //<-- SEE HERE
                        width: 5,
                        color: const Color.fromARGB(255, 28, 67, 177),
                      ),
                      borderRadius: BorderRadiusDirectional.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        )
                      ],
                    ),
                    child: Center(
                      child: Stack(
                        children: <Widget>[
                          // Stroked text as border.
                          Text(
                            'CARTÃO DE CREDITO',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 6
                                ..color =
                                    const Color.fromARGB(255, 168, 153, 15),
                            ),
                          ),
                          // Solid text as fill.
                          Text(
                            'CARTÃO DE CREDITO',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                              color: Colors.grey[300],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      filled: true,
                      icon: Icon(
                        Icons.person,
                        size: 40.0,
                      ),
                      hintText: 'Qual o nome escrito no cartão?',
                      labelText: 'Nome do Cartão',
                    ),
                    keyboardType: TextInputType.text,
                    validator: (String? value) =>
                        value!.isEmpty ? 'Aqui' : null,
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: const [],
                    controller: numberController,
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.credit_card,
                        size: 40.0,
                      ),
                      border: UnderlineInputBorder(),
                      filled: true,
                      hintText: 'Numero escrito no cartão',
                      labelText: 'Numero do Cartão',
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(4),
                    ],
                    decoration: InputDecoration(
                      border: const UnderlineInputBorder(),
                      filled: true,
                      icon: Icon(
                        Icons.credit_card,
                        size: 40.0,
                        color: Colors.grey[600],
                      ),
                      hintText: 'Numero escrito no verso do cartão',
                      labelText: 'CVV do Cartão',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(4),
                    ],
                    decoration: InputDecoration(
                      border: const UnderlineInputBorder(),
                      filled: true,
                      icon: Icon(
                        Icons.calendar_today,
                        size: 40.0,
                        color: Colors.grey[600],
                      ),
                      hintText: 'MM/YY',
                      labelText: 'Data de expiração do cartão',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                ],
              )),
        ));
  }
}
