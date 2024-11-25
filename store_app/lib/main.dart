import 'package:flutter/material.dart';
import 'package:store_app/screens/Update_products.dart';
import 'package:store_app/screens/homepage.dart';

void main() => runApp(const StorApp());

class StorApp extends StatelessWidget {
  const StorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        Homepage.id: (context) => const Homepage(),
        UpdateProducts.id: (context) => UpdateProducts(),
      },
      initialRoute: Homepage.id,
    );
  }
}
