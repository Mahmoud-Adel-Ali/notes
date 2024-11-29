import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/constant.dart';
import 'package:notes/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes/model/note_model.dart';
import 'package:notes/views/widget/custom_appbar.dart';
import 'package:notes/views/widget/custom_box_color.dart';
import 'package:notes/views/widget/custom_text_field.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  void onPressed() {
    widget.note.title = title ?? titleController.text;
    widget.note.subTitle = content ?? contentController.text;
    widget.note.color = myColors[currentColorIndex];
    widget.note.save();
    Navigator.pop(context);
    context.read<NotesCubit>().fetchAllNotes();
  }

  String? title, content;
  int currentColorIndex = 0;
  late TextEditingController titleController, contentController;
  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.note.title);
    contentController = TextEditingController(text: widget.note.subTitle);
    for (int i = 0; i < myColors.length; i++) {
      if (widget.note.color == myColors[i]) {
        currentColorIndex = i;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 25),
        CustomAppBar(
          onPressed: onPressed,
          title: 'Edit Note',
          icon: Icons.check,
        ),
        const SizedBox(height: 25),
        CustomTextField(
          controller: titleController,
          hint: widget.note.title,
          maxLine: 1,
          onChanged: (val) {
            title = val;
          },
        ),
        const SizedBox(height: 25),
        CustomTextField(
          controller: contentController,
          hint: widget.note.subTitle,
          maxLine: 5,
          onChanged: (val) {
            content = val;
          },
        ),
        const SizedBox(height: 32),
        SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: myColors.length,
            itemBuilder: (context, index) {
              return CustomBoxColor(
                onTap: () {
                  currentColorIndex = index;
                  setState(() {});
                },
                color: myColors[index],
                isActive: currentColorIndex == index,
              );
            },
          ),
        ),
      ],
    );
  }
}
