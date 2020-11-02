import 'package:dance/ui-screens/widgets/appBar_screen.dart';
import 'package:dance/ui-screens/widgets/buttons/styled_block_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../theme.dart';

class SignInOtherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginOther(),
    );
  }
}

class LoginOther extends StatefulWidget {
  @override
  _SignInOtherState createState() => _SignInOtherState();
}

class _SignInOtherState extends State<LoginOther> {
  double _width;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: styledAppbar(context),
      body: Padding(
        padding: EdgeInsets.all(14),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 90),
            WhatsAppButton(),
            SizedBox(height: 10),
            TelegramButton(),
            SizedBox(height: 10),
            InstagramButton(),
            SizedBox(height: 10),
            GoogleButton(),
            SizedBox(height: 10),
            TwiterButton(),
            TextRow(),
          ],
        ),
      ),
    );
  }

  Widget WhatsAppButton() {
    return StyledBlockButton(
      text: 'Connect with WhatsApp',
      icon: FontAwesomeIcons.whatsapp,
      color: Styles.primaryWhatsApp,
      textColor: Colors.white,
      width: _width,
      onPressed: () => {},
    );
  }

  Widget TelegramButton() {
    return StyledBlockButton(
      text: 'Connect with Telegram',
      icon: FontAwesomeIcons.telegramPlane,
      color: Styles.primaryTelegram,
      textColor: Colors.white,
      width: _width,
      onPressed: () => {},
    );
  }

  Widget InstagramButton() {
    return StyledBlockButton(
      text: 'Connect with Instagram',
      icon: FontAwesomeIcons.instagram,
      color: Styles.primaryInstagram,
      textColor: Colors.white,
      width: _width,
      onPressed: () => {},
    );
  }

  Widget GoogleButton() {
    return StyledBlockButton(
      text: 'Connect with Google',
      icon: FontAwesomeIcons.google,
      color: Styles.primaryGoogle,
      textColor: Colors.white,
      width: _width,
      onPressed: () => {},
    );
  }

  Widget TwiterButton() {
    return StyledBlockButton(
      text: 'Connect with Twitter',
      icon: FontAwesomeIcons.twitter,
      color: Styles.primaryTwitter,
      textColor: Colors.white,
      width: _width,
      onPressed: () => {},
    );
  }

  Widget TextRow() {
    return Container(
      child: Row(
        children: <Widget>[
          FlatButton(
            textColor: Color(0xFF2D1E55),
            child: Text(
              'I ALREADY HAVE AN ACCOUNT'.toUpperCase(),
              style: TextStyle(
                fontFamily: 'SF UI Text',
                fontSize: 13,
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
          )
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}
