import 'package:flutter/material.dart';
import 'package:notes/model/note_model.dart';
import 'package:notes/views/widget/edit_view_body.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding:const EdgeInsets.all(12.0),
        child: EditNoteViewBody(note:note),
      ),
    );
  }
}
