// ignore_for_file: file_names, non_constant_identifier_names
// ignore: duplicate_ignore
// ignore: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:toku/Components/itemsinfo.dart';
//import 'package:flutter/widgets.dart';
import 'package:toku/models/number.dart';

// ignore: must_be_immutable
class Item extends StatelessWidget {
  const Item({Key? key, required this.number, required this.color})
      : super(key: key);
  final Model number;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      height: 95.42,
      child: Row(
        children: [
          Container(
            color: const Color(0xffFFF6DC),
            child: Image.asset(number.image),
          ),
          Expanded(child: Itemsinfo(number: number, color: color)),
        ],
      ),
    );
  }
}
