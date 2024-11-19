import 'package:flutter/material.dart';
import 'package:notes/constant.dart';
import 'package:notes/views/widget/add_note_bottom_sheet_body.dart';
import 'package:notes/views/widget/custom_box_color.dart';
import 'package:notes/views/widget/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: kprimaryColor,
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            context: context,
            builder: (context) {
              return const AddNoteBottomSheetBody();
            },
          );
        },
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: CustomBoxColor(
          color: myColors[0],
          isActive: true,
        ),
      ),
    );
  }
}
