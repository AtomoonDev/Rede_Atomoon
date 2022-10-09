import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String text;
  final AssetImage image;

  const CategoryCard({Key? key, required this.text, required this.image}) : super(key: key);

  factory  CategoryCard.fromJson(dynamic json) {
    return CategoryCard(text: json['text'] as String, image: AssetImage(json['image']));
  }


  @override
  Widget build(BuildContext context) {
    return Container(
        height: 160,
        width: 500,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          image: DecorationImage(
              fit: BoxFit.fill,
              image: image),
        ),
        child: Row(children: [
          Card(
            elevation: 0,
            color: Colors.transparent,
            child: Padding(
              padding: EdgeInsets.only(left: 45),
              child: Text(text,
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontFamily: 'Poppins',
                      fontSize: 17.0,
                      fontWeight: FontWeight.w400)),
            ),
          ),
        ]));
  }
}
