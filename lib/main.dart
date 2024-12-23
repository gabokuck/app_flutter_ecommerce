import 'package:app_ventas/blocs_provider.dart';
import 'package:app_ventas/config/router/app_router.dart';
import 'package:app_ventas/config/theme/app_theme.dart';
import 'package:app_ventas/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  serviceLocatorInit();
  runApp(const BlocsProvider(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = context.watch<RouterCubit>().state;
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(isDarkmode: false).getTheme(),
      title: 'App Ecommerce',
      routerConfig: appRouter,
    );
  }
}
