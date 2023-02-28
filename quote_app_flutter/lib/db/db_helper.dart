import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper instance = DBHelper._instance();
  static Database? db;

  DBHelper._instance();

  Future<Database> get database async {
    if (db == null) {
      db = await _initDatabase();
    }
    return db!;
  }

  Future<Database> _initDatabase() async {
    final String dbPath = await getDatabasesPath();
    final String path = join(dbPath, 'quote_app.db');
    return await openDatabase(path, version: 1, onCreate: dbOnCreate);
  }

  Future<void> dbOnCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE quotes(id INTEGER PRIMARY KEY, text TEXT, author TEXT)',
    );
  }
}
