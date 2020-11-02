import 'package:dance/ui-screens/widgets/appBar_screen.dart';
import 'package:dance/ui-screens/widgets/buttons/styled_block_button.dart';
import 'package:dance/ui-screens/widgets/textformfield.dart';
import 'package:flutter/material.dart';

import '../../theme.dart';

class RestorePswPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RestorePassword(),
    );
  }
}

class RestorePassword extends StatefulWidget {
  @override
  _RestorePswState createState() => _RestorePswState();
}

class _RestorePswState extends State<RestorePassword> {
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
            SizedBox(height: 20),
            SignUpButton(),
          ],
        ),
      ),
    );
  }

  Widget welcomeTextRow() {
    return Container(
      margin: EdgeInsets.only(left: 0, top: _height / 3),
      child: Row(
        children: <Widget>[
          Text(
            "Enter a new password",
            style: TextStyle(
              fontFamily: 'SF UI Display',
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: Styles.primaryDarkPurple,
            ),
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
            repeatPasswordTextFormField(),
            SizedBox(height: 10),
            passwordTextFormField(),
          ],
        ),
      ),
    );
  }

  Widget repeatPasswordTextFormField() {
    return Theme(
      data: new ThemeData(
        primaryColor: Styles.primaryEasyBlue,
      ),
      child: CustomTextField(
        keyboardType: TextInputType.visiblePassword,
        textEditingController: emailController,
        icon: Icons.email,
        hint: "Password",
      ),
    );
  }

  Widget passwordTextFormField() {
    return Theme(
      data: new ThemeData(
        primaryColor: Styles.primaryEasyBlue,
      ),
      child: CustomTextField(
        keyboardType: TextInputType.visiblePassword,
        textEditingController: passwordController,
        icon: Icons.lock,
        obscureText: true,
        hint: "Repeat password",
      ),
    );
  }

  Widget SignUpButton() {
    return StyledBlockButton(
      text: 'Restore password',
      icon: null,
      color: Styles.primaryEasyBlue,
      textColor: Colors.white,
      width: _width,
      onPressed: () => {
        Navigator.pushNamed(context, '/login-email'),
        print("Routing to Sign up screen"),
        print(emailController.text),
        print(passwordController.text),
      },
    );
  }
}
