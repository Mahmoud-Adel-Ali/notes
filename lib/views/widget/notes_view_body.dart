import 'package:flutter/material.dart';
import 'package:notes/views/widget/custom_appbar.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBar(),
        
      ],
    );
  }
}
