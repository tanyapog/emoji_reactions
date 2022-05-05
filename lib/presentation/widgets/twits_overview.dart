import 'package:emoji_reactions/model/twit.dart';
import 'package:emoji_reactions/presentation/widgets/emoji_bar/emoji_bar.dart';
import 'package:flutter/material.dart';

class TwitsOverview extends StatelessWidget {
  final List<Twit> twits;
  const TwitsOverview({Key? key, required this.twits}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: twits.length,
      itemBuilder: (context, i) => InkWell(
        onTap: () => showModalBottomSheet(
          context: context,
          builder: (context) => const EmojiBar(),
        ),
        child: Card(
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(twits[i].body),
          ),
        ),
      ),
    );
  }
}
