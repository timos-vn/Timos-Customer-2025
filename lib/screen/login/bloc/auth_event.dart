import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:timos_customer_2025/screen/utils/base_bloc.dart';

part 'auth_event.freezed.dart';

@freezed
class AuthEvent extends BaseEvent with _$AuthEvent {
  const factory AuthEvent.loginRequested({
    required String username,
    required String password,
  }) = LoginRequested;
  
  const factory AuthEvent.logoutRequested() = LogoutRequested;
  
  const factory AuthEvent.checkAuthStatus() = CheckAuthStatus;
  
  const factory AuthEvent.refreshTokenRequested() = RefreshTokenRequested;
}