



import 'package:flutter/material.dart';
import 'package:notes/views/widget/custom_notes_item_card.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return const NoteItemCard();
      },
    );
  }
}
