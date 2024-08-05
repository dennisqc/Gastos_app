import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBAdmin {
  Database? myDatabase;

  static final DBAdmin _instance = DBAdmin._();
  DBAdmin._();

  factory DBAdmin() {
    return _instance;
  }

  Future<Database?> _checkDatabase() async {
    if (myDatabase == null) {
      myDatabase = await _initDatabase();
    }
    return myDatabase;
    //myDatabase ??= await initDatabase();
  }

  Future<Database> _initDatabase() async {
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
    Database? db = await _checkDatabase();
    int res = await db!.insert("GASTOS", {
      "title": "Compras del mercado",
      "price": 1200.50,
      "datetime": "12/12/2024",
      "type": "Alimentos"
    });
    print(res);
  }

  obetenerGastos() async {
    Database? db = await _checkDatabase();
    print("------------");
    // print(db);
    print("------------");
    //  List<Map<String, Object?>> data = await db!.query("GASTOS");
    List<Map<String, Object?>> data =
        await db!.rawQuery("Select title from gastos where type='Alimentos'");
    print(data);
  }

  updateGasto() async {
    Database? db = await _checkDatabase();
    int res =
        await db!.update("GASTOS", {"title": "actualizado"}, where: "id=1");
    print(res);
  }

  deleteGasto() async {
    Database? db = await _checkDatabase();
    int res = await db!.delete("GASTOS", where: 'id=1');
    print(res);
  }
}
