import 'package:notes/model/note_model.dart';

abstract class NotesState {}

class NotesInitial extends NotesState {}

// class NotesLoading extends NotesState {}

class NotesSuccess extends NotesState {
  final List<NoteModel> notes;

  NotesSuccess(this.notes);
}