import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBhelper {
  /// DataBase Create and retrive
  static Future<sql.Database> dataBase() async {
    final dbpath = await sql.getDatabasesPath();

    /// i will create DB NAMED 'Places.db' In retrived location
    final createdDBpath = path.join(dbpath, 'Places.db');

    /// i will open DB and store the Tables in
    return await sql.openDatabase(
      createdDBpath,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE userPLaces(id INTEGER PRIMARY KEY AUTOINCREMENT,title TEXT,image TEXT)',
        );
      },
      version: 1,
    );
  }

  /// insert data in tables
  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DBhelper.dataBase();

    db.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  ///get data from DataBase
  static Future<List<Map<String, dynamic>>> getDataFromDataBase(
      String table) async {
    final db = await DBhelper.dataBase();

    return db.query(table);
  }
}
