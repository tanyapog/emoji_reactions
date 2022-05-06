import 'package:emoji_reactions/infrastructure/twit_dao.dart';
import 'package:emoji_reactions/model/twit.dart';
import 'package:emoji_reactions/presentation/widgets/emoji_bar/emoji_bar.dart';
import 'package:emoji_reactions/presentation/widgets/reactions_counter.dart';
import 'package:flutter/material.dart';

class TwitsOverview extends StatefulWidget {
  final List<Twit> twits;
  final Function() notifyParent;

  TwitsOverview({
    Key? key,
    required this.twits,
    required this.notifyParent,
  }) : super(key: key);

  final emojis = ['👍🏼', '👎🏼', '🥰', '🤣', '🤔', '🥲'];

  @override
  State<TwitsOverview> createState() => _TwitsOverviewState();
}

class _TwitsOverviewState extends State<TwitsOverview> {
  Map<String, int> reactionsCounter = {};

  @override
  void initState() {
    super.initState();
    for (var emoji in widget.emojis) {
      reactionsCounter[emoji] = 0;
    }
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    await _countReactions();
  }

  Future<void> _countReactions() async {
    for (var emoji in widget.emojis) {
      reactionsCounter[emoji] = await TwitDao().selectReactionsCount(emoji);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ReactionsCounter(reactionsCounter: reactionsCounter),
        Expanded(
          child: ListView.builder(
            itemCount: widget.twits.length,
            shrinkWrap: true,
            itemBuilder: (context, i) {
              final twit = widget.twits[i];
              return InkWell(
                onTap: () async {
                  await showModalBottomSheet(
                    context: context,
                    builder: (context) => EmojiBar(
                        twit: twit,
                        emojis: widget.emojis
                      ),
                  );
                  await _countReactions();
                  widget.notifyParent();
                  setState(() {});
                },
                child: Card(
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(twit.body),
                        if (twit.reaction != null)
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(twit.reaction!),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
