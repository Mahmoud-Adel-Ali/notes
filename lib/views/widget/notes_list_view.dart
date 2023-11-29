import 'package:flutter/material.dart';
import 'package:notes/views/widget/custom_notes_item_card.dart';
import 'package:notes/views/widget/edit_view_body.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return const EditNoteViewBody();
          },
        ));
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: 5,
          itemBuilder: (context, index) {
            return const NoteItemCard();
          },
        ),
      ),
    );
  }
}
