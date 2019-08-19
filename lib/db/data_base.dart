import 'dart:async';
import 'dart:io';
import 'package:path/path.dart' as pathUtil;

import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:sqflite/sqflite.dart' as sqflite;

/**
 * seguindo: https://medium.com/flutter-community/using-sqlite-in-flutter-187c1a82e8b
 * ^^(https://github.com/Rahiche/sqlite_demo/blob/master/lib/Database.dart)
 * https://flutter.dev/docs/cookbook/persistence/sqlite#5-insert-a-dog-into-the-database
 * 
 */

class DataBase {
  DataBase._(); // construtor privado
  static final DataBase db = DataBase._(); // instancia singleton

  static sqflite.Database _database;

  Future<sqflite.Database> get database async {
    if (_database == null) {
      _database = await initDB();
    }
    return _database;
  }

  initDB() async {
    Directory documentsDirectory =
        await pathProvider.getApplicationDocumentsDirectory();
    String path = pathUtil.join(documentsDirectory.path, "livraria.db");

    return await sqflite.openDatabase(
      path,
      version: 1,
      onOpen: (bd) {},
      onCreate: (sqflite.Database db, int version) async {
        await db.execute(" CREATE TABLE livro ("
            "id INTEGER PRIMARY KEY,"
            "titulo TEXT,"
            "autor TEXT,"
            "preco REAL,"
            "ehNacional BIT,"
            "disponibilidade TEXT"
            ")");
      },
    );
  }
}
