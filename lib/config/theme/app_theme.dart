import 'package:flutter/material.dart';

// const seedColor = Color.fromARGB(255, 7, 80, 59);

class AppTheme {
  final bool isDarkmode;

  AppTheme({required this.isDarkmode});

  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        brightness: isDarkmode ? Brightness.dark : Brightness.light,
        cardTheme: CardTheme(
          color: isDarkmode ? Colors.black : Colors.white,
        ),
        bottomAppBarTheme: BottomAppBarTheme(
          color: isDarkmode ? Colors.black : Colors.white,
        ),
      );
}
