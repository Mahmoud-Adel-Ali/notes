

import 'package:flutter/material.dart';
import 'package:notes/views/widget/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: NotesViewBody(),
      ),
      );
  }
}
 
