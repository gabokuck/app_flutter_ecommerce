import 'package:app_ventas/config/theme/app_theme.dart';
import 'package:app_ventas/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isCollapsed = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme(isDarkmode: false).getTheme(),
        title: 'App Ecommerce',
        home: HomePage());
  }
}
