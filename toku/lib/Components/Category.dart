// ignore: file_names
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Catagory extends StatelessWidget {
  Catagory({Key? key, this.text, this.color, this.ontap}) : super(key: key);
  String? text;
  Color? color;
  Function()? ontap; // to make Navigation
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap, // to make Navigation
      child: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 12),
        color: color,
        height: 70,
        width: double.infinity, // take all free space of his parent
        child: Text(
          text!,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 32,
          ),
        ),
      ),
    );
  }
}
