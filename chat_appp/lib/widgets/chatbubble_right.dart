// ignore_for_file: camel_case_types, must_be_immutable

import 'package:chat_app/model/messagemodel.dart';
import 'package:flutter/material.dart';

class chatbubble_right extends StatelessWidget {
  const chatbubble_right({super.key, required this.mess});

  final Messagemodel mess;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.all(14),
        margin: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.green[900],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomLeft: Radius.circular(32),
          ),
        ),
        child: Text(
          mess.text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
