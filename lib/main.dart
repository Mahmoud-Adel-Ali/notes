import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes/constant.dart';
import 'package:notes/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes/model/note_model.dart';
import 'package:notes/simple_bloc_observer.dart';
import 'package:notes/test_notification_feature/services/local_notificaion_service.dart';
import 'package:notes/test_notification_feature/services/work_manager_services.dart';
import 'package:notes/test_notification_feature/views/test_view.dart';

void main() async {
  log("main =========");
  Hive.registerAdapter(NoteModelAdapter());
  Bloc.observer = SimpleBlocObserver();
  //  intialize flutter
  await Hive.initFlutter();
  // open box to save data
  await Hive.openBox<NoteModel>(kNotesBox);
  // initialize local notification service
  await LocalNotificaionService.init();
  // initialize work manager services
  await WorkManagerServices().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Poppins',
        ),
        home: const TestView(),
      ),
    );
  }
}
