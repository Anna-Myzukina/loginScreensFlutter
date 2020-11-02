import 'package:flutter/material.dart';

class SettingsScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SettingsScreen(),
    );
  }
}

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double _height;
  double _width;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Material(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(14),
          height: _height,
          width: _width,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[],
            ),
          ),
        ),
      ),
    );
  }
}
