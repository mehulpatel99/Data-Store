import 'package:flutter/material.dart';
import 'package:myproject/Database_/db_helper.dart';
import 'package:sqflite/sqflite.dart';

class Repository {
  DatabaseConnection? _databaseConnection;
  Database? _database;

  Repository() {
    _databaseConnection = DatabaseConnection();
  }
  Future<Database?> get mydatabase async {
    if (_database != null) {
      return _database;
    } else {
      _database = await _databaseConnection?.setDatabase();
      return _database;
    }
  }

  //insert data
  insertdata(table, data) async {
    var con = await mydatabase;
    return await con!.insert(table, data);
  }

//get data
  getData(table) async {
    var con = await mydatabase;
    return await con!.query(table);
  }

  //updatedata
  updatedata(table, data) async {
    var con = await mydatabase;
    return await con!
        .update(table, data, where: 'id=?', whereArgs: [data['id']]);
  }
}
