// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trip_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TripState {
// User info
  bool get isManager => throw _privateConstructorUsedError; // Loading states
  bool get isLoadingGroups => throw _privateConstructorUsedError;
  bool get isLoadingTrips => throw _privateConstructorUsedError; // Error states
  String? get groupError => throw _privateConstructorUsedError;
  String? get tripError => throw _privateConstructorUsedError; // Groups data
  List<GroupItem> get allGroups => throw _privateConstructorUsedError;
  List<GroupItem> get internalGroups => throw _privateConstructorUsedError;
  List<GroupItem> get publicGroups =>
      throw _privateConstructorUsedError; // Date selection
  int get selectedDateOffset => throw _privateConstructorUsedError;
  int get selectedDateIndex =>
      throw _privateConstructorUsedError; // For ShareAirportPane
// Vehicle and time filters
  String get vehicleType => throw _privateConstructorUsedError;
  String get selectedTimeSlot =>
      throw _privateConstructorUsedError; // Status filters
  String get shareStatus => throw _privateConstructorUsedError;
  String get transferStatus => throw _privateConstructorUsedError;
  String get dispatcherStatus =>
      throw _privateConstructorUsedError; // Type filters
  String get shareGroup => throw _privateConstructorUsedError;
  String get transferType => throw _privateConstructorUsedError;
  String get dispatcherTripType =>
      throw _privateConstructorUsedError; // Selected data
  String? get selectedGroup => throw _privateConstructorUsedError;
  Set<String> get selectedCustomerIds => throw _privateConstructorUsedError;
  Set<String> get selectedCustomers =>
      throw _privateConstructorUsedError; // For dispatcher
// Days with customers (mock data indicators)
  Set<int> get daysWithCustomers => throw _privateConstructorUsedError;
  Set<int> get shareAirportDaysWithCustomers =>
      throw _privateConstructorUsedError; // Trips data from API
  List<TripItem> get trips => throw _privateConstructorUsedError;
  List<TripItem> get pendingTrips => throw _privateConstructorUsedError;
  List<TripItem> get processingTrips => throw _privateConstructorUsedError;

  /// Create a copy of TripState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TripStateCopyWith<TripState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TripStateCopyWith<$Res> {
  factory $TripStateCopyWith(TripState value, $Res Function(TripState) then) =
      _$TripStateCopyWithImpl<$Res, TripState>;
  @useResult
  $Res call(
      {bool isManager,
      bool isLoadingGroups,
      bool isLoadingTrips,
      String? groupError,
      String? tripError,
      List<GroupItem> allGroups,
      List<GroupItem> internalGroups,
      List<GroupItem> publicGroups,
      int selectedDateOffset,
      int selectedDateIndex,
      String vehicleType,
      String selectedTimeSlot,
      String shareStatus,
      String transferStatus,
      String dispatcherStatus,
      String shareGroup,
      String transferType,
      String dispatcherTripType,
      String? selectedGroup,
      Set<String> selectedCustomerIds,
      Set<String> selectedCustomers,
      Set<int> daysWithCustomers,
      Set<int> shareAirportDaysWithCustomers,
      List<TripItem> trips,
      List<TripItem> pendingTrips,
      List<TripItem> processingTrips});
}

/// @nodoc
class _$TripStateCopyWithImpl<$Res, $Val extends TripState>
    implements $TripStateCopyWith<$Res> {
  _$TripStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TripState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isManager = null,
    Object? isLoadingGroups = null,
    Object? isLoadingTrips = null,
    Object? groupError = freezed,
    Object? tripError = freezed,
    Object? allGroups = null,
    Object? internalGroups = null,
    Object? publicGroups = null,
    Object? selectedDateOffset = null,
    Object? selectedDateIndex = null,
    Object? vehicleType = null,
    Object? selectedTimeSlot = null,
    Object? shareStatus = null,
    Object? transferStatus = null,
    Object? dispatcherStatus = null,
    Object? shareGroup = null,
    Object? transferType = null,
    Object? dispatcherTripType = null,
    Object? selectedGroup = freezed,
    Object? selectedCustomerIds = null,
    Object? selectedCustomers = null,
    Object? daysWithCustomers = null,
    Object? shareAirportDaysWithCustomers = null,
    Object? trips = null,
    Object? pendingTrips = null,
    Object? processingTrips = null,
  }) {
    return _then(_value.copyWith(
      isManager: null == isManager
          ? _value.isManager
          : isManager // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingGroups: null == isLoadingGroups
          ? _value.isLoadingGroups
          : isLoadingGroups // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingTrips: null == isLoadingTrips
          ? _value.isLoadingTrips
          : isLoadingTrips // ignore: cast_nullable_to_non_nullable
              as bool,
      groupError: freezed == groupError
          ? _value.groupError
          : groupError // ignore: cast_nullable_to_non_nullable
              as String?,
      tripError: freezed == tripError
          ? _value.tripError
          : tripError // ignore: cast_nullable_to_non_nullable
              as String?,
      allGroups: null == allGroups
          ? _value.allGroups
          : allGroups // ignore: cast_nullable_to_non_nullable
              as List<GroupItem>,
      internalGroups: null == internalGroups
          ? _value.internalGroups
          : internalGroups // ignore: cast_nullable_to_non_nullable
              as List<GroupItem>,
      publicGroups: null == publicGroups
          ? _value.publicGroups
          : publicGroups // ignore: cast_nullable_to_non_nullable
              as List<GroupItem>,
      selectedDateOffset: null == selectedDateOffset
          ? _value.selectedDateOffset
          : selectedDateOffset // ignore: cast_nullable_to_non_nullable
              as int,
      selectedDateIndex: null == selectedDateIndex
          ? _value.selectedDateIndex
          : selectedDateIndex // ignore: cast_nullable_to_non_nullable
              as int,
      vehicleType: null == vehicleType
          ? _value.vehicleType
          : vehicleType // ignore: cast_nullable_to_non_nullable
              as String,
      selectedTimeSlot: null == selectedTimeSlot
          ? _value.selectedTimeSlot
          : selectedTimeSlot // ignore: cast_nullable_to_non_nullable
              as String,
      shareStatus: null == shareStatus
          ? _value.shareStatus
          : shareStatus // ignore: cast_nullable_to_non_nullable
              as String,
      transferStatus: null == transferStatus
          ? _value.transferStatus
          : transferStatus // ignore: cast_nullable_to_non_nullable
              as String,
      dispatcherStatus: null == dispatcherStatus
          ? _value.dispatcherStatus
          : dispatcherStatus // ignore: cast_nullable_to_non_nullable
              as String,
      shareGroup: null == shareGroup
          ? _value.shareGroup
          : shareGroup // ignore: cast_nullable_to_non_nullable
              as String,
      transferType: null == transferType
          ? _value.transferType
          : transferType // ignore: cast_nullable_to_non_nullable
              as String,
      dispatcherTripType: null == dispatcherTripType
          ? _value.dispatcherTripType
          : dispatcherTripType // ignore: cast_nullable_to_non_nullable
              as String,
      selectedGroup: freezed == selectedGroup
          ? _value.selectedGroup
          : selectedGroup // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedCustomerIds: null == selectedCustomerIds
          ? _value.selectedCustomerIds
          : selectedCustomerIds // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      selectedCustomers: null == selectedCustomers
          ? _value.selectedCustomers
          : selectedCustomers // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      daysWithCustomers: null == daysWithCustomers
          ? _value.daysWithCustomers
          : daysWithCustomers // ignore: cast_nullable_to_non_nullable
              as Set<int>,
      shareAirportDaysWithCustomers: null == shareAirportDaysWithCustomers
          ? _value.shareAirportDaysWithCustomers
          : shareAirportDaysWithCustomers // ignore: cast_nullable_to_non_nullable
              as Set<int>,
      trips: null == trips
          ? _value.trips
          : trips // ignore: cast_nullable_to_non_nullable
              as List<TripItem>,
      pendingTrips: null == pendingTrips
          ? _value.pendingTrips
          : pendingTrips // ignore: cast_nullable_to_non_nullable
              as List<TripItem>,
      processingTrips: null == processingTrips
          ? _value.processingTrips
          : processingTrips // ignore: cast_nullable_to_non_nullable
              as List<TripItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TripStateImplCopyWith<$Res>
    implements $TripStateCopyWith<$Res> {
  factory _$$TripStateImplCopyWith(
          _$TripStateImpl value, $Res Function(_$TripStateImpl) then) =
      __$$TripStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isManager,
      bool isLoadingGroups,
      bool isLoadingTrips,
      String? groupError,
      String? tripError,
      List<GroupItem> allGroups,
      List<GroupItem> internalGroups,
      List<GroupItem> publicGroups,
      int selectedDateOffset,
      int selectedDateIndex,
      String vehicleType,
      String selectedTimeSlot,
      String shareStatus,
      String transferStatus,
      String dispatcherStatus,
      String shareGroup,
      String transferType,
      String dispatcherTripType,
      String? selectedGroup,
      Set<String> selectedCustomerIds,
      Set<String> selectedCustomers,
      Set<int> daysWithCustomers,
      Set<int> shareAirportDaysWithCustomers,
      List<TripItem> trips,
      List<TripItem> pendingTrips,
      List<TripItem> processingTrips});
}

/// @nodoc
class __$$TripStateImplCopyWithImpl<$Res>
    extends _$TripStateCopyWithImpl<$Res, _$TripStateImpl>
    implements _$$TripStateImplCopyWith<$Res> {
  __$$TripStateImplCopyWithImpl(
      _$TripStateImpl _value, $Res Function(_$TripStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TripState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isManager = null,
    Object? isLoadingGroups = null,
    Object? isLoadingTrips = null,
    Object? groupError = freezed,
    Object? tripError = freezed,
    Object? allGroups = null,
    Object? internalGroups = null,
    Object? publicGroups = null,
    Object? selectedDateOffset = null,
    Object? selectedDateIndex = null,
    Object? vehicleType = null,
    Object? selectedTimeSlot = null,
    Object? shareStatus = null,
    Object? transferStatus = null,
    Object? dispatcherStatus = null,
    Object? shareGroup = null,
    Object? transferType = null,
    Object? dispatcherTripType = null,
    Object? selectedGroup = freezed,
    Object? selectedCustomerIds = null,
    Object? selectedCustomers = null,
    Object? daysWithCustomers = null,
    Object? shareAirportDaysWithCustomers = null,
    Object? trips = null,
    Object? pendingTrips = null,
    Object? processingTrips = null,
  }) {
    return _then(_$TripStateImpl(
      isManager: null == isManager
          ? _value.isManager
          : isManager // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingGroups: null == isLoadingGroups
          ? _value.isLoadingGroups
          : isLoadingGroups // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingTrips: null == isLoadingTrips
          ? _value.isLoadingTrips
          : isLoadingTrips // ignore: cast_nullable_to_non_nullable
              as bool,
      groupError: freezed == groupError
          ? _value.groupError
          : groupError // ignore: cast_nullable_to_non_nullable
              as String?,
      tripError: freezed == tripError
          ? _value.tripError
          : tripError // ignore: cast_nullable_to_non_nullable
              as String?,
      allGroups: null == allGroups
          ? _value._allGroups
          : allGroups // ignore: cast_nullable_to_non_nullable
              as List<GroupItem>,
      internalGroups: null == internalGroups
          ? _value._internalGroups
          : internalGroups // ignore: cast_nullable_to_non_nullable
              as List<GroupItem>,
      publicGroups: null == publicGroups
          ? _value._publicGroups
          : publicGroups // ignore: cast_nullable_to_non_nullable
              as List<GroupItem>,
      selectedDateOffset: null == selectedDateOffset
          ? _value.selectedDateOffset
          : selectedDateOffset // ignore: cast_nullable_to_non_nullable
              as int,
      selectedDateIndex: null == selectedDateIndex
          ? _value.selectedDateIndex
          : selectedDateIndex // ignore: cast_nullable_to_non_nullable
              as int,
      vehicleType: null == vehicleType
          ? _value.vehicleType
          : vehicleType // ignore: cast_nullable_to_non_nullable
              as String,
      selectedTimeSlot: null == selectedTimeSlot
          ? _value.selectedTimeSlot
          : selectedTimeSlot // ignore: cast_nullable_to_non_nullable
              as String,
      shareStatus: null == shareStatus
          ? _value.shareStatus
          : shareStatus // ignore: cast_nullable_to_non_nullable
              as String,
      transferStatus: null == transferStatus
          ? _value.transferStatus
          : transferStatus // ignore: cast_nullable_to_non_nullable
              as String,
      dispatcherStatus: null == dispatcherStatus
          ? _value.dispatcherStatus
          : dispatcherStatus // ignore: cast_nullable_to_non_nullable
              as String,
      shareGroup: null == shareGroup
          ? _value.shareGroup
          : shareGroup // ignore: cast_nullable_to_non_nullable
              as String,
      transferType: null == transferType
          ? _value.transferType
          : transferType // ignore: cast_nullable_to_non_nullable
              as String,
      dispatcherTripType: null == dispatcherTripType
          ? _value.dispatcherTripType
          : dispatcherTripType // ignore: cast_nullable_to_non_nullable
              as String,
      selectedGroup: freezed == selectedGroup
          ? _value.selectedGroup
          : selectedGroup // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedCustomerIds: null == selectedCustomerIds
          ? _value._selectedCustomerIds
          : selectedCustomerIds // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      selectedCustomers: null == selectedCustomers
          ? _value._selectedCustomers
          : selectedCustomers // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      daysWithCustomers: null == daysWithCustomers
          ? _value._daysWithCustomers
          : daysWithCustomers // ignore: cast_nullable_to_non_nullable
              as Set<int>,
      shareAirportDaysWithCustomers: null == shareAirportDaysWithCustomers
          ? _value._shareAirportDaysWithCustomers
          : shareAirportDaysWithCustomers // ignore: cast_nullable_to_non_nullable
              as Set<int>,
      trips: null == trips
          ? _value._trips
          : trips // ignore: cast_nullable_to_non_nullable
              as List<TripItem>,
      pendingTrips: null == pendingTrips
          ? _value._pendingTrips
          : pendingTrips // ignore: cast_nullable_to_non_nullable
              as List<TripItem>,
      processingTrips: null == processingTrips
          ? _value._processingTrips
          : processingTrips // ignore: cast_nullable_to_non_nullable
              as List<TripItem>,
    ));
  }
}

/// @nodoc

class _$TripStateImpl implements _TripState {
  const _$TripStateImpl(
      {this.isManager = true,
      this.isLoadingGroups = false,
      this.isLoadingTrips = false,
      this.groupError,
      this.tripError,
      final List<GroupItem> allGroups = const [],
      final List<GroupItem> internalGroups = const [],
      final List<GroupItem> publicGroups = const [],
      this.selectedDateOffset = 0,
      this.selectedDateIndex = 0,
      this.vehicleType = 'Limo',
      this.selectedTimeSlot = '06:00-09:00',
      this.shareStatus = 'Chưa xử lý',
      this.transferStatus = 'Chưa xử lý',
      this.dispatcherStatus = 'Chưa xử lý',
      this.shareGroup = 'Nhóm nội bộ',
      this.transferType = 'Tất cả',
      this.dispatcherTripType = 'Tất cả',
      this.selectedGroup,
      final Set<String> selectedCustomerIds = const {},
      final Set<String> selectedCustomers = const {},
      final Set<int> daysWithCustomers = const {0, 1, 3, 5, 7, 9, 11, 13},
      final Set<int> shareAirportDaysWithCustomers = const {0, 1, 3, 5},
      final List<TripItem> trips = const [],
      final List<TripItem> pendingTrips = const [],
      final List<TripItem> processingTrips = const []})
      : _allGroups = allGroups,
        _internalGroups = internalGroups,
        _publicGroups = publicGroups,
        _selectedCustomerIds = selectedCustomerIds,
        _selectedCustomers = selectedCustomers,
        _daysWithCustomers = daysWithCustomers,
        _shareAirportDaysWithCustomers = shareAirportDaysWithCustomers,
        _trips = trips,
        _pendingTrips = pendingTrips,
        _processingTrips = processingTrips;

// User info
  @override
  @JsonKey()
  final bool isManager;
// Loading states
  @override
  @JsonKey()
  final bool isLoadingGroups;
  @override
  @JsonKey()
  final bool isLoadingTrips;
// Error states
  @override
  final String? groupError;
  @override
  final String? tripError;
// Groups data
  final List<GroupItem> _allGroups;
// Groups data
  @override
  @JsonKey()
  List<GroupItem> get allGroups {
    if (_allGroups is EqualUnmodifiableListView) return _allGroups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allGroups);
  }

  final List<GroupItem> _internalGroups;
  @override
  @JsonKey()
  List<GroupItem> get internalGroups {
    if (_internalGroups is EqualUnmodifiableListView) return _internalGroups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_internalGroups);
  }

  final List<GroupItem> _publicGroups;
  @override
  @JsonKey()
  List<GroupItem> get publicGroups {
    if (_publicGroups is EqualUnmodifiableListView) return _publicGroups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_publicGroups);
  }

// Date selection
  @override
  @JsonKey()
  final int selectedDateOffset;
  @override
  @JsonKey()
  final int selectedDateIndex;
// For ShareAirportPane
// Vehicle and time filters
  @override
  @JsonKey()
  final String vehicleType;
  @override
  @JsonKey()
  final String selectedTimeSlot;
// Status filters
  @override
  @JsonKey()
  final String shareStatus;
  @override
  @JsonKey()
  final String transferStatus;
  @override
  @JsonKey()
  final String dispatcherStatus;
// Type filters
  @override
  @JsonKey()
  final String shareGroup;
  @override
  @JsonKey()
  final String transferType;
  @override
  @JsonKey()
  final String dispatcherTripType;
// Selected data
  @override
  final String? selectedGroup;
  final Set<String> _selectedCustomerIds;
  @override
  @JsonKey()
  Set<String> get selectedCustomerIds {
    if (_selectedCustomerIds is EqualUnmodifiableSetView)
      return _selectedCustomerIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_selectedCustomerIds);
  }

  final Set<String> _selectedCustomers;
  @override
  @JsonKey()
  Set<String> get selectedCustomers {
    if (_selectedCustomers is EqualUnmodifiableSetView)
      return _selectedCustomers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_selectedCustomers);
  }

// For dispatcher
// Days with customers (mock data indicators)
  final Set<int> _daysWithCustomers;
// For dispatcher
// Days with customers (mock data indicators)
  @override
  @JsonKey()
  Set<int> get daysWithCustomers {
    if (_daysWithCustomers is EqualUnmodifiableSetView)
      return _daysWithCustomers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_daysWithCustomers);
  }

  final Set<int> _shareAirportDaysWithCustomers;
  @override
  @JsonKey()
  Set<int> get shareAirportDaysWithCustomers {
    if (_shareAirportDaysWithCustomers is EqualUnmodifiableSetView)
      return _shareAirportDaysWithCustomers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_shareAirportDaysWithCustomers);
  }

// Trips data from API
  final List<TripItem> _trips;
// Trips data from API
  @override
  @JsonKey()
  List<TripItem> get trips {
    if (_trips is EqualUnmodifiableListView) return _trips;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_trips);
  }

  final List<TripItem> _pendingTrips;
  @override
  @JsonKey()
  List<TripItem> get pendingTrips {
    if (_pendingTrips is EqualUnmodifiableListView) return _pendingTrips;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pendingTrips);
  }

  final List<TripItem> _processingTrips;
  @override
  @JsonKey()
  List<TripItem> get processingTrips {
    if (_processingTrips is EqualUnmodifiableListView) return _processingTrips;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_processingTrips);
  }

  @override
  String toString() {
    return 'TripState(isManager: $isManager, isLoadingGroups: $isLoadingGroups, isLoadingTrips: $isLoadingTrips, groupError: $groupError, tripError: $tripError, allGroups: $allGroups, internalGroups: $internalGroups, publicGroups: $publicGroups, selectedDateOffset: $selectedDateOffset, selectedDateIndex: $selectedDateIndex, vehicleType: $vehicleType, selectedTimeSlot: $selectedTimeSlot, shareStatus: $shareStatus, transferStatus: $transferStatus, dispatcherStatus: $dispatcherStatus, shareGroup: $shareGroup, transferType: $transferType, dispatcherTripType: $dispatcherTripType, selectedGroup: $selectedGroup, selectedCustomerIds: $selectedCustomerIds, selectedCustomers: $selectedCustomers, daysWithCustomers: $daysWithCustomers, shareAirportDaysWithCustomers: $shareAirportDaysWithCustomers, trips: $trips, pendingTrips: $pendingTrips, processingTrips: $processingTrips)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TripStateImpl &&
            (identical(other.isManager, isManager) ||
                other.isManager == isManager) &&
            (identical(other.isLoadingGroups, isLoadingGroups) ||
                other.isLoadingGroups == isLoadingGroups) &&
            (identical(other.isLoadingTrips, isLoadingTrips) ||
                other.isLoadingTrips == isLoadingTrips) &&
            (identical(other.groupError, groupError) ||
                other.groupError == groupError) &&
            (identical(other.tripError, tripError) ||
                other.tripError == tripError) &&
            const DeepCollectionEquality()
                .equals(other._allGroups, _allGroups) &&
            const DeepCollectionEquality()
                .equals(other._internalGroups, _internalGroups) &&
            const DeepCollectionEquality()
                .equals(other._publicGroups, _publicGroups) &&
            (identical(other.selectedDateOffset, selectedDateOffset) ||
                other.selectedDateOffset == selectedDateOffset) &&
            (identical(other.selectedDateIndex, selectedDateIndex) ||
                other.selectedDateIndex == selectedDateIndex) &&
            (identical(other.vehicleType, vehicleType) ||
                other.vehicleType == vehicleType) &&
            (identical(other.selectedTimeSlot, selectedTimeSlot) ||
                other.selectedTimeSlot == selectedTimeSlot) &&
            (identical(other.shareStatus, shareStatus) ||
                other.shareStatus == shareStatus) &&
            (identical(other.transferStatus, transferStatus) ||
                other.transferStatus == transferStatus) &&
            (identical(other.dispatcherStatus, dispatcherStatus) ||
                other.dispatcherStatus == dispatcherStatus) &&
            (identical(other.shareGroup, shareGroup) ||
                other.shareGroup == shareGroup) &&
            (identical(other.transferType, transferType) ||
                other.transferType == transferType) &&
            (identical(other.dispatcherTripType, dispatcherTripType) ||
                other.dispatcherTripType == dispatcherTripType) &&
            (identical(other.selectedGroup, selectedGroup) ||
                other.selectedGroup == selectedGroup) &&
            const DeepCollectionEquality()
                .equals(other._selectedCustomerIds, _selectedCustomerIds) &&
            const DeepCollectionEquality()
                .equals(other._selectedCustomers, _selectedCustomers) &&
            const DeepCollectionEquality()
                .equals(other._daysWithCustomers, _daysWithCustomers) &&
            const DeepCollectionEquality().equals(
                other._shareAirportDaysWithCustomers,
                _shareAirportDaysWithCustomers) &&
            const DeepCollectionEquality().equals(other._trips, _trips) &&
            const DeepCollectionEquality()
                .equals(other._pendingTrips, _pendingTrips) &&
            const DeepCollectionEquality()
                .equals(other._processingTrips, _processingTrips));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        isManager,
        isLoadingGroups,
        isLoadingTrips,
        groupError,
        tripError,
        const DeepCollectionEquality().hash(_allGroups),
        const DeepCollectionEquality().hash(_internalGroups),
        const DeepCollectionEquality().hash(_publicGroups),
        selectedDateOffset,
        selectedDateIndex,
        vehicleType,
        selectedTimeSlot,
        shareStatus,
        transferStatus,
        dispatcherStatus,
        shareGroup,
        transferType,
        dispatcherTripType,
        selectedGroup,
        const DeepCollectionEquality().hash(_selectedCustomerIds),
        const DeepCollectionEquality().hash(_selectedCustomers),
        const DeepCollectionEquality().hash(_daysWithCustomers),
        const DeepCollectionEquality().hash(_shareAirportDaysWithCustomers),
        const DeepCollectionEquality().hash(_trips),
        const DeepCollectionEquality().hash(_pendingTrips),
        const DeepCollectionEquality().hash(_processingTrips)
      ]);

  /// Create a copy of TripState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TripStateImplCopyWith<_$TripStateImpl> get copyWith =>
      __$$TripStateImplCopyWithImpl<_$TripStateImpl>(this, _$identity);
}

abstract class _TripState implements TripState {
  const factory _TripState(
      {final bool isManager,
      final bool isLoadingGroups,
      final bool isLoadingTrips,
      final String? groupError,
      final String? tripError,
      final List<GroupItem> allGroups,
      final List<GroupItem> internalGroups,
      final List<GroupItem> publicGroups,
      final int selectedDateOffset,
      final int selectedDateIndex,
      final String vehicleType,
      final String selectedTimeSlot,
      final String shareStatus,
      final String transferStatus,
      final String dispatcherStatus,
      final String shareGroup,
      final String transferType,
      final String dispatcherTripType,
      final String? selectedGroup,
      final Set<String> selectedCustomerIds,
      final Set<String> selectedCustomers,
      final Set<int> daysWithCustomers,
      final Set<int> shareAirportDaysWithCustomers,
      final List<TripItem> trips,
      final List<TripItem> pendingTrips,
      final List<TripItem> processingTrips}) = _$TripStateImpl;

// User info
  @override
  bool get isManager; // Loading states
  @override
  bool get isLoadingGroups;
  @override
  bool get isLoadingTrips; // Error states
  @override
  String? get groupError;
  @override
  String? get tripError; // Groups data
  @override
  List<GroupItem> get allGroups;
  @override
  List<GroupItem> get internalGroups;
  @override
  List<GroupItem> get publicGroups; // Date selection
  @override
  int get selectedDateOffset;
  @override
  int get selectedDateIndex; // For ShareAirportPane
// Vehicle and time filters
  @override
  String get vehicleType;
  @override
  String get selectedTimeSlot; // Status filters
  @override
  String get shareStatus;
  @override
  String get transferStatus;
  @override
  String get dispatcherStatus; // Type filters
  @override
  String get shareGroup;
  @override
  String get transferType;
  @override
  String get dispatcherTripType; // Selected data
  @override
  String? get selectedGroup;
  @override
  Set<String> get selectedCustomerIds;
  @override
  Set<String> get selectedCustomers; // For dispatcher
// Days with customers (mock data indicators)
  @override
  Set<int> get daysWithCustomers;
  @override
  Set<int> get shareAirportDaysWithCustomers; // Trips data from API
  @override
  List<TripItem> get trips;
  @override
  List<TripItem> get pendingTrips;
  @override
  List<TripItem> get processingTrips;

  /// Create a copy of TripState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TripStateImplCopyWith<_$TripStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TripSummary {
  String get tripId => throw _privateConstructorUsedError;
  String get routeName => throw _privateConstructorUsedError;
  DateTime get departureTime => throw _privateConstructorUsedError;
  int get bookedSeats => throw _privateConstructorUsedError;
  int get totalSeats => throw _privateConstructorUsedError;
  String get licensePlate => throw _privateConstructorUsedError;
  String get driverName => throw _privateConstructorUsedError;
  String get driverPhone => throw _privateConstructorUsedError;

  /// Create a copy of TripSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TripSummaryCopyWith<TripSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TripSummaryCopyWith<$Res> {
  factory $TripSummaryCopyWith(
          TripSummary value, $Res Function(TripSummary) then) =
      _$TripSummaryCopyWithImpl<$Res, TripSummary>;
  @useResult
  $Res call(
      {String tripId,
      String routeName,
      DateTime departureTime,
      int bookedSeats,
      int totalSeats,
      String licensePlate,
      String driverName,
      String driverPhone});
}

/// @nodoc
class _$TripSummaryCopyWithImpl<$Res, $Val extends TripSummary>
    implements $TripSummaryCopyWith<$Res> {
  _$TripSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TripSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tripId = null,
    Object? routeName = null,
    Object? departureTime = null,
    Object? bookedSeats = null,
    Object? totalSeats = null,
    Object? licensePlate = null,
    Object? driverName = null,
    Object? driverPhone = null,
  }) {
    return _then(_value.copyWith(
      tripId: null == tripId
          ? _value.tripId
          : tripId // ignore: cast_nullable_to_non_nullable
              as String,
      routeName: null == routeName
          ? _value.routeName
          : routeName // ignore: cast_nullable_to_non_nullable
              as String,
      departureTime: null == departureTime
          ? _value.departureTime
          : departureTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      bookedSeats: null == bookedSeats
          ? _value.bookedSeats
          : bookedSeats // ignore: cast_nullable_to_non_nullable
              as int,
      totalSeats: null == totalSeats
          ? _value.totalSeats
          : totalSeats // ignore: cast_nullable_to_non_nullable
              as int,
      licensePlate: null == licensePlate
          ? _value.licensePlate
          : licensePlate // ignore: cast_nullable_to_non_nullable
              as String,
      driverName: null == driverName
          ? _value.driverName
          : driverName // ignore: cast_nullable_to_non_nullable
              as String,
      driverPhone: null == driverPhone
          ? _value.driverPhone
          : driverPhone // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TripSummaryImplCopyWith<$Res>
    implements $TripSummaryCopyWith<$Res> {
  factory _$$TripSummaryImplCopyWith(
          _$TripSummaryImpl value, $Res Function(_$TripSummaryImpl) then) =
      __$$TripSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String tripId,
      String routeName,
      DateTime departureTime,
      int bookedSeats,
      int totalSeats,
      String licensePlate,
      String driverName,
      String driverPhone});
}

/// @nodoc
class __$$TripSummaryImplCopyWithImpl<$Res>
    extends _$TripSummaryCopyWithImpl<$Res, _$TripSummaryImpl>
    implements _$$TripSummaryImplCopyWith<$Res> {
  __$$TripSummaryImplCopyWithImpl(
      _$TripSummaryImpl _value, $Res Function(_$TripSummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of TripSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tripId = null,
    Object? routeName = null,
    Object? departureTime = null,
    Object? bookedSeats = null,
    Object? totalSeats = null,
    Object? licensePlate = null,
    Object? driverName = null,
    Object? driverPhone = null,
  }) {
    return _then(_$TripSummaryImpl(
      tripId: null == tripId
          ? _value.tripId
          : tripId // ignore: cast_nullable_to_non_nullable
              as String,
      routeName: null == routeName
          ? _value.routeName
          : routeName // ignore: cast_nullable_to_non_nullable
              as String,
      departureTime: null == departureTime
          ? _value.departureTime
          : departureTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      bookedSeats: null == bookedSeats
          ? _value.bookedSeats
          : bookedSeats // ignore: cast_nullable_to_non_nullable
              as int,
      totalSeats: null == totalSeats
          ? _value.totalSeats
          : totalSeats // ignore: cast_nullable_to_non_nullable
              as int,
      licensePlate: null == licensePlate
          ? _value.licensePlate
          : licensePlate // ignore: cast_nullable_to_non_nullable
              as String,
      driverName: null == driverName
          ? _value.driverName
          : driverName // ignore: cast_nullable_to_non_nullable
              as String,
      driverPhone: null == driverPhone
          ? _value.driverPhone
          : driverPhone // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TripSummaryImpl implements _TripSummary {
  const _$TripSummaryImpl(
      {required this.tripId,
      required this.routeName,
      required this.departureTime,
      required this.bookedSeats,
      required this.totalSeats,
      required this.licensePlate,
      required this.driverName,
      required this.driverPhone});

  @override
  final String tripId;
  @override
  final String routeName;
  @override
  final DateTime departureTime;
  @override
  final int bookedSeats;
  @override
  final int totalSeats;
  @override
  final String licensePlate;
  @override
  final String driverName;
  @override
  final String driverPhone;

  @override
  String toString() {
    return 'TripSummary(tripId: $tripId, routeName: $routeName, departureTime: $departureTime, bookedSeats: $bookedSeats, totalSeats: $totalSeats, licensePlate: $licensePlate, driverName: $driverName, driverPhone: $driverPhone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TripSummaryImpl &&
            (identical(other.tripId, tripId) || other.tripId == tripId) &&
            (identical(other.routeName, routeName) ||
                other.routeName == routeName) &&
            (identical(other.departureTime, departureTime) ||
                other.departureTime == departureTime) &&
            (identical(other.bookedSeats, bookedSeats) ||
                other.bookedSeats == bookedSeats) &&
            (identical(other.totalSeats, totalSeats) ||
                other.totalSeats == totalSeats) &&
            (identical(other.licensePlate, licensePlate) ||
                other.licensePlate == licensePlate) &&
            (identical(other.driverName, driverName) ||
                other.driverName == driverName) &&
            (identical(other.driverPhone, driverPhone) ||
                other.driverPhone == driverPhone));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tripId, routeName, departureTime,
      bookedSeats, totalSeats, licensePlate, driverName, driverPhone);

  /// Create a copy of TripSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TripSummaryImplCopyWith<_$TripSummaryImpl> get copyWith =>
      __$$TripSummaryImplCopyWithImpl<_$TripSummaryImpl>(this, _$identity);
}

abstract class _TripSummary implements TripSummary {
  const factory _TripSummary(
      {required final String tripId,
      required final String routeName,
      required final DateTime departureTime,
      required final int bookedSeats,
      required final int totalSeats,
      required final String licensePlate,
      required final String driverName,
      required final String driverPhone}) = _$TripSummaryImpl;

  @override
  String get tripId;
  @override
  String get routeName;
  @override
  DateTime get departureTime;
  @override
  int get bookedSeats;
  @override
  int get totalSeats;
  @override
  String get licensePlate;
  @override
  String get driverName;
  @override
  String get driverPhone;

  /// Create a copy of TripSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TripSummaryImplCopyWith<_$TripSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
