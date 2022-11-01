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
            margin: const EdgeInsets.only(top: kSpacingUnit * 0.1),
            child: Stack(
              children: <Widget>[
                const CircleAvatar(
                  radius: kSpacingUnit * 6,
                  backgroundImage:
                      AssetImage('lib/assets/images/lua_semborda1.png'),
                ),

              ],
            ),
          ),
          const SizedBox(height: kSpacingUnit * 2),
          const Text('Seu Nome'),
          const SizedBox(height: kSpacingUnit * 0.5),
          const Text(
            'seuNome@gmail.com',
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
                        builder: (context) => const HomeScreen(),
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
                                        Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  },
                  child: const ProfileListItem(
                    icon: LineAwesomeIcons.weixin__wechat_,
                    text: 'Contatos',
                  ),

                ),
                GestureDetector(
                  onTap: () {
                                        Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  },
                  child: const ProfileListItem(
                    icon: LineAwesomeIcons.home,
                    text: 'Endereços',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                                        Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SettingsPage(),
                      ),
                    );
                  },
                  child: const ProfileListItem(
                    icon: LineAwesomeIcons.cog,
                    text: 'Configurações',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                  child: const ProfileListItem(
                    icon: LineAwesomeIcons.alternate_sign_out,
                    text: 'Logout',
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
