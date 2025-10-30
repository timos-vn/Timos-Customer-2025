import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:timos_customer_2025/models/response/group/group_response.dart';
import 'package:timos_customer_2025/models/response/trip/trip_response.dart';

part 'trip_state.freezed.dart';

@freezed
class TripState with _$TripState {
  const factory TripState({
    // User info
    @Default(true) bool isManager,

    // Loading states
    @Default(false) bool isLoadingGroups,
    @Default(false) bool isLoadingTrips,

    // Error states
    String? groupError,
    String? tripError,

    // Groups data
    @Default([]) List<GroupItem> allGroups,
    @Default([]) List<GroupItem> internalGroups,
    @Default([]) List<GroupItem> publicGroups,

    // Date selection
    @Default(0) int selectedDateOffset,
    @Default(0) int selectedDateIndex, // For ShareAirportPane

    // Vehicle and time filters
    @Default('Limo') String vehicleType,
    @Default('06:00-09:00') String selectedTimeSlot,

    // Status filters
    @Default('Chưa xử lý') String shareStatus,
    @Default('Chưa xử lý') String transferStatus,
    @Default('Chưa xử lý') String dispatcherStatus,

    // Type filters
    @Default('Nhóm nội bộ') String shareGroup,
    @Default('Tất cả') String transferType,
    @Default('Tất cả') String dispatcherTripType,

    // Selected data
    String? selectedGroup,
    @Default({}) Set<String> selectedCustomerIds,
    @Default({}) Set<String> selectedCustomers, // For dispatcher

    // Days with customers (mock data indicators)
    @Default({0, 1, 3, 5, 7, 9, 11, 13}) Set<int> daysWithCustomers,
    @Default({0, 1, 3, 5}) Set<int> shareAirportDaysWithCustomers,

    // Trips data from API
    @Default([]) List<TripItem> trips,
    @Default([]) List<TripItem> pendingTrips,
    @Default([]) List<TripItem> processingTrips,
  }) = _TripState;

  factory TripState.initial() => const TripState();
}

// Trip summary model for future use
@freezed
class TripSummary with _$TripSummary {
  const factory TripSummary({
    required String tripId,
    required String routeName,
    required DateTime departureTime,
    required int bookedSeats,
    required int totalSeats,
    required String licensePlate,
    required String driverName,
    required String driverPhone,
  }) = _TripSummary;
}
