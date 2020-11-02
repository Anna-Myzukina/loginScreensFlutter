import 'package:flutter/material.dart';

Widget styledAppbar(context) {
  return AppBar(
    titleSpacing: 0.0,
    automaticallyImplyLeading: false,
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
        color: Color(0xFFF9437C),
      ),
      onPressed: () => Navigator.of(context).pop(),
    ),
    // title: Text(
    //   text,
    //   style: TextStyle(
    //     fontFamily: 'SF UI Text',
    //     fontWeight: FontWeight.normal,
    //     fontStyle: FontStyle.normal,
    //     color: Color(0xFFF9437C),
    //     fontSize: 17,
    //   ),
    // ),
    centerTitle: false,
    elevation: 0.0,
    backgroundColor: Colors.transparent,
  );
}
