import 'package:cv_app/edit_page.dart';
import 'package:cv_app/preview_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CV App',
      home: PreViewScreen(title: 'PreView'),
      routes: {
        '/preview': (context) => PreViewScreen(title: 'PreView'),
        '/edit': (context) => EditPage(title: 'PreView'),
      },
    );
  }
}