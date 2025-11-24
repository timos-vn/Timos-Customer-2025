
import 'package:timos_customer_2025/screen/booking_ticket/ticket_price/model/seating_model.dart';

class SeatState {

  bool isLoading;
  List<DanhSachGheDaDat> listSeating;

  SeatState({this.isLoading = false, this.listSeating = const []});

  SeatState copyWith({List<DanhSachGheDaDat>? listSeating, bool ? isLoading}) {
    return SeatState(
      listSeating: listSeating ?? this.listSeating,
      isLoading: isLoading ?? this.isLoading
    );
  }
}
