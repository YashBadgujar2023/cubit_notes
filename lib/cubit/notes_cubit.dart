import 'package:cubit_notes/cubit/notes_state.dart';
import 'package:cubit_notes/database/dbhelper.dart';
import 'package:cubit_notes/model/notemodel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class notescubit extends Cubit<notesstate> {
  dbhelper Dbhelper;

  notescubit({required this.Dbhelper}) :super(notesinitial());

  addnotes(Notesmodel notesmodel) async {
    emit(notesloading());
    bool check = await Dbhelper.toadd(notesmodel);
    if (check) {
      var notes = await Dbhelper.tofetch();
      emit(notesloaded(arrnotes: notes));
    }
    else {
      emit(Error(msg: "Data can't be add to the app"));
    }
  }

  void fetch() async {
    emit(notesloading());
    var notes = await Dbhelper.tofetch();
    emit(notesloaded(arrnotes: notes));
  }


  Future<void> update(int id, String title, String description) async {
    emit(notesloading());
    var check = await Dbhelper.toupdate(Notesmodel(id: id, title: title, description: description));
    if (check) {
      var notes = await Dbhelper.tofetch();
      emit(notesloaded(arrnotes: notes));
    }
    else {
      emit(Error(msg: "Data Not Not Update"));
    }
  }


  Future<void> delete(int id) async {
    emit(notesloading());
    var check = await Dbhelper.todelete(id);
    if (check) {
      emit(notesloaded(arrnotes: await Dbhelper.tofetch()));
    }
    else {
      emit(Error(msg: "Data not delete"));
    }
  }
}