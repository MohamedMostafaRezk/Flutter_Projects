// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:toku/Components/item.dart';
import 'package:toku/models/number.dart';

class NumberPage extends StatelessWidget {
  const NumberPage({Key? key}) : super(key: key);
  final List<Model> numbers = const [
    Model(
        image: 'assets/images/numbers/number_one.png',
        jpName: 'ichi',
        enName: 'one',
        sound: 'sounds/numbers/number_one_sound.mp3'),
    Model(
        image: 'assets/images/numbers/number_two.png',
        jpName: 'Ni',
        enName: 'two',
        sound: 'sounds/numbers/number_two_sound.mp3'),
    Model(
        image: 'assets/images/numbers/number_three.png',
        jpName: 'san',
        enName: 'three',
        sound: 'sounds/numbers/number_three_sound.mp3'),
    Model(
        image: 'assets/images/numbers/number_four.png',
        jpName: 'shi',
        enName: 'four',
        sound: 'sounds/numbers/number_four_sound.mp3'),
    Model(
        image: 'assets/images/numbers/number_five.png',
        jpName: 'Go',
        enName: 'five',
        sound: 'sounds/numbers/number_five_sound.mp3'),
    Model(
        image: 'assets/images/numbers/number_six.png',
        jpName: 'Roku',
        enName: 'six',
        sound: 'sounds/numbers/number_six_sound.mp3'),
    Model(
        image: 'assets/images/numbers/number_seven.png',
        jpName: 'Sebun',
        enName: 'seven',
        sound: 'sounds/numbers/number_seven_sound.mp3'),
    Model(
        image: 'assets/images/numbers/number_eight.png',
        jpName: 'hachi',
        enName: 'eight',
        sound: 'sounds/numbers/number_eight_sound.mp3'),
    Model(
        image: 'assets/images/numbers/number_nine.png',
        jpName: 'Ku',
        enName: 'nine',
        sound: 'sounds/numbers/number_nine_sound.mp3'),
    Model(
        image: 'assets/images/numbers/number_ten.png',
        jpName: 'Ju',
        enName: 'ten',
        sound: 'sounds/numbers/number_ten_sound.mp3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 84, 46, 33),
        foregroundColor: Colors.white,
        title: const Text('Numbers'),
      ),

      // to make scroll in a page
      body: ListView.builder(
        //children: getlist(numbers), // this with listview only not builder
        itemCount: numbers.length,
        // ignore: non_constant_identifier_names
        itemBuilder: (Context, index) {
          return Item(
            number: numbers[index],
            color: Colors.orange,
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
