import 'package:hive/hive.dart';
import 'package:note_app/domain/hive/hive_keys.dart';
import 'package:note_app/domain/model/note_model.dart';

abstract final class HiveBox {
  static final Box<NoteModel> notes = Hive.box<NoteModel>(HiveKeys.notes);
}
