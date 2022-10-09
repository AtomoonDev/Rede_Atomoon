import 'package:flutter/material.dart';

class RoundedDFBtn extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  bool isOutlinedBtn;

  RoundedDFBtn({
    Key? key,
    required this.onPressed,
    required this.text,
    this.isOutlinedBtn = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isOutlinedBtn
        ? OutlinedButton(
            style: OutlinedButton.styleFrom(
              primary: Colors.white,
              side: BorderSide(color: Theme.of(context).primaryColor),
              backgroundColor: Colors.transparent,
              onSurface: Colors.white,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))),
            ),
            onPressed: onPressed,
            child: Text(text),
          )
        : 
        TextButton(
            style: TextButton.styleFrom(
              primary: Colors.white,
              backgroundColor: Theme.of(context).primaryColor,
              onSurface: Colors.white,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))),
            ),
            onPressed: onPressed,
            child: Text(text),
          );
  }
}
