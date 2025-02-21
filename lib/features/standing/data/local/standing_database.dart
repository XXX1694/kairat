import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/player.dart';

class PlayersDatabase {
  static final PlayersDatabase instance = PlayersDatabase._init();
  static Database? _database;

  PlayersDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('players.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE players (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        userName TEXT,
        imageUrl TEXT,
        goals INTEGER,
        assists INTEGER,
        miniGamePoints INTEGER
      )
    ''');
  }

  Future<int> insertPlayer(Player player) async {
    final db = await instance.database;
    return await db.insert('players', player.toMap());
  }

  Future<List<Player>> getTopScorers(int limit) async {
    final db = await instance.database;
    final result = await db.query(
      'players',
      orderBy: 'goals DESC',
      limit: limit,
    );
    return result.map((map) => Player.fromMap(map)).toList();
  }

  Future<List<Player>> getTopAssists(int limit) async {
    final db = await instance.database;
    final result = await db.query(
      'players',
      orderBy: 'assists DESC',
      limit: limit,
    );
    return result.map((map) => Player.fromMap(map)).toList();
  }

  Future<List<Player>> getTopMiniGame(int limit) async {
    final db = await instance.database;
    final result = await db.query(
      'players',
      orderBy: 'miniGamePoints DESC',
      limit: limit,
    );
    return result.map((map) => Player.fromMap(map)).toList();
  }
}
