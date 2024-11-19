import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes/model/note_model.dart';
import 'package:notes/views/edit_note_view.dart';

class NoteItemCard extends StatelessWidget {
  const NoteItemCard({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return EditNoteView(
              note: note,
            );
          },
        ));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.fromLTRB(16, 24, 0, 16),
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                note.title,
                style: const TextStyle(fontSize: 26, color: Colors.white),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  note.subTitle,
                  style: TextStyle(
                      fontSize: 18, color: Colors.white.withOpacity(0.5)),
                ),
              ),
              trailing: IconButton(
                  onPressed: () {
                    note.delete();
                    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.white,
                    size: 25,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: Text(
                note.date,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white.withOpacity(0.5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
