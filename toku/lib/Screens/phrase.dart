// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:toku/Components/item2.dart';
import 'package:toku/models/number.dart';

class PhrasePage extends StatelessWidget {
  const PhrasePage({Key? key}) : super(key: key);
  final List<Model> numbers = const [
    Model(jpName: 'Kuro', enName: 'black', sound: 'sounds/colors/black.wav'),
    Model(
        jpName: 'Kasshoku', enName: 'brown', sound: 'sounds/colors/brown.wav'),
    Model(jpName: 'Gurē', enName: 'gray', sound: 'sounds/colors/gray.wav'),
    Model(jpName: 'Midori', enName: 'green', sound: 'sounds/colors/green.wav'),
    Model(jpName: 'Aka', enName: 'red', sound: 'sounds/colors/red.wav'),
    Model(jpName: 'Shiro', enName: 'white', sound: 'sounds/colors/white.wav'),
    Model(jpName: 'Ki', enName: 'yellow', sound: 'sounds/colors/yellow.wav'),
    Model(
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
        title: const Text('Phrases'),
      ),

      // to make scroll in a page
      body: ListView.builder(
        //children: getlist(numbers), // this with listview only not builder
        itemCount: numbers.length,
        // ignore: non_constant_identifier_names
        itemBuilder: (Context, index) {
          return Item2(
            number: numbers[index],
            color: Colors.blue,
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
