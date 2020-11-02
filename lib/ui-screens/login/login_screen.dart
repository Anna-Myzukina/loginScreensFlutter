import 'package:dance/ui-screens/widgets/appBar_screen.dart';
import 'package:dance/ui-screens/widgets/buttons/styled_flat_button.dart';
import 'package:dance/ui-screens/widgets/textformfield.dart';
import 'package:flutter/material.dart';

import '../../theme.dart';

class SignInOtherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Login(),
    );
  }
}

class Login extends StatefulWidget {
  @override
  _SignInOtherState createState() => _SignInOtherState();
}

class _SignInOtherState extends State<Login> {
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
      body: Container(
        padding: EdgeInsets.all(14),
        child: ListView(
          children: <Widget>[
            welcomeTextRow(),
            form(),
            SizedBox(height: 10),
            SignUpButton(),
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
          Text(
            "Log in",
            style: Styles.defaultLabelStyle,
          ),
        ],
      ),
    );
  }

  Widget form() {
    return Container(
      margin: EdgeInsets.only(left: 0, right: 0, top: 14),
      child: Form(
        key: _key,
        child: Column(
          children: <Widget>[
            emailTextFormField(),
            SizedBox(height: 10),
            passwordTextFormField(),
            ForgotPswText(),
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
        'Log In',
        onPressed: () => {
          Navigator.pushNamed(context, '/home'),
        },
      ),
    );
  }

  Widget ForgotPswText() {
    return Container(
      child: Row(
        children: <Widget>[
          FlatButton(
            child: Text(
              'forgot password?',
              style: Styles.defaultStyle,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/forgot-password');
            },
          )
        ],
        mainAxisAlignment: MainAxisAlignment.end,
      ),
    );
  }
}
