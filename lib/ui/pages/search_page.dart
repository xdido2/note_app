import 'package:flutter/material.dart';
import 'package:note_app/ui/pages/home_page.dart';
import 'package:note_app/ui/theme/app_colors.dart';
import 'package:note_app/ui/theme/app_text_style.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 64,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: AppColors.primaryColor,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, .25),
                spreadRadius: 2,
                blurRadius: 2,
              ),
            ],
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.close),
          ),
        ],
        title: TextField(
          cursorColor: AppColors.primaryTextColor,
          style: AppTextStyle.noteTitle.copyWith(
            fontSize: 22,
            fontWeight: FontWeight.normal,
          ),
          decoration: InputDecoration(
            hintText: 'Поиск...',
            hintStyle: AppTextStyle.noteTitle.copyWith(
              fontSize: 22,
              fontWeight: FontWeight.normal,
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
      body: const NoteList(),
    );
  }
}
