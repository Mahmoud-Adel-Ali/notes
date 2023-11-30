import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes/constant.dart';
import 'package:notes/views/notesView.dart';

void main() async {
  //  intialize flutter
  await Hive.initFlutter();
  // open box to save data
  await Hive.openBox(kNotesBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Poppins',
      ),
      home: const NotesView(),
    );
  }
}
