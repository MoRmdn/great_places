import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBhelper {
  static insert(String table, Map<String, Object> data) async {
    /// geting path of DB on device
    final dbpath = await sql.getDatabasesPath();

    /// i will create DB NAMED 'Places.db' In retrived location
    final createdDBpath = path.join(dbpath, 'Places.db');

    /// i will open DB and store the Tables in
    final sql.Database sqlDB = await sql.openDatabase(
      createdDBpath,
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE userPLaces(id INTEGER PRIMARY KEY,title TEXT,image TEXT,)",
        );
      },
      version: 1,
    );
    await sqlDB.insert(table, data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }
}
