import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/domain/hive/hive_box.dart';
import 'package:note_app/domain/model/note_model.dart';
import 'package:note_app/domain/provider/note_provider.dart';
import 'package:note_app/ui/router/app_routes.dart';
import 'package:note_app/ui/theme/app_colors.dart';
import 'package:note_app/ui/theme/app_text_style.dart';
import 'package:provider/provider.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: 'Заметки',
        showBtn: true,
      ),
      floatingActionButton: AddNoteBtn(),
      body: NoteList(),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBtn;

  const CustomAppBar({
    super.key,
    this.title = '',
    this.showBtn = false,
  });

  @override
  Size get preferredSize => const Size(double.infinity, 64);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
      centerTitle: true,
      actions: <Widget>[
        if (showBtn) const AppBarSearchBtn(),
      ],
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 22,
          color: AppColors.primaryTextColor,
        ),
      ),
    );
  }
}

class NoteList extends StatelessWidget {
  const NoteList({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: HiveBox.notes.listenable(),
      builder: (context, notes, _) {
        final List<NoteModel> allNotes = notes.values.toList();
        return AnimationLimiter(
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, index) =>
                AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 800),
              child: ScaleAnimation(
                child: FadeInAnimation(
                  child: NoteListItem(
                    title: allNotes[index].title,
                    note: allNotes[index].descr,
                    date: allNotes[index].date,
                    index: index,
                  ),
                ),
              ),
            ),
            separatorBuilder: (context, index) => const SizedBox(
              height: 16,
            ),
            itemCount: allNotes.length,
          ),
        );
      },
    );
  }
}

class NoteListItem extends StatelessWidget {
  final String title;
  final String note;
  final String date;
  final int index;

  const NoteListItem({
    super.key,
    this.date = '',
    this.title = '',
    this.note = '',
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<NoteProvider>(context);
    return ZoomTapAnimation(
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          builder: (context) => Container(
            height: 180,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 10,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: const NoteLIstItemMenuContent(),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        constraints: const BoxConstraints(
          minHeight: 117,
        ),
        decoration: const BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(16)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, .25),
              blurRadius: 2,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: NoteListItemContent(
          title: title,
          note: note,
          date: date,
        ),
      ),
    );
  }
}

class NoteLIstItemMenuContent extends StatelessWidget {
  const NoteLIstItemMenuContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [],
    );
  }
}

class NoteListItemContent extends StatelessWidget {
  final String title;
  final String note;
  final String date;

  const NoteListItemContent({
    super.key,
    this.date = '',
    this.note = '',
    this.title = '',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: AppTextStyle.noteTitle,
        ),
        const SizedBox(height: 5),
        Text(
          date,
          style: AppTextStyle.noteDate,
        ),
        const SizedBox(height: 9),
        Text(
          note,
          style: AppTextStyle.noteDescr,
        ),
      ],
    );
  }
}

//

class AppBarSearchBtn extends StatelessWidget {
  const AppBarSearchBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pushNamed(AppRoutes.search);
      },
      icon: const Icon(Icons.search),
    );
  }
}

class AddNoteBtn extends StatelessWidget {
  const AddNoteBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).pushNamed(AppRoutes.addNote);
      },
      backgroundColor: AppColors.primaryColor,
      elevation: 4,
      child: const Icon(
        Icons.edit,
        color: Color.fromRGBO(103, 80, 164, 1),
      ),
    );
  }
}
