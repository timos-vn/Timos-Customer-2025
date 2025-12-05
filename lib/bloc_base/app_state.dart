// app_state.dart
import 'package:equatable/equatable.dart';
import 'package:timos_customer_2025/models/response/auth/auth_response.dart';

class AppState extends Equatable {

  final int? tongDiem;

  final UserAccount? userLoginModel;

  const AppState({this.userLoginModel, this.tongDiem});

  AppState copyWith({
    int? tongDiem,
    UserAccount? userLoginModel,
  }) {
    return AppState(
      userLoginModel: userLoginModel ?? this.userLoginModel,
      tongDiem: tongDiem ?? this.tongDiem,
    );
  }

  @override
  List<Object?> get props => [ userLoginModel, tongDiem ];
}
