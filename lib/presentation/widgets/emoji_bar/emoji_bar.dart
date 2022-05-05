import 'package:emoji_reactions/presentation/widgets/emoji_bar/emoji.dart';
import 'package:flutter/material.dart';

class EmojiBar extends StatelessWidget {
  const EmojiBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Emoji(onSelect: (){}, emoji: '👍🏼'),
          Emoji(onSelect: (){}, emoji: '👎🏼'),
          Emoji(onSelect: (){}, emoji: '🥰'),
          Emoji(onSelect: (){}, emoji: '🤣'),
          Emoji(onSelect: (){}, emoji: '🤔'),
          Emoji(onSelect: (){}, emoji: '🥲'),
        ],
      ),
    );
  }
}
