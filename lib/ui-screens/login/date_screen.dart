import 'package:dance/ui-screens/widgets/appBar_screen.dart';
import 'package:dance/ui-screens/widgets/date/date_picker_input.dart';
import 'package:dance/ui-screens/widgets/buttons/styled_flat_button.dart';
import 'package:flutter/material.dart';

import '../../theme.dart';

class DateFormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DateForm(),
    );
  }
}

class DateForm extends StatefulWidget {
  @override
  _DateFormState createState() => _DateFormState();
}

class _DateFormState extends State<DateForm> {
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
      margin: EdgeInsets.only(left: 0, top: _height / 2.1),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "My birthday is",
              style: Styles.defaultLabelStyle,
            ),
            SizedBox(height: 10),
            DatePickerInput(
              onChanged: (date) {
                print('Selected date: $date');
              },
            ),
            SizedBox(height: 20),
            StyledFlatButton(
              '>>>',
              onPressed: () => (Navigator.pushNamed(context, '/user-type')),
            ),
          ],
        ),
      ),
    );
  }
}
