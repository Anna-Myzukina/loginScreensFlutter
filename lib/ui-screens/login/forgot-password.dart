import 'package:dance/ui-screens/widgets/appBar_screen.dart';
import 'package:dance/ui-screens/widgets/buttons/styled_block_button.dart';
import 'package:dance/ui-screens/widgets/textformfield.dart';
import 'package:flutter/material.dart';

import '../../theme.dart';

class ResetPswPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResetPassword(),
    );
  }
}

class ResetPassword extends StatefulWidget {
  @override
  _ResetPswState createState() => _ResetPswState();
}

class _ResetPswState extends State<ResetPassword> {
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
            SubtitleRow(),
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
      margin: EdgeInsets.only(left: 0, top: _height / 2.7),
      child: Row(
        children: <Widget>[
          Text(
            "Restore password",
            style: Styles.defaultLabelStyle,
          ),
        ],
      ),
    );
  }

  Widget SubtitleRow() {
    return Container(
      margin: EdgeInsets.only(left: 0, top: 10),
      width: _width / 2.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: _width / 1.2,
            child: Text(
              "Enter your email and we will"
              " send you a link to restore",
              textAlign: TextAlign.left,
              style: Styles.defaultStyle,
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
            emailTextFormField(),
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

  Widget SignUpButton() {
    return StyledBlockButton(
      text: 'Restore password',
      icon: null,
      color: Styles.primaryEasyBlue,
      textColor: Colors.white,
      width: _width,
      onPressed: () => {
        Navigator.pushNamed(context, '/restore-password'),
        print("Routing to Sign up screen"),
        print(emailController.text),
        print(passwordController.text),
      },
    );
  }
}
