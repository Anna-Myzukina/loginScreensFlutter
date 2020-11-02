import 'package:dance/ui-screens/widgets/responsive_ui.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final TextEditingController textEditingController;
  final TextInputType keyboardType;
  final bool obscureText;
  final IconData icon;
  double _width;
  double _pixelRatio;
  bool large;
  bool medium;

  CustomTextField({
    this.hint,
    this.textEditingController,
    this.keyboardType,
    this.icon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(width: 0.1, color: Colors.white),
      ),
      elevation: 0.0,

      child: TextFormField(
        controller: textEditingController,
        keyboardType: keyboardType,
        cursorColor: Color(0xFF2CCAE2),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: 15,
            fontFamily: 'SF UI Text',
            fontWeight: FontWeight.normal,
            fontStyle: FontStyle.normal,
            letterSpacing: -0.024,
            color: Color(0xFFA79CC4),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(width: 0.5, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
