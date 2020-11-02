import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dance/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Dance Match",
      theme: ThemeData(
        fontFamily: 'SF UI Display',
      ),
      routes: routes,
      initialRoute: '/',
    );
  }
}
