import 'package:flutter/material.dart';
import 'package:note_app/domain/provider/note_provider.dart';
import 'package:note_app/ui/router/app_router.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NoteProvider(),
      child: MaterialApp(
        routes: AppRouter.routes,
        initialRoute: AppRouter.initialRoute,
      ),
    );
  }
}
