import 'package:app_ventas/core/core.dart';
import 'package:app_ventas/features/auth/data/models/models.dart';
import 'package:app_ventas/features/auth/domain/entities/entities.dart';
import 'package:app_ventas/features/bottomNavigation/presentation/blocs/blocs.dart';
import 'package:app_ventas/features/notifications/notifications.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:app_ventas/features/auth/domain/usecases/usecases.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final BottomNavigationBarCubit bottomNavigationBarCubit;
  final LoginUseCase loginUseCase;
  final LogoutUseCase logoutUseCase;
  final GetLocalBearerToken getLocalBearerToken;
  final GetUserData getUserData;
  final UpdateBearerTokenServiceLocator updateBearerTokenServiceLocator;
  final NotificationsBloc notificationsBloc;
  final UpdateUserFirebasePushMessaging updateUserFirebasePushMessaging;

  AuthBloc(
      {required this.loginUseCase,
      required this.getLocalBearerToken,
      required this.getUserData,
      required this.updateBearerTokenServiceLocator,
      required this.logoutUseCase,
      required this.bottomNavigationBarCubit,
      required this.notificationsBloc,
      required this.updateUserFirebasePushMessaging})
      : super(AuthState()) {
    on<LoginEvent>(_loginEvent);
    on<SetAuthStatusEvent>(_setAuthStatus);
    checkAuthStatus();
  }

  Future<void> _loginEvent(LoginEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: AuthStatus.loading));
    try {
      final result = await loginUseCase(event.email, event.password);
      if (result) {
        await checkAuthStatus();
        emit(state.copyWith(status: AuthStatus.authenticated));
      } else {
        emit(state.copyWith(status: AuthStatus.unauthenticated));
      }
    } catch (e) {
      if (e is AppNetworkException) {
        emit(state.copyWith(status: AuthStatus.error, errorMessage: e.message));
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
        add(SetAuthStatusEvent(state.copyWith(
            status: AuthStatus.authenticated,
            user: userData.user as UserModel)));

        // Actualizar el token de notificaciones
        await checkAndUpDateUserFirebasePushMessaging(userData.user.id);
      } else {
        add(SetAuthStatusEvent(
            state.copyWith(status: AuthStatus.unauthenticated)));
      }
    } else {
      add(SetAuthStatusEvent(
          state.copyWith(status: AuthStatus.unauthenticated)));
    }
  }

  Future<void> checkAndUpDateUserFirebasePushMessaging(String userId) async {
    final notificationToken = notificationsBloc.state.pmfToken;
    if (notificationToken != null && notificationToken.isNotEmpty) {
      await updateUserFirebasePushMessaging(userId, notificationToken);
    }
  }

  Future<void> logOut() async {
    bottomNavigationBarCubit.changePageIndexValue(0);
    final bool isLogout = await logoutUseCase();

    if (isLogout) {
      state.reset();
      add(SetAuthStatusEvent(state.copyWith(
          status: AuthStatus.unauthenticated, user: state.reset().user)));
    }
  }
}
