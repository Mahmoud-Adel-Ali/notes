import 'package:hive/hive.dart';
// to create this page content run (flutter packages pub run build_runner build)
// in terminal after write ( part 'note_model.g.dart';) in this page
part 'note_model.g.dart';

//
@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String subTitle;
  @HiveField(2)
  final String date;
  @HiveField(3)
  int color;

  NoteModel(
      {required this.title,
      required this.subTitle,
      required this.date,
      required this.color});
}
