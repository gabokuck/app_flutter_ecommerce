part of 'auth_bloc.dart';

enum AuthStatus { initial, loading, authenticated, unauthenticated, error }

class AuthState extends Equatable {
  final AuthStatus status;
  final String? errorMessage;
  final UserEntity? user;
  final String? token;

  const AuthState({
    this.status = AuthStatus.initial,
    this.errorMessage,
    this.user,
    this.token,
  });

  get isUnauthenticated => status == AuthStatus.unauthenticated;
  get isAuthenticated => status == AuthStatus.authenticated;
  get isLoading => status == AuthStatus.loading;
  get isError => status == AuthStatus.error;
  bool get isAdmin => user?.roles.any((role) => role.id == 'ADMIN') ?? false;
  bool get isMaster => user?.roles.any((role) => role.id == 'MASTER') ?? false;

  AuthState copyWith({
    AuthStatus? status,
    String? errorMessage,
    UserEntity? user,
    String? token,
  }) {
    return AuthState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      user: user ?? this.user,
      token: token ?? this.token,
    );
  }

  AuthState reset() {
    return AuthState(
      status: AuthStatus.initial,
      errorMessage: null,
      user: UserEntity.reset(),
      token: null,
    );
  }

  @override
  List<Object?> get props => [
        status,
        errorMessage,
        user,
        token,
        isAuthenticated,
        isUnauthenticated,
        isLoading,
        isError
      ];
}
