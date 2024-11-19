import 'package:flutter/material.dart';
import 'package:notes/constant.dart';
import 'package:notes/views/widget/add_note_bottom_sheet_body.dart';

class AddNoteButtonSheet extends StatelessWidget {
  const AddNoteButtonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: kprimaryColor,
      onPressed: () {
        showModalBottomSheet(
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
    );
  }
}
