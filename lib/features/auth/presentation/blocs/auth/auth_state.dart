part of 'auth_bloc.dart';

enum AuthStatus { initial, loading, authenticated, unauthenticated, error }

class AuthState extends Equatable {
  final AuthStatus status;
  final String? errorMessage;
  final UserModel? user;
  final String? token;

  const AuthState({
    this.status = AuthStatus.initial,
    this.errorMessage,
    this.user,
    this.token,
  });

  AuthState copyWith({
    AuthStatus? status,
    String? errorMessage,
    UserModel? user,
    String? token,
  }) {
    return AuthState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      user: user ?? this.user,
      token: token ?? this.token,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage, user, token];
}

