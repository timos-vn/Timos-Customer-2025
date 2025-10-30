// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GroupListRequest _$GroupListRequestFromJson(Map<String, dynamic> json) {
  return _GroupListRequest.fromJson(json);
}

/// @nodoc
mixin _$GroupListRequest {
  String get ngayChay => throw _privateConstructorUsedError;

  /// Serializes this GroupListRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GroupListRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GroupListRequestCopyWith<GroupListRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupListRequestCopyWith<$Res> {
  factory $GroupListRequestCopyWith(
          GroupListRequest value, $Res Function(GroupListRequest) then) =
      _$GroupListRequestCopyWithImpl<$Res, GroupListRequest>;
  @useResult
  $Res call({String ngayChay});
}

/// @nodoc
class _$GroupListRequestCopyWithImpl<$Res, $Val extends GroupListRequest>
    implements $GroupListRequestCopyWith<$Res> {
  _$GroupListRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GroupListRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ngayChay = null,
  }) {
    return _then(_value.copyWith(
      ngayChay: null == ngayChay
          ? _value.ngayChay
          : ngayChay // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GroupListRequestImplCopyWith<$Res>
    implements $GroupListRequestCopyWith<$Res> {
  factory _$$GroupListRequestImplCopyWith(_$GroupListRequestImpl value,
          $Res Function(_$GroupListRequestImpl) then) =
      __$$GroupListRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String ngayChay});
}

/// @nodoc
class __$$GroupListRequestImplCopyWithImpl<$Res>
    extends _$GroupListRequestCopyWithImpl<$Res, _$GroupListRequestImpl>
    implements _$$GroupListRequestImplCopyWith<$Res> {
  __$$GroupListRequestImplCopyWithImpl(_$GroupListRequestImpl _value,
      $Res Function(_$GroupListRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroupListRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ngayChay = null,
  }) {
    return _then(_$GroupListRequestImpl(
      ngayChay: null == ngayChay
          ? _value.ngayChay
          : ngayChay // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GroupListRequestImpl implements _GroupListRequest {
  const _$GroupListRequestImpl({required this.ngayChay});

  factory _$GroupListRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroupListRequestImplFromJson(json);

  @override
  final String ngayChay;

  @override
  String toString() {
    return 'GroupListRequest(ngayChay: $ngayChay)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupListRequestImpl &&
            (identical(other.ngayChay, ngayChay) ||
                other.ngayChay == ngayChay));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, ngayChay);

  /// Create a copy of GroupListRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupListRequestImplCopyWith<_$GroupListRequestImpl> get copyWith =>
      __$$GroupListRequestImplCopyWithImpl<_$GroupListRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GroupListRequestImplToJson(
      this,
    );
  }
}

abstract class _GroupListRequest implements GroupListRequest {
  const factory _GroupListRequest({required final String ngayChay}) =
      _$GroupListRequestImpl;

  factory _GroupListRequest.fromJson(Map<String, dynamic> json) =
      _$GroupListRequestImpl.fromJson;

  @override
  String get ngayChay;

  /// Create a copy of GroupListRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupListRequestImplCopyWith<_$GroupListRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
