import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBAdmin {
  initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String pathdatabase = join(directory.path, "PagosDB.db");
    openDatabase(
      pathdatabase,
      version: 1,
      onCreate: (Database db, int version) {
        db.execute("""CREATE TABLE GASTOS(
      ID INTEGER PRIMARY KEY AUTOINCREMENT,
      title TEXT,
      price  REAL,
      datetime TEXT,
      type TEXT
      )""");
      },
    );
  }
}
