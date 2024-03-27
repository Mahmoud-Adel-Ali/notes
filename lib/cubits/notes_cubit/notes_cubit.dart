import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes/constant.dart';
import 'package:notes/cubits/notes_cubit/notes_state.dart';
import 'package:notes/model/note_model.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  fetchAllNotes() {
    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      List<NoteModel> notes = notesBox.values.toList();
      emit(NotesSuccess(notes));
    } catch (e) {
      emit(NotesFailure(e.toString()));
    }
  }
}
