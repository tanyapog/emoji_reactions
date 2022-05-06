import 'package:emoji_reactions/twit_data.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const _dbName = 'EmojiReactions.db';
  static const _dbVersion = 1;
  static const twitTable = _TwitTable();

  // singleton
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  // app-wide reference to the database
  static Database? _db;
  Future<Database> get db async => _db ?? await _initDb();

  Future<Database> _initDb() async => await openDatabase(
    join(await getDatabasesPath(), _dbName),
    version: _dbVersion,
    onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE $twitTable (
          ${twitTable.id} INTEGER PRIMARY KEY,
          ${twitTable.body} TEXT NOT NULL,
          ${twitTable.reaction} TEXT
        )
      ''');
      // insert initial twit data
      for (int i = 0; i < twits.length; i++) {
        await db.insert('$twitTable', {twitTable.body : twits[i]});
      }
    }
  );
}

class _TwitTable {
  const _TwitTable();
  final id = 'id';
  final body = 'body';
  final reaction = 'reaction';

  @override
  String toString() => 'TwitTable';
}