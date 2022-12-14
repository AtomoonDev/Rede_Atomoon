// display info about categorie
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:atomoon/config/constants.dart';

class ProfileInfo extends StatefulWidget {
  const ProfileInfo({super.key});

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(896, 414));

    final profileInfo = Expanded(
      child: Column(
        children: <Widget>[
          Container(
            height: kSpacingUnit * 12,
            width: kSpacingUnit * 12,
            margin: const EdgeInsets.only(top: kSpacingUnit * 0.08),
            child: Stack(
              children: const <Widget>[
                CircleAvatar(
                  radius: kSpacingUnit * 6,
                  backgroundImage:
                      AssetImage('lib/assets/images/profile_icon.png'),
                ),
              ],
            ),
          ),
          const SizedBox(height: kSpacingUnit * 1.5),
          const Text('João Paulo',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              )),
          const SizedBox(height: kSpacingUnit * 0.5),
          const Text('Ola'),
          const SizedBox(height: kSpacingUnit * 2),
          const SizedBox(
            height: kSpacingUnit * 1,
            width: kSpacingUnit * 3,
          ),
        ],
      ),
    );
    var header = Row(
      children: <Widget>[
        const SizedBox(width: kSpacingUnit * 2),
        profileInfo,
        const SizedBox(width: kSpacingUnit * 2),
      ],
    );

    return header;
  }
}
