import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../theme.dart';

class GetImage extends StatelessWidget {
  final onTap;

  // final String text;
  // final double radius;
  const GetImage(t, {this.onTap, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(12),
      dashPattern: [10, 10],
      color: Styles.primaryPink,
      child: Container(
        height: 140,
        width: 140,
        color: Styles.primary30,
        alignment: Alignment.center,
        child: InkWell(
          child: Text(
            '+',
            style: TextStyle(
              fontFamily: 'SF UI Text',
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              color: Color(0xFFF9437C),
              fontSize: 30,
            ),
          ),
          onTap: () {
            this.onTap();
          },
        ),
      ),
    );
  }
}
