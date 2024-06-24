import 'package:flutter/material.dart';
import 'package:isar_crud_app/models/note_database.dart';
import 'package:isar_crud_app/pages/note_page.dart';
import 'package:isar_crud_app/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  // initialize the notes isar databaseY
  WidgetsFlutterBinding.ensureInitialized();
  await NoteDatabase.initialize();

  runApp(MultiProvider(providers: [
    // Note provider
    ChangeNotifierProvider(create: (context) => NoteDatabase()),

    // Theme Provider
    ChangeNotifierProvider(create: (contex) => ThemeProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const NotePage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
