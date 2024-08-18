import 'package:flutter/material.dart';
import 'package:note_app/ui/pages/add_note_page.dart';
import 'package:note_app/ui/pages/home_page.dart';
import 'package:note_app/ui/pages/search_page.dart';
import 'package:note_app/ui/router/app_routes.dart';

abstract final class AppRouter {
  static String get initialRoute => AppRoutes.home;

  static Map<String, WidgetBuilder> get routes => {
        AppRoutes.home: (context) => const HomePage(),
        AppRoutes.search: (context) => const SearchPage(),
        AppRoutes.addNote: (context) => const AddNotePage()
      };
}
