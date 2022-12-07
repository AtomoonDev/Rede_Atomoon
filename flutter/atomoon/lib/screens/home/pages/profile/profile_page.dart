import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:atomoon/config/constants.dart';
import 'package:atomoon/screens/home/home_screen.dart';
import 'package:atomoon/screens/home/pages/home/home_page.dart';
import 'package:atomoon/screens/home/pages/settings/settings_page.dart';
import 'package:atomoon/screens/signIn_or_signUp/login_screen.dart';
import 'package:atomoon/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'components/profile_list_item.dart';
import 'components/payment.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
                        // AssetImage('lib/assets/images/lua_semborda1.png'),
                        NetworkImage(
                            'https://images.unsplash.com/photo-1528953030358-b0c7de371f1f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=651&q=80')),
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
          const Text(
            'seuNome@gmail.com',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          const SizedBox(height: kSpacingUnit * 2),
          const SizedBox(
            height: kSpacingUnit * 1,
            width: kSpacingUnit * 3,
          ),
        ],
      ),
    );
    var header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(width: kSpacingUnit * 3),
        profileInfo,
        const SizedBox(width: kSpacingUnit * 3),
      ],
    );

    return Scaffold(
      body: Column(
        children: <Widget>[
          const SizedBox(height: kSpacingUnit * 5),
          header,
          Expanded(
            child: ListView(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Payment(),
                      ),
                    );
                  },
                  child: const ProfileListItem(
                    icon: LineAwesomeIcons.money_bill,
                    text: 'Métodos de pagamento',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const HomeScreen(dfCurrentPage: 1)),
                        (route) => false);
                  },
                  child: const ProfileListItem(
                    icon: LineAwesomeIcons.weixin__wechat_,
                    text: 'Contatos',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const HomeScreen(dfCurrentPage: 3)),
                        (route) => false);
                  },
                  child: const ProfileListItem(
                    icon: LineAwesomeIcons.home,
                    text: 'Endereços',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const HomeScreen(dfCurrentPage: 3)),
                        (route) => false);
                  },
                  child: const ProfileListItem(
                    icon: LineAwesomeIcons.cog,
                    text: 'Configurações',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/auth', (Route<dynamic> route) => false);
                  },
                  child: const ProfileListItem(
                    icon: LineAwesomeIcons.alternate_sign_out,
                    text: 'Sair da conta',
                    hasNavigation: false,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
