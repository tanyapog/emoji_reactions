import 'package:emoji_reactions/infrastructure/twit_dao.dart';
import 'package:emoji_reactions/model/twit.dart';
import 'package:flutter/material.dart';

class EmojiButton extends StatelessWidget {
  final Twit twit;
  final String emoji;

  const EmojiButton({Key? key, required this.twit, required this.emoji}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        final newReaction = twit.reaction == emoji ? null : emoji;
        await TwitDao().updateReaction(twit.id, newReaction);
        Navigator.of(context).pop();
      },
      child: Text(emoji,
        style: const TextStyle(fontSize: 28),
      )
    );
  }
}
