import 'package:flutter/material.dart';

class Styles {
  static Color primaryDarkPurple = Color(0xFF2D1E55);
  static Color primaryPink = Color(0xFFF9437C);
  static Color primaryDarkBlue = Color(0xFF3B5998);
  static Color primaryInstagram = Color(0xffC13584);
  static Color primaryEasyBlue = Color(0xFF2CCAE2);
  static Color primaryDarkWhite = Color(0xffC6C7DB);
  static Color primaryEasyPurple = Color(0xffA2A3C3);
  static Color primaryGoogle = Color(0xffDB4437);
  static Color primaryWhatsApp = Color(0xff25D366);
  static Color primaryTwitter = Color(0xff1DA1F2);
  static Color primaryTelegram = Color(0xff0088CC);
  static Color primarySpotify = Color(0xff1DB954);
  static Color primaryAppleMusic = Color(0xffB166CC);
  static Color primarySnapchat = Color(0xffFFFC00);

  static Color primary30 = Colors.white;

  static Color primary = primaryDarkPurple;

  static TextStyle defaultStyle = TextStyle(
    color: primaryDarkPurple,
    fontFamily: 'SF UI Text',
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.normal,
    letterSpacing: -0.024,
    fontSize: 17,
  );
  static TextStyle defaultDisplayStyle = TextStyle(
    fontFamily: 'SF UI Display',
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.normal,
    color: Styles.primaryDarkPurple,
    fontSize: 34,
  );
  static TextStyle pinkTextStyle = TextStyle(
    fontFamily: 'SF UI Text',
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.normal,
    fontSize: 15,
    color: primaryPink,
  );

  static TextStyle p = TextStyle(
    fontSize: 13,
    height: 20 / 14,
    color: primaryEasyPurple,
    fontFamily: 'SF UI Text',
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.normal,
  );

  static TextStyle defaultLabelStyle = TextStyle(
    fontFamily: 'SF UI Display',
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.normal,
    color: Styles.primaryDarkPurple,
    fontSize: 22,
  );

  static TextStyle formError = defaultStyle.copyWith(
    fontWeight: FontWeight.w500,
    fontSize: 11.0,
    height: 14 / 11,
    color: Colors.red,
  );

  static InputDecoration input = InputDecoration(
    fillColor: Colors.white,
    filled: true,
    focusColor: primary,
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: primary,
        width: 2.0,
      ),
    ),
    border: OutlineInputBorder(
      gapPadding: 1.0,
      borderSide: BorderSide(
        color: primary,
        width: 1.0,
      ),
    ),
    hintStyle: TextStyle(
      color: primaryEasyPurple,
    ),
  );
}
