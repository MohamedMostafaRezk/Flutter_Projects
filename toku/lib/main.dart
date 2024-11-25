import 'package:flutter/material.dart';
import 'Screens/Home_page.dart';

void main() => runApp(const toku());

// ignore: camel_case_types
class toku extends StatelessWidget {
  const toku({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}