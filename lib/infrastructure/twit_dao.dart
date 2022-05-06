import 'package:emoji_reactions/infrastructure/database_helper.dart';
import 'package:emoji_reactions/model/twit.dart';
import 'package:sqflite/sqflite.dart';

class TwitDao {
  
  late Database db;
  final tt = DatabaseHelper.twitTable;

  // singleton
  static final TwitDao _instance = TwitDao._internal();
  TwitDao._internal();
  factory TwitDao() => _instance;

  Future<TwitDao> init() async {
    db = await DatabaseHelper().db;
    return TwitDao();
  }

  Future<List<Twit>> selectAll() async =>
    await db.query('$tt').then((twitsData) =>
      twitsData.map((twitData) =>
        Twit.fromMap(twitData)).toList());

  Future<int> updateReaction(int twitId, String? reaction) async =>
    await db.rawUpdate('UPDATE $tt SET ${tt.reaction} = ? WHERE ${tt.id} = ?',
        [reaction, twitId]);

  Future<int> selectReactionsCount(String reaction) async => Sqflite.firstIntValue(
      await db.rawQuery('SELECT COUNT(id) FROM $tt WHERE ${tt.reaction} = ?',
          [reaction])) ?? 0;

}