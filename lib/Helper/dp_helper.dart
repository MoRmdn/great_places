import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart'as path;

class DBhelper{
  static insert (String table ,Map<String,Object> data)async{

    final dbpath=await sql.getDatabasesPath();
    final pathOfDB=path.join(dbpath,'Places.db');
    final sql.Database sqlDB = await sql.openDatabase(pathOfDB,onCreate: (db,version){
      return db.execute('CREATE TABLE userPLaces(id INTEGER PRIMARY KEY,title TEXT,image TEXT)');
    },version: 1,);
    await sqlDB.insert(table, data,conflictAlgorithm: sql.ConflictAlgorithm.replace);

  }
}