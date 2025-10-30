import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timos_customer_2025/services/group_service.dart';
import 'package:timos_customer_2025/services/auth_service.dart';
import 'package:timos_customer_2025/models/response/group/group_response.dart';
import 'package:timos_customer_2025/models/response/auth/auth_response.dart';
import 'package:timos_customer_2025/models/response/trip/trip_response.dart';
import 'package:timos_customer_2025/services/trip_service.dart';
import 'trip_event.dart';
import 'trip_state.dart';

class TripBloc extends Bloc<TripEvent, TripState> {
  final GroupService _groupService;
  final TripService _tripService;
  TripBloc({
    GroupService? groupService,
    TripService? tripService,
  })  : _groupService = groupService ?? GroupService(),
        _tripService = tripService ?? TripService(),
        super(TripState.initial()) {
    // Register event handlers
    on<InitializeTripEvent>(_onInitialize);
    on<LoadGroupsEvent>(_onLoadGroups);
    on<SelectGroupEvent>(_onSelectGroup);
    on<ChangeGroupTypeEvent>(_onChangeGroupType);
    on<SelectDateEvent>(_onSelectDate);
    on<ChangeShareStatusEvent>(_onChangeShareStatus);
    on<ChangeTransferStatusEvent>(_onChangeTransferStatus);
    on<ChangeDispatcherStatusEvent>(_onChangeDispatcherStatus);
    on<ChangeVehicleTypeEvent>(_onChangeVehicleType);
    on<ChangeTimeSlotEvent>(_onChangeTimeSlot);
    on<ChangeTransferTypeEvent>(_onChangeTransferType);
    on<ChangeDispatcherTripTypeEvent>(_onChangeDispatcherTripType);
    on<SelectCustomerEvent>(_onSelectCustomer);
    on<DeselectCustomerEvent>(_onDeselectCustomer);
    on<ClearSelectedCustomersEvent>(_onClearSelectedCustomers);
    on<SelectAllCustomersEvent>(_onSelectAllCustomers);
    on<GroupCustomersEvent>(_onGroupCustomers);
    on<LoadTripsEvent>(_onLoadTrips);
    on<LoadPendingTripsEvent>(_onLoadPendingTrips);
    on<LoadProcessingTripsEvent>(_onLoadProcessingTrips);
  }

  // Initialize app state
  Future<void> _onInitialize(
    InitializeTripEvent event,
    Emitter<TripState> emit,
  ) async {
    final user = AuthService.currentUser;
    final isManager = user?.isAdmin() ?? true;

    emit(state.copyWith(isManager: isManager));

    // Load initial groups for current date
    add(const LoadGroupsEvent(date: ''));
  }

  // Load groups for specific date
  Future<void> _onLoadGroups(
    LoadGroupsEvent event,
    Emitter<TripState> emit,
  ) async {
    emit(state.copyWith(
      isLoadingGroups: true,
      groupError: null,
    ));

    try {
      String ngayChay = event.date;
      if (ngayChay.isEmpty) {
        final selectedDate =
            DateTime.now().add(Duration(days: state.selectedDateOffset));
        ngayChay =
            "${selectedDate.year}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}";
      }

      final response = await _groupService.getGroupList(ngayChay: ngayChay);

      if (response.isSuccess && response.data != null) {
        final allGroups = response.data!;
        final internalGroups =
            allGroups.where((group) => group.isInternalGroup).toList();
        final publicGroups =
            allGroups.where((group) => group.isPublicGroup).toList();

        // Auto-select first group if none selected
        String? selectedGroup = state.selectedGroup;
        if (selectedGroup == null) {
          if (state.shareGroup == 'Nhóm nội bộ' && internalGroups.isNotEmpty) {
            selectedGroup = internalGroups.first.tenNhom;
          } else if (state.shareGroup == 'Nhóm công khai' &&
              publicGroups.isNotEmpty) {
            selectedGroup = publicGroups.first.tenNhom;
          }
        }

        emit(state.copyWith(
          allGroups: allGroups,
          internalGroups: internalGroups,
          publicGroups: publicGroups,
          selectedGroup: selectedGroup,
          isLoadingGroups: false,
        ));
      } else {
        emit(state.copyWith(
          groupError: response.message ?? 'Không thể tải danh sách nhóm',
          isLoadingGroups: false,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        groupError: 'Lỗi khi tải danh sách nhóm: $e',
        isLoadingGroups: false,
      ));
    }
  }

  // Select specific group
  void _onSelectGroup(
    SelectGroupEvent event,
    Emitter<TripState> emit,
  ) {
    emit(state.copyWith(selectedGroup: event.groupName));
  }

  // Change group type (internal/public)
  void _onChangeGroupType(
    ChangeGroupTypeEvent event,
    Emitter<TripState> emit,
  ) {
    String? selectedGroup;
    if (event.groupType == 'Nhóm nội bộ' && state.internalGroups.isNotEmpty) {
      selectedGroup = state.internalGroups.first.tenNhom;
    } else if (event.groupType == 'Nhóm công khai' &&
        state.publicGroups.isNotEmpty) {
      selectedGroup = state.publicGroups.first.tenNhom;
    }

    emit(state.copyWith(
      shareGroup: event.groupType,
      selectedGroup: selectedGroup,
    ));
  }

  // Select date and reload groups
  void _onSelectDate(
    SelectDateEvent event,
    Emitter<TripState> emit,
  ) {
    emit(state.copyWith(selectedDateOffset: event.dateOffset));

    // Reload groups for new date
    add(const LoadGroupsEvent(date: ''));
  }

  // Status filter handlers
  void _onChangeShareStatus(
    ChangeShareStatusEvent event,
    Emitter<TripState> emit,
  ) {
    emit(state.copyWith(shareStatus: event.status));
  }

  void _onChangeTransferStatus(
    ChangeTransferStatusEvent event,
    Emitter<TripState> emit,
  ) {
    emit(state.copyWith(transferStatus: event.status));
  }

  void _onChangeDispatcherStatus(
    ChangeDispatcherStatusEvent event,
    Emitter<TripState> emit,
  ) {
    emit(state.copyWith(dispatcherStatus: event.status));
  }

  // Type filter handlers
  void _onChangeVehicleType(
    ChangeVehicleTypeEvent event,
    Emitter<TripState> emit,
  ) {
    emit(state.copyWith(vehicleType: event.type));
  }

  void _onChangeTimeSlot(
    ChangeTimeSlotEvent event,
    Emitter<TripState> emit,
  ) {
    emit(state.copyWith(selectedTimeSlot: event.slot));
  }

  void _onChangeTransferType(
    ChangeTransferTypeEvent event,
    Emitter<TripState> emit,
  ) {
    emit(state.copyWith(transferType: event.type));
  }

  void _onChangeDispatcherTripType(
    ChangeDispatcherTripTypeEvent event,
    Emitter<TripState> emit,
  ) {
    emit(state.copyWith(dispatcherTripType: event.type));
  }

  // Customer selection handlers
  void _onSelectCustomer(
    SelectCustomerEvent event,
    Emitter<TripState> emit,
  ) {
    final updatedIds = Set<String>.from(state.selectedCustomerIds)
      ..add(event.customerId);

    emit(state.copyWith(selectedCustomerIds: updatedIds));
  }

  void _onDeselectCustomer(
    DeselectCustomerEvent event,
    Emitter<TripState> emit,
  ) {
    final updatedIds = Set<String>.from(state.selectedCustomerIds)
      ..remove(event.customerId);

    emit(state.copyWith(selectedCustomerIds: updatedIds));
  }

  void _onClearSelectedCustomers(
    ClearSelectedCustomersEvent event,
    Emitter<TripState> emit,
  ) {
    emit(state.copyWith(selectedCustomerIds: {}));
  }

  void _onSelectAllCustomers(
    SelectAllCustomersEvent event,
    Emitter<TripState> emit,
  ) {
    emit(state.copyWith(selectedCustomerIds: event.customerIds.toSet()));
  }

  // Group customers action
  Future<void> _onGroupCustomers(
    GroupCustomersEvent event,
    Emitter<TripState> emit,
  ) async {
    // Here you would typically make an API call to group the customers
    // For now, just clear the selection after grouping
    emit(state.copyWith(selectedCustomerIds: {}));
  }

  // Load trips - now just calls both pending and processing
  Future<void> _onLoadTrips(
    LoadTripsEvent event,
    Emitter<TripState> emit,
  ) async {
    final user = AuthService.currentUser;
    if (user == null) return;

    final selectedDate =
        DateTime.now().add(Duration(days: state.selectedDateOffset));
    final ngayChay =
        "${selectedDate.year}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}";

    // Load both pending and processing trips
    add(LoadPendingTripsEvent(
      ngayChay: ngayChay,
      idNhanVien: user.id,
      idNhom: 0,
      idDoiTac: user.id,
    ));

    add(LoadProcessingTripsEvent(
      ngayChay: ngayChay,
      idNhanVien: user.id,
      idNhom: 0,
      idDoiTac: user.id,
    ));
  }

  // Load pending trips from API
  Future<void> _onLoadPendingTrips(
    LoadPendingTripsEvent event,
    Emitter<TripState> emit,
  ) async {
    emit(state.copyWith(isLoadingTrips: true, tripError: null));

    try {
      final response = await _tripService.getPendingResolvedTripList(
        pageIndex: 1,
        pageSize: 50,
        tuKhoa: '',
        ngayChay: event.ngayChay,
        idNhanVien: event.idNhanVien,
        idNhom: event.idNhom,
        idDoiTac: event.idDoiTac,
        // idNhanVien: "b2c20556-58d0-40e9-ac24-4a87b03af9f8",
        // idNhom: 0,
        // idDoiTac: "00000000-0000-0000-0000-000000000000",
      );
      print("pending trip response: $response");
      if (response.isSuccess && response.data != null) {
        emit(state.copyWith(
          pendingTrips: response.data!,
          trips: response.data!, // Use current API response data
          isLoadingTrips: false,
        ));
      } else {
        emit(state.copyWith(
          tripError:
              response.message ?? 'Không thể tải danh sách chuyến chưa xử lý',
          isLoadingTrips: false,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        tripError: 'Lỗi khi tải danh sách chuyến chưa xử lý: $e',
        isLoadingTrips: false,
      ));
    }
  }

  // Load processing trips from API
  Future<void> _onLoadProcessingTrips(
    LoadProcessingTripsEvent event,
    Emitter<TripState> emit,
  ) async {
    emit(state.copyWith(isLoadingTrips: true, tripError: null));

    try {
      final response = await _tripService.getProcessingTripList(
        pageIndex: 1,
        pageSize: 50,
        tuKhoa: '',
        ngayChay: event.ngayChay,
        idNhanVien: event.idNhanVien,
        idNhom: event.idNhom,
        idDoiTac: event.idDoiTac,
        // idNhanVien: "b2c20556-58d0-40e9-ac24-4a87b03af9f8",
        // idNhom: 0,
        // idDoiTac: "00000000-0000-0000-0000-000000000000",
      );
      print("processing trip response: $response");
      if (response.isSuccess && response.data != null) {
        emit(state.copyWith(
          processingTrips: response.data!,
          trips: response.data!, // Use current API response data
          isLoadingTrips: false,
        ));
      } else {
        emit(state.copyWith(
          tripError:
              response.message ?? 'Không thể tải danh sách chuyến đang xử lý',
          isLoadingTrips: false,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        tripError: 'Lỗi khi tải danh sách chuyến đang xử lý: $e',
        isLoadingTrips: false,
      ));
    }
  }
}
