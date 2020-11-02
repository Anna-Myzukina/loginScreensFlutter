import 'package:dance/ui-screens/widgets/appBar_screen.dart';
import 'package:flutter/material.dart';

class SignInFacebookPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginFacebook(),
    );
  }
}

class LoginFacebook extends StatefulWidget {
  @override
  _SignInFacebookState createState() => _SignInFacebookState();
}

class _SignInFacebookState extends State<LoginFacebook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: styledAppbar(context),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[],
        ),
      ),
    );
  }
}
