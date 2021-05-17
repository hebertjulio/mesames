import 'package:flutter/material.dart';
import 'package:mesames/pages/home_page.dart';

void main() {
  runApp(MesamesApp());
}

class MesamesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mesames',
      home: HomePage(),
    );
  }
}
