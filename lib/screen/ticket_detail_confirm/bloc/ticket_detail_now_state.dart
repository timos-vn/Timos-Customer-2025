
import 'package:timos_customer_2025/screen/booking_ticket/booking/model/ticket_detail_model.dart';
import 'package:timos_customer_2025/screen/booking_ticket/ticket_price/model/book_ticket_response.dart';

class TicketDetailState {

  final TicketDetailModel ticketDetailModel;
  final String? errorMessage;
  final bool isLoading;

  /// 1: Đặt vé thành công
  /// 2: Cập nhật vé thành công
  final int codeScreen;

  BookTicketResponse? bookTicketResponse;

  TicketDetailState({
    this.errorMessage,
    this.isLoading = false,
    required this.ticketDetailModel,
    this.bookTicketResponse,
    this.codeScreen = 0,
  });

  TicketDetailState copyWith({
    String? errorMessage,
    bool? isLoading,
    bool? isSuccess,
    TicketDetailModel? ticketDetailModel,
    BookTicketResponse? bookTicketResponse,
    int? codeScreen,
  }) {
    return TicketDetailState(
      ticketDetailModel: ticketDetailModel ?? this.ticketDetailModel,
      errorMessage: errorMessage ?? this.errorMessage,
      isLoading: isLoading ?? this.isLoading,
      bookTicketResponse: bookTicketResponse ?? this.bookTicketResponse,
      codeScreen: codeScreen ?? this.codeScreen,
    );
  }
}