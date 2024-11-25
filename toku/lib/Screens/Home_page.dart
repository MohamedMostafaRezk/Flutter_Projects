// ignore: file_names
import 'package:flutter/material.dart';
import 'package:toku/Components/Category.dart';
import 'package:toku/Screens/Number_page.dart';
import 'package:toku/Screens/colors.dart';
import 'package:toku/Screens/family_page.dart';
import 'package:toku/Screens/phrase.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 227, 209, 209),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 41, 30, 26),
        toolbarHeight: 100,
        title: const Text(
          'toku',
          style: TextStyle(
            color: Colors.white,
            fontSize: 32,
          ),
        ),
      ),
      body: Column(
        children: [
          Catagory(
            text: 'Numbers',
            color: Colors.orange,
            ontap: () {
              // مهم جدااا
              // to make Navigation mean move from one screen to another
              Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context) {
                  return const NumberPage();
                }),
              ); // push
            },
          ),
          Catagory(
            text: 'Family mumbers',
            color: Colors.green,
            ontap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context) {
                  return const FamilyPage();
                }),
              );
            },
          ),
          Catagory(
            text: 'Colors',
            color: Colors.purple,
            ontap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context) {
                  return const ColorsPage();
                }),
              );
            },
          ),
          Catagory(
            text: 'Phrases',
            color: Colors.blue,
            ontap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context) {
                  return const PhrasePage();
                }),
              );
            },
          ),
        ],
      ),
    );
  }
}
