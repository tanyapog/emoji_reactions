import 'package:emoji_reactions/model/twit.dart';
import 'package:emoji_reactions/presentation/widgets/emoji_bar/emoji_button.dart';
import 'package:flutter/material.dart';

class EmojiBar extends StatelessWidget {
  final Twit twit;
  final List<String> emojis;

  const EmojiBar({Key? key, required this.twit, required this.emojis}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 50,
      child: Padding(
        padding: const EdgeInsets.all(1,),
        child: ListView.builder(
          itemCount: emojis.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, i) =>
            EmojiButton(twit: twit, emoji: emojis[i]),
        ),
      )
    );
  }
}
