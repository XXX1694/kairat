import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/news.dart';

class NewsDatabase {
  static final NewsDatabase instance = NewsDatabase._init();
  static Database? _database;

  NewsDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('news.db');
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
      CREATE TABLE news (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        date TEXT,
        imageUrl TEXT,
        description TEXT
      )
    ''');
  }

  Future<int> insertNews(News news) async {
    final db = await instance.database;
    return await db.insert('news', news.toMap());
  }

  Future<List<News>> getAllNews() async {
    final db = await instance.database;
    final result = await db.query('news');
    return result.map((map) => News.fromMap(map)).toList();
  }

  Future<int> deleteAllNews() async {
    final db = await instance.database;
    return await db.delete('news');
  }
}
