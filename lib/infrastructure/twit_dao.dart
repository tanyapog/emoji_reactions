import 'package:emoji_reactions/infrastructure/database_helper.dart';
import 'package:emoji_reactions/model/twit.dart';
import 'package:sqflite/sqflite.dart';

class TwitDao {
  
  late Database db;
  final twitTable = DatabaseHelper.twitTable;

  // singleton
  static final TwitDao _instance = TwitDao._internal();
  TwitDao._internal();
  factory TwitDao() => _instance;

  Future<TwitDao> init() async {
    db = await DatabaseHelper().db;
    return TwitDao();
  }

  Future<List<Twit>> selectAll() async =>
    await db.query('$twitTable').then((twitsData) =>
      twitsData.map((twitData) =>
        Twit.fromMap(twitData)).toList());
}