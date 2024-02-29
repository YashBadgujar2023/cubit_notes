import 'package:flutter/material.dart';

import '../Screen/GridView.dart';
import '../model/notemodel.dart';

abstract class notesstate{}

class notesinitial extends notesstate{}
class notesloading extends notesstate{}
class notesloaded extends notesstate{
  List<Notesmodel>?arrnotes = [];
  int? id;
  notesloaded({this.id,required this.arrnotes});
}
class Error extends notesstate{
  String msg;
  Error({required this.msg});
}
