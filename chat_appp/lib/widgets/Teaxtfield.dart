// ignore_for_file: camel_case_types, file_names, must_be_immutable, body_might_complete_normally_nullable

import 'package:flutter/material.dart';

class custom_textfield extends StatelessWidget {
  custom_textfield(
      {super.key, required this.textf, this.onchange, this.obscure = false});

  final String textf;
  Function(String)? onchange;
  bool obscure;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscure,
      validator: (data) {
        if (data!.isEmpty) {
          return 'No information';
        }
      },
      onChanged: onchange,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        border: const OutlineInputBorder(),
        hintText: textf,
        hintStyle: const TextStyle(
          color: Colors.white,
        ),
        contentPadding: const EdgeInsets.only(left: 10),
      ),
      style: const TextStyle(
        color: Colors.white,
        fontSize: 19,
      ),
    );
  }
}
