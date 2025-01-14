import 'package:app_ventas/core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:app_ventas/features/auth/domain/usecases/usecases.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;

  AuthBloc(this.loginUseCase) : super(AuthInitial()) {
    on<LoginEvent>(loginEvent);
  }

  Future<void> loginEvent(LoginEvent event, Emitter<AuthState> emit) async {
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
}
