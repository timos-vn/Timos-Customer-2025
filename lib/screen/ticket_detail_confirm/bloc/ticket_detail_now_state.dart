
import 'package:timos_customer_2025/models/response/transfer_station/transfer_station_response.dart';
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

  // Trung chuyển
  final bool isTransferPickupEnabled;
  final bool isTransferDropoffEnabled;
  final TransferStationItem? selectedTransferPickup;
  final TransferStationItem? selectedTransferDropoff;
  final List<TransferStationItem> transferStations;
  final bool isLoadingTransferStations;

  TicketDetailState({
    this.errorMessage,
    this.isLoading = false,
    required this.ticketDetailModel,
    this.bookTicketResponse,
    this.codeScreen = 0,
    this.isTransferPickupEnabled = false,
    this.isTransferDropoffEnabled = false,
    this.selectedTransferPickup,
    this.selectedTransferDropoff,
    this.transferStations = const [],
    this.isLoadingTransferStations = false,
  });

  TicketDetailState copyWith({
    String? errorMessage,
    bool? isLoading,
    bool? isSuccess,
    TicketDetailModel? ticketDetailModel,
    BookTicketResponse? bookTicketResponse,
    int? codeScreen,
    bool? isTransferPickupEnabled,
    bool? isTransferDropoffEnabled,
    TransferStationItem? selectedTransferPickup,
    TransferStationItem? selectedTransferDropoff,
    List<TransferStationItem>? transferStations,
    bool? isLoadingTransferStations,
  }) {
    return TicketDetailState(
      ticketDetailModel: ticketDetailModel ?? this.ticketDetailModel,
      errorMessage: errorMessage ?? this.errorMessage,
      isLoading: isLoading ?? this.isLoading,
      bookTicketResponse: bookTicketResponse ?? this.bookTicketResponse,
      codeScreen: codeScreen ?? this.codeScreen,
      isTransferPickupEnabled: isTransferPickupEnabled ?? this.isTransferPickupEnabled,
      isTransferDropoffEnabled: isTransferDropoffEnabled ?? this.isTransferDropoffEnabled,
      selectedTransferPickup: selectedTransferPickup ?? this.selectedTransferPickup,
      selectedTransferDropoff: selectedTransferDropoff ?? this.selectedTransferDropoff,
      transferStations: transferStations ?? this.transferStations,
      isLoadingTransferStations: isLoadingTransferStations ?? this.isLoadingTransferStations,
    );
  }
}