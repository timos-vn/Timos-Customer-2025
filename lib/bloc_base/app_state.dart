// app_state.dart
import 'package:equatable/equatable.dart';
import 'package:timos_customer_2025/models/response/auth/auth_response.dart';
import 'package:timos_customer_2025/models/response/app/tong_diem_response.dart';

class AppState extends Equatable {

  final int? tongDiem;
  final TongDiemResponse? tongDiemResponse;

  final UserAccount? userLoginModel;

  const AppState({this.userLoginModel, this.tongDiem, this.tongDiemResponse});

  AppState copyWith({
    int? tongDiem,
    UserAccount? userLoginModel,
    TongDiemResponse? tongDiemResponse,
  }) {
    return AppState(
      userLoginModel: userLoginModel ?? this.userLoginModel,
      tongDiem: tongDiem ?? this.tongDiem,
      tongDiemResponse: tongDiemResponse ?? this.tongDiemResponse,
    );
  }

  @override
  List<Object?> get props => [ userLoginModel, tongDiem, tongDiemResponse ];
}
