import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../models/log.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "log8.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Log ("
          "id INTEGER PRIMARY KEY,"
          "mama TEXT,"
          "data TEXT,"
          "hora TEXT,"
          "time TEXT"
          ")");
    });
  }

  Future<int?>? newLog(Log log) async {
    final db = await database;
    //get the biggest id in the table
    var table = await db?.rawQuery("SELECT MAX(id)+1 as id FROM Log");
    log.id = table?.first["id"] as int?;

    //insert to the table using the new id
    var raw = await db?.rawInsert(
        "INSERT Into Log (id,mama,data,hora,time)"
        "VALUES (?,?,?,?,?)",
        [log.id, log.mama, log.data, log.hora, log.time]);
    return raw;
  }

  Future<int?>? updateLog(Log log) async {
    final db = await database;
    var res = await db
        ?.update("Log", log.toMap(), where: "id = ?", whereArgs: [log.id]);
    return res;
  }

  Future<Log?>? getLog(int id) async {
    final db = await database;
    var res = await db?.query("Log", where: "id = ?", whereArgs: [id]);
    return res!.isNotEmpty ? Log.fromMap(res.first) : null;
  }

  Future<List<Log>> getAllLogs() async {
    final db = await database;
    var res = await db?.query("Log");
    List<Log> list =
        res!.isNotEmpty ? res.map((c) => Log.fromMap(c)).toList() : [];
    //var list_r = list.reversed.toList();
    return list;
  }

  Future<dynamic>? deleteLog(int? id) async {
    final db = await database;
    return db?.delete("Log", where: "id = ?", whereArgs: [id]);
  }

  Future<void> deleteAll() async {
    final db = await database;
    db?.rawDelete("Delete * from Log");
  }
}
