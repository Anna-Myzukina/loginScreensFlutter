import 'package:dance/ui-screens/widgets/appBar_screen.dart';
import 'package:dance/ui-screens/widgets/buttons/styled_flat_button.dart';
import 'package:dance/ui-screens/widgets/textformfield.dart';
import 'package:flutter/material.dart';

import '../../theme.dart';

class LoginEmailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginEmail(),
    );
  }
}

class LoginEmail extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<LoginEmail> {
  double _height;
  double _width;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: styledAppbar(context),
      body: Padding(
        padding: EdgeInsets.all(14),
        child: ListView(
          children: <Widget>[
            welcomeTextRow(),
            form(),
            SizedBox(height: 40),
            SignUpButton(),
            privacyTextRow(),
          ],
        ),
      ),
    );
  }

  Widget welcomeTextRow() {
    return Container(
      margin: EdgeInsets.only(left: 0, top: _height / 4),
      child: Row(
        children: <Widget>[
          Text("Sign up", style: Styles.defaultLabelStyle),
        ],
      ),
    );
  }

  Widget form() {
    return Container(
      margin: EdgeInsets.only(top: 14),
      child: Form(
        key: _key,
        child: Column(
          children: <Widget>[
            emailTextFormField(),
            SizedBox(height: 10),
            passwordTextFormField(),
          ],
        ),
      ),
    );
  }

  Widget emailTextFormField() {
    return Theme(
      data: new ThemeData(
        primaryColor: Styles.primaryEasyBlue,
      ),
      child: CustomTextField(
        keyboardType: TextInputType.emailAddress,
        textEditingController: emailController,
        icon: Icons.email,
        hint: "Email",
      ),
    );
  }

  Widget passwordTextFormField() {
    return Theme(
      data: new ThemeData(
        primaryColor: Styles.primaryEasyBlue,
        hintColor: Colors.white,
      ),
      child: CustomTextField(
        keyboardType: TextInputType.emailAddress,
        textEditingController: passwordController,
        icon: Icons.lock,
        obscureText: true,
        hint: "Password",
      ),
    );
  }

  Widget SignUpButton() {
    return Container(
      child: StyledFlatButton(
        'Sign up',
        onPressed: () => {
          Navigator.pushNamed(context, '/registration-profile'),
          print("Routing to Sign up screen"),
          print(emailController.text),
          print(passwordController.text),
        },
      ),
    );
  }

  Widget privacyTextRow() {
    return Container(
      child: Row(
        children: <Widget>[
          FlatButton(
            textColor: Styles.primaryDarkPurple,
            child: Text(
              'Terms of service, privacy policy'.toUpperCase(),
              style: TextStyle(
                fontSize: 13,
              ),
            ),
            onPressed: () {
            },
          )
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}
