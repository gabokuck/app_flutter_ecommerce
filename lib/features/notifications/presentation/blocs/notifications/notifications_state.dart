part of 'notifications_bloc.dart';

class NotificationsState extends Equatable {
  final AuthorizationStatus status;
  final String? pmfToken;
  final List<PushMessageModel> notifications;

  const NotificationsState({
    this.status = AuthorizationStatus.notDetermined,
    this.pmfToken,
    this.notifications = const [],
  });

  NotificationsState copyWith({
    AuthorizationStatus? status,
    String? pmfToken,
    List<PushMessageModel>? notifications,
  }) =>
      NotificationsState(
        status: status ?? this.status,
        pmfToken: pmfToken ?? this.pmfToken,
        notifications: notifications ?? this.notifications,
      );

  @override
  List<Object?> get props => [status, pmfToken, notifications];
}
