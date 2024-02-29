


import 'package:cubit_notes/database/dbhelper.dart';

class Notesmodel{
  int? id;
  String title;
  String description;
  int? bookmark;

  Notesmodel({this.id,required this.title,required this.description,this.bookmark});

  factory Notesmodel.fromMap(Map<String,dynamic> map){
    return Notesmodel(
        id: map[dbhelper.columnid],
        title:map[dbhelper.columntitle],
        description: map[dbhelper.columndescription],
      bookmark: map[dbhelper.columnbookmark]
    );
  }

  Map<String,dynamic> toMap(){
    return {
      dbhelper.columnid:id,
      dbhelper.columntitle:title,
      dbhelper.columndescription:description,
      dbhelper.columnbookmark:bookmark,
    };
  }
}