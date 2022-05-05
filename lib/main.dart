import 'package:emoji_reactions/infrastructure/twit_dao.dart';
import 'package:emoji_reactions/presentation/home_page.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await TwitDao().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emoji Reactions',
      theme: ThemeData(primarySwatch: Colors.blue,),
      home: const HomePage(),
    );
  }
}
