import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes/cubits/notes_cubit/notes_state.dart';
import 'package:notes/model/note_model.dart';
import 'package:notes/views/widget/custom_notes_item_card.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        BlocProvider.of<NotesCubit>(context).fetchAllNotes();
        List<NoteModel> notes =
            BlocProvider.of<NotesCubit>(context).notes ?? [];
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: notes.length,
            itemBuilder: (context, index) {
              return  NoteItemCard(note: notes[index],);
            },
          ),
        );
      },
    );
  }
}
