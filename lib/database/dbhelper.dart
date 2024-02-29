

import 'dart:io';

import 'package:cubit_notes/model/notemodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class dbhelper{
  dbhelper._();
  static final dbhelper db = dbhelper._();

  Database? _database;
  var table = "Notes_Database";
  static const columnid = "Notes_id";
  static const columntitle = "Notes_title";
  static const columndescription = "Notes_desdcription";
  static const columnbookmark = "Notes_bookmark";

  Future<Database> getdb()async{
    if(_database != null) {
      return _database!;
    }
    else{
      return await initialdb();
      return _database!;
    }
  }

  Future<Database>initialdb()async{
    Directory directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path + "Notes.db");
    return await openDatabase(path,version: 1,onCreate: (db,version){
      db.execute(
        "create table $table($columnid integer primary key autoincrement,$columntitle text,$columndescription text,$columnbookmark integer)"
      );
    });
  }

  Future<bool>toadd(Notesmodel notesmodel)async{
    var db = await getdb();
    int count = await db.insert(table, notesmodel.toMap());
    return count > 0;
  }

  Future<List<Notesmodel>>tofetch()async{
    var db = await getdb();
    List<Map<String,dynamic>> dbnotes =await db.query(table);
    List<Notesmodel> listnote = [];
    for(Map<String,dynamic> notes in dbnotes)
      {
        Notesmodel model = Notesmodel.fromMap(notes);
        listnote.add(model);
      }
    return listnote;
  }

  toupdate(Notesmodel notesmodel)async{
    var db = await getdb();
    await db.update(table, notesmodel.toMap(),where: "$columnid = ${notesmodel.id}");
  }

  todelete(int id)async{
    var db = await getdb();
    await db.delete(table,where:"$columnid = ?",whereArgs: [id.toString()]);
  }
}