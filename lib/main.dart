import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whealchair_guideness/view/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xff00BCD4), statusBarBrightness: Brightness.dark));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: SplashScreen(),
    );
  }
}
