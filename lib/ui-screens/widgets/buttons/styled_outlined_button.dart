import 'package:flutter/material.dart';

import '../../../theme.dart';

class StyledOutlinedButton extends StatelessWidget {
  final String text;
  final onPressed;
  final width;

  const StyledOutlinedButton(
    this.text, {
    this.onPressed,
    Key key,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: OutlineButton(
        borderSide: BorderSide(
          color: Styles.primaryEasyBlue,
          width: 2,
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: Styles.primaryEasyBlue, width: 1)),
        onPressed: () {
          this.onPressed();
        },
        textColor: Styles.primaryEasyBlue,
        color: Colors.white,
        padding: EdgeInsets.all(0.0),
        child: Container(
          alignment: Alignment.center,
          width: this.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
          child: Text(
            this.text,
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'SF UI Text',
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
