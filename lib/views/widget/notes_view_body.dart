import 'package:flutter/material.dart';
import 'package:notes/views/widget/custom_appbar.dart';
import 'package:notes/views/widget/custom_notes_item_card.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomAppBar(),
        NoteItemCard(),
      ],
    );
  }
}
