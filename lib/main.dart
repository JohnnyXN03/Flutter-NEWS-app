import 'package:flutter/material.dart';
import 'package:newsx/descr.dart';
import 'package:newsx/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Home(),
        '/second': (context) => Descr(null),
      },
      initialRoute: '/',
    );
  }
}
