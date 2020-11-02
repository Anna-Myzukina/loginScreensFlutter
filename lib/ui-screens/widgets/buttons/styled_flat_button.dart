import 'package:flutter/material.dart';

import '../../../theme.dart';

class StyledFlatButton extends StatelessWidget {
  final String text;
  final onPressed;
  final double radius;

  const StyledFlatButton(this.text, {this.onPressed, Key key, this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      // height: 60,
      color: Styles.primaryEasyBlue,
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
        child: Text(
          this.text,
          style: Styles.p.copyWith(
            color: Colors.white,
            fontSize: 18,
            fontFamily: 'SF UI Text',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      onPressed: () {
        this.onPressed();
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: Styles.primaryEasyBlue,
          width: 2,
        ),
      ),
    );
  }
}
