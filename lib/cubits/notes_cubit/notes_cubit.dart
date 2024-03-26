import 'package:bloc/bloc.dart';
import 'package:notes/cubits/notes_cubit/notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
}
