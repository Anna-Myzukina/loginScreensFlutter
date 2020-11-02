// import 'package:flutter/material.dart';
//
// class StyledBlockButton extends StatelessWidget {
//   final String text;
//   final onPressed;
//   final double radius;
//   final color;
//   final width;
//   final icon;
//   final textColor;
//
//   const StyledBlockButton(
//     this.text, {
//     this.onPressed,
//     Key key,
//     this.radius,
//     this.color,
//     this.width,
//     this.icon,
//     this.textColor,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 60,
//       width: this.width,
//       child: RaisedButton.icon(
//         elevation: 0,
//         shape:
//             RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
//         onPressed: () {
//           this.onPressed();
//         },
//         textColor: this.textColor,
//         color: this.color,
//         padding: EdgeInsets.all(0.0),
//         label: Text(
//           this.text,
//           style: TextStyle(
//             fontSize: 16,
//             fontFamily: 'SF UI Display',
//             fontStyle: FontStyle.normal,
//             fontWeight: FontWeight.w400,
//           ),
//         ),
//         icon: IconButton(
//           icon: this.icon,
//           onPressed: () {},
//           iconSize: 30,
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class StyledBlockButton extends StatelessWidget {
  final icon;
  final color;
  final width;
  final textColor;
  final onPressed;
  final String text;

  final Function(bool) onFocusChange;

  const StyledBlockButton({
    Key key,
    @required this.icon,
    this.color,
    this.width,
    this.textColor,
    this.onPressed,
    this.text,
    this.onFocusChange = _dummyOnFocusChange,
  })  : assert(onFocusChange != null),
        super(key: key);

  static dynamic _dummyOnFocusChange(bool val) {}

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: this.width,
      child: RaisedButton(
        elevation: 0.0,
        onPressed: this.onPressed,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        textColor: this.textColor,
        color: this.color,
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Row(
            mainAxisAlignment: this.icon == null
                ? MainAxisAlignment.center
                : MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(
                this.icon,
              ),
              Text(
                this.text,
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'SF UI Text',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
