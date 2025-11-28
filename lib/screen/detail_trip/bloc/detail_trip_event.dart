import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:timos_customer_2025/screen/booking_ticket/ticket_price/model/cancel_ticket_request.dart';

// part 'detail_trip_event.freezed.dart';

// @freezed
// class DetailTripEvent with _$DetailTripEvent {
//   const factory DetailTripEvent.loadDetailCoachPaneTrip({
//     required String idLichXeLimousine,
//   }) = LoadDetailCoachPaneTripEvent;
// }

abstract class DetailTripEvent extends Equatable {}

class LoadDetailCoachPaneTripEvent extends DetailTripEvent {
  final String idLichXeLimousine;

  LoadDetailCoachPaneTripEvent({required this.idLichXeLimousine});

  @override
  List<Object?> get props => [idLichXeLimousine];
}

class CancelTripEvent extends DetailTripEvent {
  final CancelTicketRequest cancelTicketRequest;

  CancelTripEvent({
    required this.cancelTicketRequest,
  });

  @override
  List<Object?> get props => [
    cancelTicketRequest
      ];
}