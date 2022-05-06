import 'package:emoji_reactions/infrastructure/twit_dao.dart';
import 'package:emoji_reactions/model/twit.dart';
import 'package:emoji_reactions/presentation/widgets/error_display.dart';
import 'package:emoji_reactions/presentation/widgets/twits_overview.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Twit>> futureTwits;

  @override
  void initState() {
    super.initState();
    futureTwits = TwitDao().selectAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Emoji Reactions'),),
      body: FutureBuilder<List<Twit>>(
        future: futureTwits,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return TwitsOverview(
              twits: snapshot.data!,
              notifyParent: refresh,
            );
          } else if (snapshot.hasError) {
            return ErrorDisplay(
              error: 'Failed to load twits',
              details: '${snapshot.error}'
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }
      ),
    );
  }

  refresh() {
    futureTwits = TwitDao().selectAll();
    setState(() => {});
  }
}