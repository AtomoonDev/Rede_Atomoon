import 'package:flutter/material.dart';

class RoundedDFBtn extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool isOutlinedBtn;

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
              foregroundColor: Colors.white, side: BorderSide(color: Theme.of(context).primaryColor), 
              disabledForegroundColor: Colors.white.withOpacity(0.38),
              backgroundColor: Colors.transparent,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))),
            ),
            onPressed: onPressed,
            child: Text(text),
          )
        :
        TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white, backgroundColor: Theme.of(context).primaryColor, disabledForegroundColor: Colors.white.withOpacity(0.38),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))),
            ),
            onPressed: onPressed,
            child: Text(text),
          );
  }
}
