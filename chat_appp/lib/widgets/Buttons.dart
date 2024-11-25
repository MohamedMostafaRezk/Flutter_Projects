// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  Buttons({super.key, required this.txt, this.onpress});
  String txt;
  VoidCallback? onpress;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onpress,
      style: TextButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 230, 230, 230),
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(12), // Normal radius for rounded corners
        ),
      ),
      child: Text(
        txt,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
      ),
    );
  }
}
