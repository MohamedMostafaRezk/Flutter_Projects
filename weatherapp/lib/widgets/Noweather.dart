// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Noweather extends StatelessWidget {
  const Noweather({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'There is no weather 😒',
            style: TextStyle(
              fontSize: 32,
            ),
          ),
          Text(
            'Start searching now 🔍',
            style: TextStyle(
              fontSize: 32,
            ),
          ),
        ],
      ),
    );
  }
}
