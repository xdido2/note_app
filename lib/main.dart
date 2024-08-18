import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/domain/hive/hive_box.dart';
import 'package:note_app/domain/hive/hive_keys.dart';
import 'package:note_app/domain/model/note_model.dart';
import 'package:note_app/ui/app.dart';

void main(List<String> args) async {
  await Hive.initFlutter();

  Hive.registerAdapter(NoteModelAdapter());

  await Hive.openBox<NoteModel>(HiveKeys.notes);
  print(HiveBox.notes.length);
  runApp(const MyApp());
}
