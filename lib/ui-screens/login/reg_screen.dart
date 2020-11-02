import 'package:dance/ui-screens/widgets/appBar_screen.dart';
import 'package:dance/ui-screens/widgets/buttons/styled_flat_button.dart';
import 'package:dance/ui-screens/widgets/textformfield.dart';
import 'package:flutter/material.dart';

import '../../theme.dart';

class RegFormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RegForm(),
    );
  }
}

class RegForm extends StatefulWidget {
  @override
  _RegFormState createState() => _RegFormState();
}

class _RegFormState extends State<RegForm> {
  double _height;
  double _width;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _submit() async {
    final form = _formKey.currentState;

    if (form.validate()) {
      print('Form validated.');
    }
  }

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
            dateform(),
          ],
        ),
      ),
    );
  }

  Widget dateform() {
    return Container(
      margin: EdgeInsets.only(left: 0, top: _height / 2.2),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "My name",
              style: Styles.defaultLabelStyle,
            ),
            SizedBox(height: 10),
            CustomTextField(
              textEditingController: emailController,
              hint: "Your Name",
            ),
            SizedBox(height: 20),
            StyledFlatButton(
              '>>>',
              onPressed: () {
                Navigator.pushNamed(context, '/date-form');
                print("Routing to Sign up screen");
                print(emailController.text);
                print(passwordController.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
