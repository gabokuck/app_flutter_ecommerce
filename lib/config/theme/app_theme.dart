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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      appBarTheme: AppBarTheme(
        surfaceTintColor: Colors.transparent,
        backgroundColor: isDarkmode ? Colors.grey[900] : Colors.grey[200],
      ),
      scaffoldBackgroundColor: isDarkmode ? Colors.grey[900] : Colors.grey[200],
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: isDarkmode ? Colors.black : Colors.white,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true),
      canvasColor: isDarkmode ? Colors.black : Colors.white);
}
