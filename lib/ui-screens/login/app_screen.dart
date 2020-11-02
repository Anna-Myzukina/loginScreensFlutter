import 'package:dance/theme.dart';
import 'package:dance/ui-screens/widgets/buttons/styled_block_button.dart';
import 'package:dance/ui-screens/widgets/buttons/styled_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppScreen(),
    );
  }
}

class AppScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<AppScreen> {
  bool checkBoxValue = false;
  double _height;
  double _width;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    // return Material(
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(14),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: _height / 35,
            ),
            infoTextRow(),
            loginFacebook(),
            SizedBox(
              height: 10,
            ),
            loginEmail(),
            SizedBox(
              height: 10,
            ),
            loginOther(),
            bottomText(),
          ],
        ),
      ),
    );
  }

  Widget infoTextRow() {
    return Container(
      margin: EdgeInsets.only(top: 82),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Fitness", style: Styles.defaultDisplayStyle),
        ],
      ),
    );
  }

  Widget loginFacebook() {
    return Container(
      margin: EdgeInsets.only(top: 140),
      child: StyledBlockButton(
        text: 'Connect with FACEBOOK',
        icon: FontAwesomeIcons.facebookF,
        color: Styles.primaryDarkBlue,
        textColor: Colors.white,
        width: _width,
        onPressed: () => {
          Navigator.pushNamed(context, '/login-facebook'),
        },
      ),
    );
  }

  Widget loginEmail() {
    return StyledBlockButton(
      text: 'Register with email',
      icon: null,
      color: Styles.primaryEasyBlue,
      textColor: Colors.white,
      width: _width,
      onPressed: () => {
        Navigator.pushNamed(context, '/login-email'),
      },
    );
  }

  Widget loginOther() {
    return Container(
      child: StyledOutlinedButton(
        'Other',
        onPressed: () => {Navigator.pushNamed(context, '/login-other')},
        width: _width,
      ),
    );
  }

  Widget bottomText() {
    return Container(
      child: Row(
        children: <Widget>[
          FlatButton(
            textColor: Styles.primaryDarkPurple,
            child: Text(
              'I already have an account'.toUpperCase(),
              style: TextStyle(
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
