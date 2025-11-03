// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_trip_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DetailTripState {
  DetailCoachPaneTripData? get detailCoachPaneTrip =>
      throw _privateConstructorUsedError;
  bool get isLoadingTrips => throw _privateConstructorUsedError;
  String? get tripError => throw _privateConstructorUsedError;

  /// Create a copy of DetailTripState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DetailTripStateCopyWith<DetailTripState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailTripStateCopyWith<$Res> {
  factory $DetailTripStateCopyWith(
          DetailTripState value, $Res Function(DetailTripState) then) =
      _$DetailTripStateCopyWithImpl<$Res, DetailTripState>;
  @useResult
  $Res call(
      {DetailCoachPaneTripData? detailCoachPaneTrip,
      bool isLoadingTrips,
      String? tripError});

  $DetailCoachPaneTripDataCopyWith<$Res>? get detailCoachPaneTrip;
}

/// @nodoc
class _$DetailTripStateCopyWithImpl<$Res, $Val extends DetailTripState>
    implements $DetailTripStateCopyWith<$Res> {
  _$DetailTripStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DetailTripState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? detailCoachPaneTrip = freezed,
    Object? isLoadingTrips = null,
    Object? tripError = freezed,
  }) {
    return _then(_value.copyWith(
      detailCoachPaneTrip: freezed == detailCoachPaneTrip
          ? _value.detailCoachPaneTrip
          : detailCoachPaneTrip // ignore: cast_nullable_to_non_nullable
              as DetailCoachPaneTripData?,
      isLoadingTrips: null == isLoadingTrips
          ? _value.isLoadingTrips
          : isLoadingTrips // ignore: cast_nullable_to_non_nullable
              as bool,
      tripError: freezed == tripError
          ? _value.tripError
          : tripError // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of DetailTripState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DetailCoachPaneTripDataCopyWith<$Res>? get detailCoachPaneTrip {
    if (_value.detailCoachPaneTrip == null) {
      return null;
    }

    return $DetailCoachPaneTripDataCopyWith<$Res>(_value.detailCoachPaneTrip!,
        (value) {
      return _then(_value.copyWith(detailCoachPaneTrip: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DetailTripStateImplCopyWith<$Res>
    implements $DetailTripStateCopyWith<$Res> {
  factory _$$DetailTripStateImplCopyWith(_$DetailTripStateImpl value,
          $Res Function(_$DetailTripStateImpl) then) =
      __$$DetailTripStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DetailCoachPaneTripData? detailCoachPaneTrip,
      bool isLoadingTrips,
      String? tripError});

  @override
  $DetailCoachPaneTripDataCopyWith<$Res>? get detailCoachPaneTrip;
}

/// @nodoc
class __$$DetailTripStateImplCopyWithImpl<$Res>
    extends _$DetailTripStateCopyWithImpl<$Res, _$DetailTripStateImpl>
    implements _$$DetailTripStateImplCopyWith<$Res> {
  __$$DetailTripStateImplCopyWithImpl(
      _$DetailTripStateImpl _value, $Res Function(_$DetailTripStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DetailTripState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? detailCoachPaneTrip = freezed,
    Object? isLoadingTrips = null,
    Object? tripError = freezed,
  }) {
    return _then(_$DetailTripStateImpl(
      detailCoachPaneTrip: freezed == detailCoachPaneTrip
          ? _value.detailCoachPaneTrip
          : detailCoachPaneTrip // ignore: cast_nullable_to_non_nullable
              as DetailCoachPaneTripData?,
      isLoadingTrips: null == isLoadingTrips
          ? _value.isLoadingTrips
          : isLoadingTrips // ignore: cast_nullable_to_non_nullable
              as bool,
      tripError: freezed == tripError
          ? _value.tripError
          : tripError // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$DetailTripStateImpl implements _DetailTripState {
  const _$DetailTripStateImpl(
      {this.detailCoachPaneTrip, this.isLoadingTrips = false, this.tripError});

  @override
  final DetailCoachPaneTripData? detailCoachPaneTrip;
  @override
  @JsonKey()
  final bool isLoadingTrips;
  @override
  final String? tripError;

  @override
  String toString() {
    return 'DetailTripState(detailCoachPaneTrip: $detailCoachPaneTrip, isLoadingTrips: $isLoadingTrips, tripError: $tripError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailTripStateImpl &&
            (identical(other.detailCoachPaneTrip, detailCoachPaneTrip) ||
                other.detailCoachPaneTrip == detailCoachPaneTrip) &&
            (identical(other.isLoadingTrips, isLoadingTrips) ||
                other.isLoadingTrips == isLoadingTrips) &&
            (identical(other.tripError, tripError) ||
                other.tripError == tripError));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, detailCoachPaneTrip, isLoadingTrips, tripError);

  /// Create a copy of DetailTripState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailTripStateImplCopyWith<_$DetailTripStateImpl> get copyWith =>
      __$$DetailTripStateImplCopyWithImpl<_$DetailTripStateImpl>(
          this, _$identity);
}

abstract class _DetailTripState implements DetailTripState {
  const factory _DetailTripState(
      {final DetailCoachPaneTripData? detailCoachPaneTrip,
      final bool isLoadingTrips,
      final String? tripError}) = _$DetailTripStateImpl;

  @override
  DetailCoachPaneTripData? get detailCoachPaneTrip;
  @override
  bool get isLoadingTrips;
  @override
  String? get tripError;

  /// Create a copy of DetailTripState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetailTripStateImplCopyWith<_$DetailTripStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
