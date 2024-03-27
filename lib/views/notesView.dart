
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/constant.dart';
import 'package:notes/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes/views/widget/add_note_buttom_sheet.dart';
import 'package:notes/views/widget/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: Scaffold(
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
                return const AddNoteButtomSheet();
              },
            );
          },
          child: const Icon(
            Icons.add,
            size: 30,
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.all(12.0),
          child: NotesViewBody(),
        ),
      ),
    );
  }
}
