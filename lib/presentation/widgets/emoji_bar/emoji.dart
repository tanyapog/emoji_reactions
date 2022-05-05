import 'package:flutter/material.dart';

class Emoji extends StatelessWidget {
  final void Function() onSelect;
  final String emoji;

  const Emoji({Key? key, required this.onSelect, required this.emoji}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onSelect,
      child: Text(emoji,
        style: const TextStyle(fontSize: 30),
      )
    );
  }
}
