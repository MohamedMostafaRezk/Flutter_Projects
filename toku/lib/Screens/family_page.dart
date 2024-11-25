// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:toku/Components/item.dart';
import 'package:toku/models/number.dart';

class FamilyPage extends StatelessWidget {
  const FamilyPage({Key? key}) : super(key: key);
  final List<Model> numbers = const [
    Model(
        image: 'assets/images/family_members/family_father.png',
        jpName: 'Chichioya',
        enName: 'father',
        sound: 'sounds/family_members/father.wav'),
    Model(
        image: 'assets/images/family_members/family_daughter.png',
        jpName: 'Musume',
        enName: 'daughter',
        sound: 'sounds/family_members/daughter.wav'),
    Model(
        image: 'assets/images/family_members/family_grandfather.png',
        jpName: 'ojisan',
        enName: 'Grand father',
        sound: 'sounds/family_members/grand father.wav'),
    Model(
        image: 'assets/images/family_members/family_mother.png',
        jpName: 'Hahaoya',
        enName: 'mother',
        sound: 'sounds/family_members/mother.wav'),
    Model(
        image: 'assets/images/family_members/family_grandmother.png',
        jpName: 'Sobo',
        enName: 'grand mother',
        sound: 'sounds/family_members/grand mother.wav'),
    Model(
        image: 'assets/images/family_members/family_older_brother.png',
        jpName: 'Nisan',
        enName: 'older brother',
        sound: 'sounds/family_members/older bother.wav'),
    Model(
        image: 'assets/images/family_members/family_older_sister.png',
        jpName: 'Ane',
        enName: 'older sister',
        sound: 'sounds/family_members/older sister.wav'),
    Model(
        image: 'assets/images/family_members/family_son.png',
        jpName: 'Musuko',
        enName: 'son',
        sound: 'sounds/family_members/son.wav'),
    Model(
        image: 'assets/images/family_members/family_younger_sister.png',
        jpName: 'Imōto',
        enName: 'younger sister',
        sound: 'sounds/family_members/younger sister.wav'),
    Model(
        image: 'assets/images/family_members/family_younger_brother.png',
        jpName: 'Otōto',
        enName: 'younger brother',
        sound: 'sounds/family_members/younger brohter.wav'),
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
            color: Colors.green,
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
