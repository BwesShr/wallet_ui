import 'package:flutter/material.dart';

import 'ui/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF48A9A6),
        primaryColorDark: Color(0xFF2D807D),
      ),
      home: HomePage(title: 'Wallet App'),
    );
  }
}