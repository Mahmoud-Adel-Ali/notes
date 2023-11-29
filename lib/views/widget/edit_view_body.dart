import 'package:flutter/material.dart';
import 'package:notes/views/widget/custom_appbar.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      color:const Color.fromARGB(255, 41, 41, 41),
      child: const Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: [
            SizedBox(height: 25),
            CustomAppBar(title: 'Edit', icon: Icons.check,),
          ],
        ),
      ),
    );
  }
}