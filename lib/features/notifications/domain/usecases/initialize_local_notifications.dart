import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class InitializeLocalNotifications {
  static Future<void> init() async {
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    const initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');

    // TODO: IOS CONFIGURATION

    const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      // TODO: IOS CONFIGURATION
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      // onDidReceiveBackgroundNotificationResponse: onDidReceiveBackgroundNotificationResponse
    );
  }

  static void showLocalNotification({
    required int id,
    String? title,
    String? body,
    String? data,
  }) {
    const androidDetails = AndroidNotificationDetails(
      'channelId',
      'channelName',
      playSound: true,
      sound: RawResourceAndroidNotificationSound('notification'),
      importance: Importance.max,
      priority: Priority.high,
    );

    const notificationDetails = NotificationDetails(
      android: androidDetails,

      //TODO: ios
    );

    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      notificationDetails,
      payload: data,
    );
  }
}
