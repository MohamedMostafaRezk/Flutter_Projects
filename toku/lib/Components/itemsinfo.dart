import 'package:flutter/material.dart';
// ignore_for_file: file_names, non_constant_identifier_names
// ignore: duplicate_ignore
// ignore: non_constant_identifier_names
//import 'package:flutter/widgets.dart';
import 'package:toku/models/number.dart';
import 'package:audioplayers/audioplayers.dart';

class Itemsinfo extends StatelessWidget {
  const Itemsinfo({Key? key, required this.number, required this.color})
      : super(key: key);
  final Model number;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                number.jpName,
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
              Text(
                number.enName,
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
            ],
          ),
        ),
        const Spacer(
          flex: 1,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: IconButton(
            onPressed: () {
              final player = AudioPlayer();
              player.play(AssetSource(number.sound));
            },
            icon: const Icon(
              Icons.play_arrow,
              color: Colors.white,
              size: 28,
            ),
          ),
        ),
      ],
    );
  }
}
