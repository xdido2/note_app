import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

part 'note_model.g.dart';

@HiveType(typeId: 1)
final class NoteModel {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String descr;
  @HiveField(2)
  late String date;

  NoteModel({required this.title, required this.descr}) {
    final DateTime nowTime = DateTime.now();
    date = DateFormat('dd.MM.yyyy').format(nowTime);
  }
}
