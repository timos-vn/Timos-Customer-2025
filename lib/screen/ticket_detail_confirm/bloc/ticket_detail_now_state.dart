
import 'package:timos_customer_2025/screen/booking_ticket/booking/model/ticket_detail_model.dart';

class TicketDetailState {

  final TicketDetailModel ticketDetailModel;
  final String? errorMessage;
  final bool isLoading;

  final bool? isBookingSuccess;

  TicketDetailState({
    this.errorMessage,
    this.isLoading = false,
    required this.ticketDetailModel,
    this.isBookingSuccess,
  });

  TicketDetailState copyWith({
    String? errorMessage,
    bool? isLoading,
    bool? isSuccess,
    TicketDetailModel? ticketDetailModel,
    bool? isBookingSuccess,
  }) {
    return TicketDetailState(
      ticketDetailModel: ticketDetailModel ?? this.ticketDetailModel,
      errorMessage: errorMessage ?? this.errorMessage,
      isLoading: isLoading ?? this.isLoading,
      isBookingSuccess: isBookingSuccess ?? this.isBookingSuccess,
    );
  }
}