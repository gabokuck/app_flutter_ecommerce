import 'package:app_ventas/core/core.dart';
import 'package:app_ventas/features/auth/data/models/models.dart';
import 'package:app_ventas/features/auth/domain/usecases/logout_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:app_ventas/features/auth/domain/usecases/usecases.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final LogoutUsecase logoutUsecase;
  final GetLocalBearerToken getLocalBearerToken;
  final GetUserData getUserData;
  final UpdateBearerTokenServiceLocator updateBearerTokenServiceLocator;

  AuthBloc(this.loginUseCase, this.getLocalBearerToken, this.getUserData,
      this.updateBearerTokenServiceLocator, this.logoutUsecase)
      : super(AuthInitial()) {
    on<LoginEvent>(_loginEvent);
    on<SetAuthStatusEvent>(_setAuthStatus);
    checkAuthStatus();
  }

  Future<void> _loginEvent(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final result = await loginUseCase(event.email, event.password);
      if (result) {
        await checkAuthStatus();
        emit(AuthAuthenticated());
      }
    } catch (e) {
      if (e is AppNetworkException) {
        emit(AuthError(e.message));
      }
    }
  }

  void _setAuthStatus(SetAuthStatusEvent event, Emitter<AuthState> emit) {
    emit(event.state);
  }

  Future<void> checkAuthStatus() async {
    final bearerToken = await getLocalBearerToken() ?? '';
    if (bearerToken.isNotEmpty) {
      updateBearerTokenServiceLocator(bearerToken);
      final userData = await getUserData();
      if (userData != null) {
        add(SetAuthStatusEvent(AuthAuthenticated(
            token: bearerToken, user: userData.user as UserModel)));
      } else {
        add(SetAuthStatusEvent(AuthInitial()));
      }
    }
  }

  Future<void> logOut() async {
    final bool isLogout = await logoutUsecase();

    if (isLogout) {
      add(SetAuthStatusEvent(AuthInitial()));
    }
  }
}
