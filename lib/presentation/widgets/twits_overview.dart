import 'package:emoji_reactions/model/twit.dart';
import 'package:emoji_reactions/presentation/widgets/emoji_bar/emoji_bar.dart';
import 'package:flutter/material.dart';

class TwitsOverview extends StatelessWidget {
  final List<Twit> twits;
  final Function() notifyParent;

  TwitsOverview({
    Key? key,
    required this.twits,
    required this.notifyParent,
  }) : super(key: key);

  final emojis = ['👍🏼', '👎🏼', '🥰', '🤣', '🤔', '🥲'];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: twits.length,
      itemBuilder: (context, i) => InkWell(
        onTap: () async {
          await showModalBottomSheet(
            context: context,
            builder: (context) => EmojiBar(
              twitId: twits[i].id,
              emojis: emojis,
            ),
          );
          await notifyParent();
        },
        child: Card(
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(twits[i].body),
                if (twits[i].reaction != null)
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(twits[i].reaction!),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
