import 'package:app_ventas/blocs_provider.dart';
import 'package:app_ventas/config/config.dart';
import 'package:app_ventas/features/notifications/notifications.dart';
import 'package:app_ventas/service_locator.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/date_symbol_data_local.dart';

late SharedPreferences sharedPref;

void main() async {
  await Environment.initEnvironment();
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  await NotificationsBloc.initializeFCM();

  // Inicializa la configuración de localización
  await initializeDateFormatting('es_ES', null);
  sharedPref = await SharedPreferences.getInstance();
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
      title: 'App Commerce',
      routerConfig: appRouter,
    );
  }
}
