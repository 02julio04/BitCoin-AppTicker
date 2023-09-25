import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xfff1e9e9),
        primaryColor: Color(0xff28468d),
      ),
      home: HomePage(),
    );
  }
}