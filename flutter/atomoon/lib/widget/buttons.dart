import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final VoidCallback onTap;
  final List<Color> colors;
  final Widget icon;
  final String text;

  const MyButton({
    Key? key,
    required this.onTap,
    required this.colors,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        clipBehavior: Clip.antiAlias,
        shape: const StadiumBorder(),
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: colors,
            ),
          ),
          width: double.infinity,
          height: 60,
          child: InkWell(
            onTap: onTap,
            child: ListTile(
              leading: icon,
              title: Text(text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}