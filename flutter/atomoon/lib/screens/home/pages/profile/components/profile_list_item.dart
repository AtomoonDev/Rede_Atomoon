import 'package:atomoon/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfileListItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool hasNavigation;

  const ProfileListItem({
    Key? key,
    required this.icon,
    required this.text,
    this.hasNavigation = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kSpacingUnit * 5.5,
      margin: EdgeInsets.symmetric(
        horizontal: kSpacingUnit * 4,
      ).copyWith(
        bottom: kSpacingUnit * 2,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: kSpacingUnit * 2,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kSpacingUnit * 3),
        color: Color.fromARGB(255, 36, 58, 105),
      ),
      child: Row(
        children: <Widget>[
          Icon(
            this.icon,
            size: kSpacingUnit * 2.5,
            color: Colors.white,
          ),
          SizedBox(width: kSpacingUnit * 1.5),
          Text(
            this.text,
            style: TextStyle(color: Colors.white),

          ),
          Spacer(),
          if (this.hasNavigation)
            Icon(
              LineAwesomeIcons.arrow_right,
              size: kSpacingUnit * 2.5,
              color: Colors.white,
            ),
        ],
      ),
    );
  }
}