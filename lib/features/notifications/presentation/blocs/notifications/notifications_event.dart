part of 'notifications_bloc.dart';

abstract class NotificationsEvent {
  const NotificationsEvent();
}

class NotificationStatusChanged extends NotificationsEvent {
  final AuthorizationStatus status;
  NotificationStatusChanged(this.status);
}

class NotificationReceived extends NotificationsEvent {
  final PushMessageModel pushMessage;
  NotificationReceived(this.pushMessage);
}

class SetFirebaseMessagingTokenEvent extends NotificationsEvent {
  final String? token;
  SetFirebaseMessagingTokenEvent(this.token);
}
