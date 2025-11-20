import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timos_customer_2025/screen/booking_ticket/booking/bloc/booking_event.dart';
import 'package:timos_customer_2025/screen/booking_ticket/booking/bloc/booking_state.dart';
import 'package:timos_customer_2025/screen/booking_ticket/booking/model/province_model.dart';
import 'package:timos_customer_2025/screen/booking_ticket/ticket_price/service/ticket_repository.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {

  final locationService = TicketRepository();
  BookingBloc() : super(BookingState(departureDate: DateTime.now(), returnDate: DateTime.now()) ) {

  }


  // List<ProvinceModel> searchProvinces(String keyword) {
  //   if (keyword.isEmpty) return state.provinceMap.values.toList();
  //   final query = removeDiacritics(keyword.toLowerCase().trim());
  //   return state.listProvince.where((province) {
  //     final name = removeDiacritics(province.tenThanhPho.toLowerCase());
  //     return name.contains(query);
  //   }).toList();
  // }



}