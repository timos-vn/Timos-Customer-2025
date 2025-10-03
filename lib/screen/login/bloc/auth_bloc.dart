import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timos_customer_2025/screen/login/bloc/auth_event.dart';
import 'package:timos_customer_2025/screen/login/bloc/auth_state.dart';
import 'package:timos_customer_2025/services/auth_service.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState.initial()) {
    on<CheckAuthStatus>(_onCheckAuthStatus);
    on<LoginRequested>(_onLoginRequested);
    on<LogoutRequested>(_onLogoutRequested);
    on<RefreshTokenRequested>(_onRefreshTokenRequested);
  }

  Future<void> _onCheckAuthStatus(
    CheckAuthStatus event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    
    try {
      if (AuthService.isLoggedIn && AuthService.currentUser != null) {
        emit(AuthState.authenticated(
          user: AuthService.currentUser!,
          accessToken: AuthService.accessToken ?? '',
        ));
      } else {
        emit(const AuthState.unauthenticated());
      }
    } catch (e) {
      emit(AuthState.error(message: e.toString()));
    }
  }

  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    
    try {
      final user = await AuthService.signIn(
        username: event.username,
        password: event.password,
      );
      
      if (user != null && AuthService.accessToken != null) {
        emit(AuthState.authenticated(
          user: user,
          accessToken: AuthService.accessToken!,
        ));
      } else {
        emit(const AuthState.error(message: 'Đăng nhập thất bại'));
      }
    } catch (e) {
      final errorMessage = e.toString().replaceFirst('Exception: ', '');
      emit(AuthState.error(message: errorMessage));
    }
  }

  Future<void> _onLogoutRequested(
    LogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    
    try {
      await AuthService.signOut();
      emit(const AuthState.unauthenticated());
    } catch (e) {
      emit(AuthState.error(message: e.toString()));
    }
  }

  Future<void> _onRefreshTokenRequested(
    RefreshTokenRequested event,
    Emitter<AuthState> emit,
  ) async {
    
    try {
      final refreshSuccess = await AuthService.refreshAccessToken();
      
      if (refreshSuccess && AuthService.currentUser != null) {
        emit(AuthState.authenticated(
          user: AuthService.currentUser!,
          accessToken: AuthService.accessToken ?? '',
        ));
      } else {
        emit(const AuthState.unauthenticated());
      }
    } catch (e) {
      emit(const AuthState.unauthenticated());
    }
  }
}