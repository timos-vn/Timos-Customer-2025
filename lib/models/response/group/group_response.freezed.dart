// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GroupListResponse _$GroupListResponseFromJson(Map<String, dynamic> json) {
  return _GroupListResponse.fromJson(json);
}

/// @nodoc
mixin _$GroupListResponse {
  List<GroupItem>? get data => throw _privateConstructorUsedError;
  int get statusCode => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  /// Serializes this GroupListResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GroupListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GroupListResponseCopyWith<GroupListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupListResponseCopyWith<$Res> {
  factory $GroupListResponseCopyWith(
          GroupListResponse value, $Res Function(GroupListResponse) then) =
      _$GroupListResponseCopyWithImpl<$Res, GroupListResponse>;
  @useResult
  $Res call({List<GroupItem>? data, int statusCode, String? message});
}

/// @nodoc
class _$GroupListResponseCopyWithImpl<$Res, $Val extends GroupListResponse>
    implements $GroupListResponseCopyWith<$Res> {
  _$GroupListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GroupListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? statusCode = null,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<GroupItem>?,
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GroupListResponseImplCopyWith<$Res>
    implements $GroupListResponseCopyWith<$Res> {
  factory _$$GroupListResponseImplCopyWith(_$GroupListResponseImpl value,
          $Res Function(_$GroupListResponseImpl) then) =
      __$$GroupListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<GroupItem>? data, int statusCode, String? message});
}

/// @nodoc
class __$$GroupListResponseImplCopyWithImpl<$Res>
    extends _$GroupListResponseCopyWithImpl<$Res, _$GroupListResponseImpl>
    implements _$$GroupListResponseImplCopyWith<$Res> {
  __$$GroupListResponseImplCopyWithImpl(_$GroupListResponseImpl _value,
      $Res Function(_$GroupListResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroupListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? statusCode = null,
    Object? message = freezed,
  }) {
    return _then(_$GroupListResponseImpl(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<GroupItem>?,
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GroupListResponseImpl implements _GroupListResponse {
  const _$GroupListResponseImpl(
      {final List<GroupItem>? data, this.statusCode = 0, this.message})
      : _data = data;

  factory _$GroupListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroupListResponseImplFromJson(json);

  final List<GroupItem>? _data;
  @override
  List<GroupItem>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final int statusCode;
  @override
  final String? message;

  @override
  String toString() {
    return 'GroupListResponse(data: $data, statusCode: $statusCode, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupListResponseImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_data), statusCode, message);

  /// Create a copy of GroupListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupListResponseImplCopyWith<_$GroupListResponseImpl> get copyWith =>
      __$$GroupListResponseImplCopyWithImpl<_$GroupListResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GroupListResponseImplToJson(
      this,
    );
  }
}

abstract class _GroupListResponse implements GroupListResponse {
  const factory _GroupListResponse(
      {final List<GroupItem>? data,
      final int statusCode,
      final String? message}) = _$GroupListResponseImpl;

  factory _GroupListResponse.fromJson(Map<String, dynamic> json) =
      _$GroupListResponseImpl.fromJson;

  @override
  List<GroupItem>? get data;
  @override
  int get statusCode;
  @override
  String? get message;

  /// Create a copy of GroupListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupListResponseImplCopyWith<_$GroupListResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GroupItem _$GroupItemFromJson(Map<String, dynamic> json) {
  return _GroupItem.fromJson(json);
}

/// @nodoc
mixin _$GroupItem {
  int get idNhom => throw _privateConstructorUsedError;
  String get maNhom => throw _privateConstructorUsedError;
  String get tenNhom => throw _privateConstructorUsedError;
  int get isPublic => throw _privateConstructorUsedError;

  /// Serializes this GroupItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GroupItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GroupItemCopyWith<GroupItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupItemCopyWith<$Res> {
  factory $GroupItemCopyWith(GroupItem value, $Res Function(GroupItem) then) =
      _$GroupItemCopyWithImpl<$Res, GroupItem>;
  @useResult
  $Res call({int idNhom, String maNhom, String tenNhom, int isPublic});
}

/// @nodoc
class _$GroupItemCopyWithImpl<$Res, $Val extends GroupItem>
    implements $GroupItemCopyWith<$Res> {
  _$GroupItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GroupItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idNhom = null,
    Object? maNhom = null,
    Object? tenNhom = null,
    Object? isPublic = null,
  }) {
    return _then(_value.copyWith(
      idNhom: null == idNhom
          ? _value.idNhom
          : idNhom // ignore: cast_nullable_to_non_nullable
              as int,
      maNhom: null == maNhom
          ? _value.maNhom
          : maNhom // ignore: cast_nullable_to_non_nullable
              as String,
      tenNhom: null == tenNhom
          ? _value.tenNhom
          : tenNhom // ignore: cast_nullable_to_non_nullable
              as String,
      isPublic: null == isPublic
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GroupItemImplCopyWith<$Res>
    implements $GroupItemCopyWith<$Res> {
  factory _$$GroupItemImplCopyWith(
          _$GroupItemImpl value, $Res Function(_$GroupItemImpl) then) =
      __$$GroupItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int idNhom, String maNhom, String tenNhom, int isPublic});
}

/// @nodoc
class __$$GroupItemImplCopyWithImpl<$Res>
    extends _$GroupItemCopyWithImpl<$Res, _$GroupItemImpl>
    implements _$$GroupItemImplCopyWith<$Res> {
  __$$GroupItemImplCopyWithImpl(
      _$GroupItemImpl _value, $Res Function(_$GroupItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroupItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idNhom = null,
    Object? maNhom = null,
    Object? tenNhom = null,
    Object? isPublic = null,
  }) {
    return _then(_$GroupItemImpl(
      idNhom: null == idNhom
          ? _value.idNhom
          : idNhom // ignore: cast_nullable_to_non_nullable
              as int,
      maNhom: null == maNhom
          ? _value.maNhom
          : maNhom // ignore: cast_nullable_to_non_nullable
              as String,
      tenNhom: null == tenNhom
          ? _value.tenNhom
          : tenNhom // ignore: cast_nullable_to_non_nullable
              as String,
      isPublic: null == isPublic
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GroupItemImpl implements _GroupItem {
  const _$GroupItemImpl(
      {this.idNhom = 0,
      this.maNhom = '',
      this.tenNhom = '',
      this.isPublic = 0});

  factory _$GroupItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroupItemImplFromJson(json);

  @override
  @JsonKey()
  final int idNhom;
  @override
  @JsonKey()
  final String maNhom;
  @override
  @JsonKey()
  final String tenNhom;
  @override
  @JsonKey()
  final int isPublic;

  @override
  String toString() {
    return 'GroupItem(idNhom: $idNhom, maNhom: $maNhom, tenNhom: $tenNhom, isPublic: $isPublic)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupItemImpl &&
            (identical(other.idNhom, idNhom) || other.idNhom == idNhom) &&
            (identical(other.maNhom, maNhom) || other.maNhom == maNhom) &&
            (identical(other.tenNhom, tenNhom) || other.tenNhom == tenNhom) &&
            (identical(other.isPublic, isPublic) ||
                other.isPublic == isPublic));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, idNhom, maNhom, tenNhom, isPublic);

  /// Create a copy of GroupItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupItemImplCopyWith<_$GroupItemImpl> get copyWith =>
      __$$GroupItemImplCopyWithImpl<_$GroupItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GroupItemImplToJson(
      this,
    );
  }
}

abstract class _GroupItem implements GroupItem {
  const factory _GroupItem(
      {final int idNhom,
      final String maNhom,
      final String tenNhom,
      final int isPublic}) = _$GroupItemImpl;

  factory _GroupItem.fromJson(Map<String, dynamic> json) =
      _$GroupItemImpl.fromJson;

  @override
  int get idNhom;
  @override
  String get maNhom;
  @override
  String get tenNhom;
  @override
  int get isPublic;

  /// Create a copy of GroupItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupItemImplCopyWith<_$GroupItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
