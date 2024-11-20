import 'package:flutter/material.dart';
import 'package:notes/constant.dart';
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
    widget.note.title = title ?? widget.note.title;
    widget.note.subTitle = content ?? widget.note.subTitle;
    widget.note.color = color ?? widget.note.color;
    widget.note.save();
    Navigator.pop(context);
  }

  String? title, content;
  int currentColorIndex = 0;
  int? color;
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
            onChanged: (text) {
              title = text;
            },
            hint: widget.note.title,
            maxLine: 1),
        const SizedBox(height: 25),
        CustomTextField(
            onChanged: (text) {
              content = text;
            },
            hint: widget.note.subTitle,
            maxLine: 5),
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
                  color = myColors[index];
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
