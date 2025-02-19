import 'dart:io';

import 'package:app_ventas/features/notifications/notifications.dart';
import 'package:app_ventas/firebase_options.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';

@pragma('vm:entry-point')
// Función global para manejar notificaciones en segundo plano
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("Mensaje en segundo plano: ${message.notification?.title}");
}

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  final RequestLocalNotificationsPermission requestPermissionLocalNotifications;

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationsBloc(this.requestPermissionLocalNotifications)
      : super(const NotificationsState()) {
    on<NotificationStatusChanged>(_notificationStatusChanged);
    on<NotificationReceived>(_onPushMessageReceived);
    on<SetFirebaseMessagingTokenEvent>(_setFirebaseMessagingToken);

    // Verificar estado de las notificaciones
    _initialStatusCheck();

    // Listener para notificaciones en Foreground
    _onForegroundMessage();
  }

  static Future<void> initializeFCM() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  void _notificationStatusChanged(
      NotificationStatusChanged event, Emitter<NotificationsState> emit) {
    emit(state.copyWith(status: event.status));
    _getFCMToken();
  }

  void _setFirebaseMessagingToken(
      SetFirebaseMessagingTokenEvent event, Emitter<NotificationsState> emit) {
    emit(state.copyWith(pmfToken: event.token));
  }

  void _onPushMessageReceived(
      NotificationReceived event, Emitter<NotificationsState> emit) {
    emit(state
        .copyWith(notifications: [event.pushMessage, ...state.notifications]));
  }

  void _initialStatusCheck() async {
    final settings = await messaging.getNotificationSettings();
    add(NotificationStatusChanged(settings.authorizationStatus));
  }

  void _getFCMToken() async {
    if (state.status != AuthorizationStatus.authorized) return;

    final token = await messaging.getToken();
    print(token);
    add(SetFirebaseMessagingTokenEvent(token));
  }

  void handleRemoteMessage(RemoteMessage message) {
    if (message.notification == null) return;

    final notification = PushMessageModel(
        messageId:
            message.messageId?.replaceAll(':', '').replaceAll('%', '') ?? '',
        title: message.notification!.title ?? '',
        body: message.notification!.body ?? '',
        sentDate: message.sentTime ?? DateTime.now(),
        data: message.data,
        imageUrl: Platform.isAndroid
            ? message.notification!.android?.imageUrl
            : message.notification!.apple?.imageUrl);

    InitializeLocalNotifications.showLocalNotification(
        id: 1,
        title: notification.title,
        body: notification.body,
        data: notification.data.toString());

    add(NotificationReceived(notification));
  }

  void _onForegroundMessage() {
    // Suscribir a topic
    FirebaseMessaging.instance.subscribeToTopic('general');
    FirebaseMessaging.onMessage.listen(handleRemoteMessage);
  }

  void requestPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: true,
      provisional: false,
      sound: true,
    );

    await requestPermissionLocalNotifications;

    add(NotificationStatusChanged(settings.authorizationStatus));
  }

  PushMessageModel? getMessageById(String pushMessageId) {
    final exist = state.notifications
        .any((element) => element.messageId == pushMessageId);
    if (!exist) return null;

    return state.notifications
        .firstWhere((element) => element.messageId == pushMessageId);
  }
}
