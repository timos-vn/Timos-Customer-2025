// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_coach_pane_trip_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DetailCoachPaneTripRequest _$DetailCoachPaneTripRequestFromJson(
    Map<String, dynamic> json) {
  return _DetailCoachPaneTripRequest.fromJson(json);
}

/// @nodoc
mixin _$DetailCoachPaneTripRequest {
  String get idLichXeLimousine => throw _privateConstructorUsedError;

  /// Serializes this DetailCoachPaneTripRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DetailCoachPaneTripRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DetailCoachPaneTripRequestCopyWith<DetailCoachPaneTripRequest>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailCoachPaneTripRequestCopyWith<$Res> {
  factory $DetailCoachPaneTripRequestCopyWith(DetailCoachPaneTripRequest value,
          $Res Function(DetailCoachPaneTripRequest) then) =
      _$DetailCoachPaneTripRequestCopyWithImpl<$Res,
          DetailCoachPaneTripRequest>;
  @useResult
  $Res call({String idLichXeLimousine});
}

/// @nodoc
class _$DetailCoachPaneTripRequestCopyWithImpl<$Res,
        $Val extends DetailCoachPaneTripRequest>
    implements $DetailCoachPaneTripRequestCopyWith<$Res> {
  _$DetailCoachPaneTripRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DetailCoachPaneTripRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idLichXeLimousine = null,
  }) {
    return _then(_value.copyWith(
      idLichXeLimousine: null == idLichXeLimousine
          ? _value.idLichXeLimousine
          : idLichXeLimousine // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetailCoachPaneTripRequestImplCopyWith<$Res>
    implements $DetailCoachPaneTripRequestCopyWith<$Res> {
  factory _$$DetailCoachPaneTripRequestImplCopyWith(
          _$DetailCoachPaneTripRequestImpl value,
          $Res Function(_$DetailCoachPaneTripRequestImpl) then) =
      __$$DetailCoachPaneTripRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String idLichXeLimousine});
}

/// @nodoc
class __$$DetailCoachPaneTripRequestImplCopyWithImpl<$Res>
    extends _$DetailCoachPaneTripRequestCopyWithImpl<$Res,
        _$DetailCoachPaneTripRequestImpl>
    implements _$$DetailCoachPaneTripRequestImplCopyWith<$Res> {
  __$$DetailCoachPaneTripRequestImplCopyWithImpl(
      _$DetailCoachPaneTripRequestImpl _value,
      $Res Function(_$DetailCoachPaneTripRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of DetailCoachPaneTripRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idLichXeLimousine = null,
  }) {
    return _then(_$DetailCoachPaneTripRequestImpl(
      idLichXeLimousine: null == idLichXeLimousine
          ? _value.idLichXeLimousine
          : idLichXeLimousine // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailCoachPaneTripRequestImpl implements _DetailCoachPaneTripRequest {
  const _$DetailCoachPaneTripRequestImpl({required this.idLichXeLimousine});

  factory _$DetailCoachPaneTripRequestImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DetailCoachPaneTripRequestImplFromJson(json);

  @override
  final String idLichXeLimousine;

  @override
  String toString() {
    return 'DetailCoachPaneTripRequest(idLichXeLimousine: $idLichXeLimousine)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailCoachPaneTripRequestImpl &&
            (identical(other.idLichXeLimousine, idLichXeLimousine) ||
                other.idLichXeLimousine == idLichXeLimousine));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, idLichXeLimousine);

  /// Create a copy of DetailCoachPaneTripRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailCoachPaneTripRequestImplCopyWith<_$DetailCoachPaneTripRequestImpl>
      get copyWith => __$$DetailCoachPaneTripRequestImplCopyWithImpl<
          _$DetailCoachPaneTripRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailCoachPaneTripRequestImplToJson(
      this,
    );
  }
}

abstract class _DetailCoachPaneTripRequest
    implements DetailCoachPaneTripRequest {
  const factory _DetailCoachPaneTripRequest(
          {required final String idLichXeLimousine}) =
      _$DetailCoachPaneTripRequestImpl;

  factory _DetailCoachPaneTripRequest.fromJson(Map<String, dynamic> json) =
      _$DetailCoachPaneTripRequestImpl.fromJson;

  @override
  String get idLichXeLimousine;

  /// Create a copy of DetailCoachPaneTripRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetailCoachPaneTripRequestImplCopyWith<_$DetailCoachPaneTripRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
