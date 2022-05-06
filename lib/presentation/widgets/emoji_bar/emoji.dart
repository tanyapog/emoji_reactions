import 'package:emoji_reactions/infrastructure/twit_dao.dart';
import 'package:flutter/material.dart';

class Emoji extends StatelessWidget {
  final int twitId;
  final String emoji;

  const Emoji({Key? key, required this.twitId, required this.emoji}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        await TwitDao().updateReaction(twitId, emoji);
        Navigator.of(context).pop();
      },
      child: Text(emoji,
        style: const TextStyle(fontSize: 28),
      )
    );
  }
}
