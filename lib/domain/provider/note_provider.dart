import 'package:flutter/material.dart';
import 'package:note_app/domain/hive/hive_box.dart';
import 'package:note_app/domain/model/note_model.dart';

final class NoteProvider extends ChangeNotifier {
  List<NoteModel> notes = [];
  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  void addNote(BuildContext context) async {
    await HiveBox.notes.add(
      NoteModel(
        title: titleController.text.isNotEmpty
            ? titleController.text
            : 'Заголовок',
        descr: noteController.text.isNotEmpty ? noteController.text : 'Заметка',
      ),
    );
    Navigator.of(context).pop();
    clearControllerData();

    notifyListeners();
  }

  void deleteNote(int index) async {
    HiveBox.notes.deleteAt(index);
    notifyListeners();
  }

  void clearControllerData() {
    titleController.clear();
    noteController.clear();
  }
}
