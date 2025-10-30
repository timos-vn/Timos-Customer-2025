import 'package:freezed_annotation/freezed_annotation.dart';

part 'trip_event.freezed.dart';

@freezed
class TripEvent with _$TripEvent {
  // User role and initialization
  const factory TripEvent.initialize() = InitializeTripEvent;

  // Group management events
  const factory TripEvent.loadGroups({required String date}) = LoadGroupsEvent;
  const factory TripEvent.selectGroup({String? groupName}) = SelectGroupEvent;
  const factory TripEvent.changeGroupType({required String groupType}) =
      ChangeGroupTypeEvent;

  // Date selection events
  const factory TripEvent.selectDate({required int dateOffset}) =
      SelectDateEvent;

  // Status filter events
  const factory TripEvent.changeShareStatus({required String status}) =
      ChangeShareStatusEvent;
  const factory TripEvent.changeTransferStatus({required String status}) =
      ChangeTransferStatusEvent;
  const factory TripEvent.changeDispatcherStatus({required String status}) =
      ChangeDispatcherStatusEvent;

  // Type filter events
  const factory TripEvent.changeVehicleType({required String type}) =
      ChangeVehicleTypeEvent;
  const factory TripEvent.changeTimeSlot({required String slot}) =
      ChangeTimeSlotEvent;
  const factory TripEvent.changeTransferType({required String type}) =
      ChangeTransferTypeEvent;
  const factory TripEvent.changeDispatcherTripType({required String type}) =
      ChangeDispatcherTripTypeEvent;

  // Customer selection events
  const factory TripEvent.selectCustomer({required String customerId}) =
      SelectCustomerEvent;
  const factory TripEvent.deselectCustomer({required String customerId}) =
      DeselectCustomerEvent;
  const factory TripEvent.clearSelectedCustomers() =
      ClearSelectedCustomersEvent;
  const factory TripEvent.selectAllCustomers(
      {required List<String> customerIds}) = SelectAllCustomersEvent;

  // Trip management events
  const factory TripEvent.groupCustomers({
    required List<String> customerIds,
    required String groupName,
  }) = GroupCustomersEvent;

  const factory TripEvent.loadTrips() = LoadTripsEvent;
  const factory TripEvent.loadPendingTrips({
    required String ngayChay,
    required String idNhanVien,
    required int idNhom,
    String? idDoiTac,
  }) = LoadPendingTripsEvent;
  const factory TripEvent.loadProcessingTrips({
    required String ngayChay,
    required String idNhanVien,
    required int idNhom,
    String? idDoiTac,
  }) = LoadProcessingTripsEvent;
}
