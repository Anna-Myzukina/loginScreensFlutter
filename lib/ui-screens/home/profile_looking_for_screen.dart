import 'package:flutter/material.dart';

class LookingForPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LookingForScreen(),
    );
  }
}

class LookingForScreen extends StatefulWidget {
  @override
  _LookingForScreenState createState() => _LookingForScreenState();
}

class _LookingForScreenState extends State<LookingForScreen> {
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
