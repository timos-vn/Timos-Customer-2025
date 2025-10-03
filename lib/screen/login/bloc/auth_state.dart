import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:timos_customer_2025/screen/utils/base_bloc.dart';
import 'package:timos_customer_2025/models/response/auth/auth_response.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState extends BaseState with _$AuthState {
  const factory AuthState.initial() = AuthStateInitial;
  
  const factory AuthState.loading() = AuthStateLoading;
  
  const factory AuthState.authenticated({
    required UserAccount user,
    required String accessToken,
  }) = AuthStateAuthenticated;
  
  const factory AuthState.unauthenticated() = AuthStateUnauthenticated;
  
  const factory AuthState.error({
    required String message,
  }) = AuthStateError;
}