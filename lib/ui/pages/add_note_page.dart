import 'package:flutter/material.dart';
import 'package:note_app/domain/provider/note_provider.dart';
import 'package:note_app/ui/pages/home_page.dart';
import 'package:note_app/ui/theme/app_colors.dart';
import 'package:provider/provider.dart';

class AddNotePage extends StatelessWidget {
  const AddNotePage({super.key});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NoteProvider>(context);
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Добавить заметку',
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          AppInput(
            labelText: 'Заголовок',
            controller: model.titleController,
          ),
          const SizedBox(height: 16),
          AppInput(
            labelText: 'Заметка',
            controller: model.noteController,
          ),
          const SizedBox(height: 16),
          ControlBtn(
            btnAction: () => model.addNote(context),
          ),
        ],
      ),
    );
  }
}

class AppInput extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;

  const AppInput({
    super.key,
    this.labelText = '',
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    const OutlineInputBorder border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xff79747E),
      ),
    );

    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(
          fontSize: 16,
          color: AppColors.primaryTextColor,
        ),
        border: border,
        focusedBorder: border,
        enabledBorder: border,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
      ),
    );
  }
}

class ControlBtn extends StatelessWidget {
  final Function btnAction;

  const ControlBtn({
    super.key,
    required this.btnAction,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: FloatingActionButton.extended(
        onPressed: () => btnAction(),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
        ),
        elevation: 2,
        highlightElevation: 4,
        backgroundColor: AppColors.primaryColor,
        label: const Text(
          'Добавить',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(103, 80, 164, 1),
          ),
        ),
      ),
    );
  }
}
