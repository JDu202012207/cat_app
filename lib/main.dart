import 'package:flutter/material.dart';
import 'features/cats/presentation/pages/show_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ShowPage(),
    );
  }
}
