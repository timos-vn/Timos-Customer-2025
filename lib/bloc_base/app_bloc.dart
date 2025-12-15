// app_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:timos_customer_2025/bloc_base/app_event.dart';
import 'package:timos_customer_2025/bloc_base/app_state.dart';
import 'package:timos_customer_2025/bloc_base/service/app_service.dart';


class AppBloc extends Bloc<AppEvent, AppState> {

  final appService = AppService();

  AppBloc() : super(const AppState()) {

    on<UpdateUserLoginEvent>((event, emit) {
      emit(AppState(userLoginModel: event.userAccount));
    });

    on<ClearUserLoginEvent>((event, emit) {
      emit(const AppState(userLoginModel: null));
    });

    on<UpdateTongDiemEvent>(getTongDiem);
  }

  Future<void> getTongDiem(UpdateTongDiemEvent event, Emitter emit) async {
    final result = await appService.getTongDiem(event.idNhaXe);
    emit(
      state.copyWith(
        tongDiem: result?.diemThuong ?? 0,
        tongDiemResponse: result,
      ),
    );
  }

}