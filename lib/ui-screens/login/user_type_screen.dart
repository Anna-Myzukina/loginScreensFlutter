import 'package:dance/ui-screens/widgets/buttons/styled_outlined_button.dart';
import 'package:flutter/material.dart';

import '../../theme.dart';

class UserTypePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UserType(),
    );
  }
}

class UserType extends StatefulWidget {
  @override
  _UserTypeState createState() => _UserTypeState();
}

class _UserTypeState extends State<UserType> {
  double _height;
  double _width;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(14),
        child: ListView(
          children: <Widget>[
            welcomeTextRow(),
            SizedBox(height: 10),
            DancerButton(),
            SizedBox(height: 10),
            InstructorButton(),
            SizedBox(height: 10),
            BothButton(),
          ],
        ),
      ),
    );
  }

  Widget welcomeTextRow() {
    return Container(
      margin: EdgeInsets.only(left: 0, top: _height / 2.5),
      child: Row(
        children: <Widget>[
          Text(
            "Select",
            style: Styles.defaultLabelStyle,
          ),
        ],
      ),
    );
  }

  Widget DancerButton() {
    return Container(
      child: StyledOutlinedButton(
        'Dancer',
        onPressed: () => {Navigator.pushNamed(context, '/dancer-profile')},
        width: _width,
      ),
    );
  }

  Widget InstructorButton() {
    return Container(
      child: StyledOutlinedButton(
        'Instructor',
        onPressed: () => {Navigator.pushNamed(context, '/instructor-profile')},
        width: _width,
      ),
    );
  }

  Widget BothButton() {
    return Container(
      child: StyledOutlinedButton(
        'Both',
        onPressed: () => {},
        width: _width,
      ),
    );
  }
}
