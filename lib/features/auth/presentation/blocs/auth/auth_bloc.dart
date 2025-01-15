import 'package:app_ventas/core/core.dart';
import 'package:app_ventas/features/auth/data/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:app_ventas/features/auth/domain/usecases/usecases.dart';
import 'package:get_it/get_it.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final GetLocalBearerToken getLocalBearerToken;
  final GetUserData getUserData;

  AuthBloc(this.loginUseCase, this.getLocalBearerToken, this.getUserData)
      : super(AuthInitial()) {
    on<LoginEvent>(_loginEvent);
    on<CheckAuthStatusEvent>(_checkAuthStatus);
    checkAuthStatus();
  }

  Future<void> _loginEvent(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final result = await loginUseCase(event.email, event.password);
      if (result) {
        emit(AuthAuthenticated());
      }
    } catch (e) {
      if (e is AppNetworkException) {
        emit(AuthError(e.message));
      }
    }
  }

  Future<void> _checkAuthStatus(
      CheckAuthStatusEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final bearerToken = await getLocalBearerToken() ?? '';
    final userData = await getUserData(bearerToken);
    if (userData != null) {
      emit(AuthAuthenticated(
          user: userData.user as UserModel, token: bearerToken));
    } else {
      emit(AuthInitial());
    }
  }

  Future<void> checkAuthStatus() async {
    final bearerToken = await getLocalBearerToken() ?? '';
    updateToken(bearerToken);
    final userData = await getUserData(bearerToken);

    if (userData != null) {
      add(CheckAuthStatusEvent(AuthAuthenticated()));
    } else {
      add(CheckAuthStatusEvent(AuthInitial()));
    }
  }
}

void updateToken(String newToken) {
  final sl = GetIt.instance;

  if (sl.isRegistered<String>(instanceName: 'BearerToken')) {
    // Reemplaza el token existente con el nuevo valor
    sl.unregister<String>(instanceName: 'BearerToken');
    sl.registerLazySingleton<String>(() => newToken,
        instanceName: 'BearerToken');
  } else {
    // Registra el token si aún no existe
    sl.registerLazySingleton<String>(
      () => newToken,
      instanceName: 'BearerToken',
    );
  }
}
