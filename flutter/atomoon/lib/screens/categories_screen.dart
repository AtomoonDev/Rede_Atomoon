import 'package:atomoon/screens/telas.dart';
import 'package:flutter/material.dart';
import 'package:atomoon/widget/colorsys.dart';

const styleNameOfTitle = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 36, 58, 105),
    letterSpacing: -1.2);

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorsys.lightGrey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text('Atomoon', style: styleNameOfTitle),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.more_vert, color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: Colors.black),
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60,),
            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20)
                ),
                color: Colors.white
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Categorias", style: TextStyle(
                    color: Colorsys.darkGray,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),),
                  SizedBox(height: 20,),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(
                        color: Colorsys.lightGrey
                      ))
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Recomendadas", style: TextStyle(
                              color: Colorsys.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15
                            ),),
                            Container(
                              width: 50,
                              padding: EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(
                                  color: Colorsys.cyan,
                                  width: 3
                                ))
                              ),
                            )
                          ],
                        ),
                        SizedBox(width: 20,),
                        Text("Favoritadas", style: TextStyle(
                          color: Colorsys.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 15
                        ),)
                      ],
                    ),
                  ),
                  SizedBox(height: 30,),
                  Container(
                      height: 140,
                      width: 500,
                      decoration:
                      BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("lib/assets/images/card_img1.png")
                          ),
                      ),
                      child: Card(
                      elevation: 0,
                      color: Theme.of(context).primaryColor,
                      child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                      'O que você busca ?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontSize: 32.0,
                        fontWeight: FontWeight.w400

                        )
                      ),
                  ),
                  ),
                  ),

                  SizedBox(height: 30,),
                  Container(
                      height: 160,
                      width: 500,
                      decoration:
                      BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("lib/assets/images/card_img1.png")
                          ),
                      ),
                      child: Row (
                        children: [
                          Card(
                            elevation: 0,
                            color: Colors.transparent,
                            child: Padding(
                              padding: EdgeInsets.only(left: 45),
                              child: Text(
                              'Jardineiro',
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.7),
                                fontFamily: 'Poppins',
                                fontSize: 17.0,
                                fontWeight: FontWeight.w400
                                )
                              ),
                          ),
                          ),
                        ]

                      )

                  ),

                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
