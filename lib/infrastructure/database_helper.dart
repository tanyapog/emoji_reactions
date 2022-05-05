import 'package:emoji_reactions/twit_data.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const _dbName = 'EmojiReactions.db';
  static const _dbVersion = 1;
  static const twitTable = _TwitTable();
  static const reactionTable = _ReactionTable();

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
          ${twitTable.body} TEXT NOT NULL
        );
      ''');
      await db.execute('''
        CREATE TABLE $reactionTable (
          ${reactionTable.id} INTEGER PRIMARY KEY,
          ${reactionTable.twitId} INTEGER,
          ${reactionTable.emoji} TEXT NOT NULL
        );
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

  @override
  String toString() => 'TwitTable';
}

class _ReactionTable {
  const _ReactionTable();
  final id = 'id';
  final twitId = 'twitId';
  final emoji = 'emoji';

  @override
  String toString() => 'ReactionTable';
}