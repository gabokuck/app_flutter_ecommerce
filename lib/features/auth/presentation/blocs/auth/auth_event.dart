part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  LoginEvent(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}

class CheckAuthStatusEvent extends AuthEvent {
  final AuthState state;

  CheckAuthStatusEvent(this.state);

  @override
  List<Object?> get props => [state];
}
