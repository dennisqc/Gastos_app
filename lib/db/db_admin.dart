import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBAdmin {
  Database? myDatabase;

  Future<Database?> checkDatabase() async {
    if (myDatabase == null) {
      myDatabase = await initDatabase();
    }
    return myDatabase;
    //myDatabase ??= await initDatabase();
  }

  Future<Database> initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String pathdatabase = join(directory.path, "PagosDB.db");
    return await openDatabase(
      pathdatabase,
      version: 1,
      onCreate: (Database db, int version) {
        db.execute("""
          CREATE TABLE GASTOS(
            ID INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            price REAL,
            datetime TEXT,
            type TEXT
          )""");
      },
    );
  }

  insrtarGasto() async {
    Database? db = await checkDatabase();
    int res = await db!.insert("GASTOS", {
      "title": "Compras del mercado",
      "price": 1200.50,
      "datetime": "12/12/2024",
      "type": "Alimentos"
    });
    print(res);
  }

  obetenerGastos() async {
    Database? db = await checkDatabase();
    print("------------");
    // print(db);
    print("------------");
    List data = await db!.query("GASTOS");
    print(data);
  }
}
