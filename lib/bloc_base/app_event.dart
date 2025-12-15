// app_event.dart
import 'package:equatable/equatable.dart';

import '../models/response/auth/auth_response.dart' show UserAccount;

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object?> get props => [];
}

// class UpdateLoginValue extends AppEvent {
//   final bool isLogin;
//
//   const UpdateLoginValue(this.isLogin);
//
//   @override
//   List<Object?> get props => [isLogin];
// }


class UpdateUserLoginEvent extends AppEvent {
  final UserAccount userAccount;

  const UpdateUserLoginEvent(this.userAccount);

  @override
  List<Object?> get props => [userAccount];
}

class ClearUserLoginEvent extends AppEvent {
  @override
  List<Object?> get props => [];
}

class UpdateTongDiemEvent extends AppEvent {
  final int idNhaXe;

  const UpdateTongDiemEvent(this.idNhaXe);

  @override
  List<Object?> get props => [idNhaXe];
}