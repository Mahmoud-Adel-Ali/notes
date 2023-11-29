
import 'package:flutter/material.dart';
import 'package:notes/views/widget/custom_appbar.dart';
import 'package:notes/views/widget/custom_text_field.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const  Column(
      children: [
        SizedBox(height:25),
        CustomAppBar(title: 'Edit Note', icon: Icons.check,),
        SizedBox(height: 25),
        CustomTextField(hint: "Title", maxLine: 1),
        SizedBox(height: 25),
        CustomTextField(hint: "Content", maxLine: 5),
        
      ],
    );
    
  }
}
