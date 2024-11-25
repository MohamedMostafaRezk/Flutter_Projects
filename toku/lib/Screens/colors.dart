// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:toku/Components/item.dart';
import 'package:toku/models/number.dart';

class ColorsPage extends StatelessWidget {
  const ColorsPage({Key? key}) : super(key: key);
  final List<Model> numbers = const [
    Model(
        image: 'assets/images/colors/color_black.png',
        jpName: 'Kuro',
        enName: 'black',
        sound: 'sounds/colors/black.wav'),
    Model(
        image: 'assets/images/colors/color_brown.png',
        jpName: 'Kasshoku',
        enName: 'brown',
        sound: 'sounds/colors/brown.wav'),
    Model(
        image: 'assets/images/colors/color_gray.png',
        jpName: 'Gurē',
        enName: 'gray',
        sound: 'sounds/colors/gray.wav'),
    Model(
        image: 'assets/images/colors/color_green.png',
        jpName: 'Midori',
        enName: 'green',
        sound: 'sounds/colors/green.wav'),
    Model(
        image: 'assets/images/colors/color_red.png',
        jpName: 'Aka',
        enName: 'red',
        sound: 'sounds/colors/red.wav'),
    Model(
        image: 'assets/images/colors/color_white.png',
        jpName: 'Shiro',
        enName: 'white',
        sound: 'sounds/colors/white.wav'),
    Model(
        image: 'assets/images/colors/yellow.png',
        jpName: 'Ki',
        enName: 'yellow',
        sound: 'sounds/colors/yellow.wav'),
    Model(
        image: 'assets/images/colors/color_dusty_yellow.png',
        jpName: 'Hokori no ōi ki',
        enName: 'dusty yellow',
        sound: 'sounds/colors/dusty yellow.wav'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 84, 46, 33),
        foregroundColor: Colors.white,
        title: const Text('Family Members'),
      ),

      // to make scroll in a page
      body: ListView.builder(
        //children: getlist(numbers), // this with listview only not builder
        itemCount: numbers.length,
        // ignore: non_constant_identifier_names
        itemBuilder: (Context, index) {
          return Item(
            number: numbers[index],
            color: Colors.purple,
          );
        },
      ),
    );
  }

// this with anything neither listview.builder
  // List<Widget> getlist(List<Number> numbers) {
  //   List<Widget> itemslist = [];
  //   for (int i = 0; i < numbers.length; i++) {
  //     itemslist.add(Item(number: numbers[i]));
  //   }
  //   return itemslist;
  // }
}
