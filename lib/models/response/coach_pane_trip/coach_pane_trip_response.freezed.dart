// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coach_pane_trip_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CoachPaneTripResponse _$CoachPaneTripResponseFromJson(
    Map<String, dynamic> json) {
  return _CoachPaneTripResponse.fromJson(json);
}

/// @nodoc
mixin _$CoachPaneTripResponse {
  List<CoachPaneTripItem>? get data => throw _privateConstructorUsedError;
  int get statusCode => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  /// Serializes this CoachPaneTripResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CoachPaneTripResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CoachPaneTripResponseCopyWith<CoachPaneTripResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoachPaneTripResponseCopyWith<$Res> {
  factory $CoachPaneTripResponseCopyWith(CoachPaneTripResponse value,
          $Res Function(CoachPaneTripResponse) then) =
      _$CoachPaneTripResponseCopyWithImpl<$Res, CoachPaneTripResponse>;
  @useResult
  $Res call({List<CoachPaneTripItem>? data, int statusCode, String? message});
}

/// @nodoc
class _$CoachPaneTripResponseCopyWithImpl<$Res,
        $Val extends CoachPaneTripResponse>
    implements $CoachPaneTripResponseCopyWith<$Res> {
  _$CoachPaneTripResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CoachPaneTripResponse
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
              as List<CoachPaneTripItem>?,
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
abstract class _$$CoachPaneTripResponseImplCopyWith<$Res>
    implements $CoachPaneTripResponseCopyWith<$Res> {
  factory _$$CoachPaneTripResponseImplCopyWith(
          _$CoachPaneTripResponseImpl value,
          $Res Function(_$CoachPaneTripResponseImpl) then) =
      __$$CoachPaneTripResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CoachPaneTripItem>? data, int statusCode, String? message});
}

/// @nodoc
class __$$CoachPaneTripResponseImplCopyWithImpl<$Res>
    extends _$CoachPaneTripResponseCopyWithImpl<$Res,
        _$CoachPaneTripResponseImpl>
    implements _$$CoachPaneTripResponseImplCopyWith<$Res> {
  __$$CoachPaneTripResponseImplCopyWithImpl(_$CoachPaneTripResponseImpl _value,
      $Res Function(_$CoachPaneTripResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of CoachPaneTripResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? statusCode = null,
    Object? message = freezed,
  }) {
    return _then(_$CoachPaneTripResponseImpl(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<CoachPaneTripItem>?,
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
class _$CoachPaneTripResponseImpl implements _CoachPaneTripResponse {
  const _$CoachPaneTripResponseImpl(
      {final List<CoachPaneTripItem>? data, this.statusCode = 0, this.message})
      : _data = data;

  factory _$CoachPaneTripResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CoachPaneTripResponseImplFromJson(json);

  final List<CoachPaneTripItem>? _data;
  @override
  List<CoachPaneTripItem>? get data {
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
    return 'CoachPaneTripResponse(data: $data, statusCode: $statusCode, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoachPaneTripResponseImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_data), statusCode, message);

  /// Create a copy of CoachPaneTripResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CoachPaneTripResponseImplCopyWith<_$CoachPaneTripResponseImpl>
      get copyWith => __$$CoachPaneTripResponseImplCopyWithImpl<
          _$CoachPaneTripResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CoachPaneTripResponseImplToJson(
      this,
    );
  }
}

abstract class _CoachPaneTripResponse implements CoachPaneTripResponse {
  const factory _CoachPaneTripResponse(
      {final List<CoachPaneTripItem>? data,
      final int statusCode,
      final String? message}) = _$CoachPaneTripResponseImpl;

  factory _CoachPaneTripResponse.fromJson(Map<String, dynamic> json) =
      _$CoachPaneTripResponseImpl.fromJson;

  @override
  List<CoachPaneTripItem>? get data;
  @override
  int get statusCode;
  @override
  String? get message;

  /// Create a copy of CoachPaneTripResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CoachPaneTripResponseImplCopyWith<_$CoachPaneTripResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CoachPaneTripItem _$CoachPaneTripItemFromJson(Map<String, dynamic> json) {
  return _CoachPaneTripItem.fromJson(json);
}

/// @nodoc
mixin _$CoachPaneTripItem {
  String get id => throw _privateConstructorUsedError;
  int get idNhaXe => throw _privateConstructorUsedError;
  String get tenNhaXe => throw _privateConstructorUsedError;
  int get idTuyenDuong => throw _privateConstructorUsedError;
  String get tenTuyenDuong => throw _privateConstructorUsedError;
  String? get ngayChay => throw _privateConstructorUsedError;
  String? get gioDi => throw _privateConstructorUsedError;
  int get idLoaiXe => throw _privateConstructorUsedError;
  String get tenLoaiXe => throw _privateConstructorUsedError;
  int get idXe => throw _privateConstructorUsedError;
  String get bienSoXe => throw _privateConstructorUsedError;
  String? get idTaiXe => throw _privateConstructorUsedError;
  String get tenTaiXe => throw _privateConstructorUsedError;
  String? get idPhuXe => throw _privateConstructorUsedError;
  String get tenPhuXe => throw _privateConstructorUsedError;
  int get soGheDaDat => throw _privateConstructorUsedError;
  int get tongSoGhe => throw _privateConstructorUsedError;
  int get trangThai => throw _privateConstructorUsedError;
  String get tenTrangThai => throw _privateConstructorUsedError;
  String? get ngayTao => throw _privateConstructorUsedError;
  String? get nguoiTao => throw _privateConstructorUsedError;

  /// Serializes this CoachPaneTripItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CoachPaneTripItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CoachPaneTripItemCopyWith<CoachPaneTripItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoachPaneTripItemCopyWith<$Res> {
  factory $CoachPaneTripItemCopyWith(
          CoachPaneTripItem value, $Res Function(CoachPaneTripItem) then) =
      _$CoachPaneTripItemCopyWithImpl<$Res, CoachPaneTripItem>;
  @useResult
  $Res call(
      {String id,
      int idNhaXe,
      String tenNhaXe,
      int idTuyenDuong,
      String tenTuyenDuong,
      String? ngayChay,
      String? gioDi,
      int idLoaiXe,
      String tenLoaiXe,
      int idXe,
      String bienSoXe,
      String? idTaiXe,
      String tenTaiXe,
      String? idPhuXe,
      String tenPhuXe,
      int soGheDaDat,
      int tongSoGhe,
      int trangThai,
      String tenTrangThai,
      String? ngayTao,
      String? nguoiTao});
}

/// @nodoc
class _$CoachPaneTripItemCopyWithImpl<$Res, $Val extends CoachPaneTripItem>
    implements $CoachPaneTripItemCopyWith<$Res> {
  _$CoachPaneTripItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CoachPaneTripItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? idNhaXe = null,
    Object? tenNhaXe = null,
    Object? idTuyenDuong = null,
    Object? tenTuyenDuong = null,
    Object? ngayChay = freezed,
    Object? gioDi = freezed,
    Object? idLoaiXe = null,
    Object? tenLoaiXe = null,
    Object? idXe = null,
    Object? bienSoXe = null,
    Object? idTaiXe = freezed,
    Object? tenTaiXe = null,
    Object? idPhuXe = freezed,
    Object? tenPhuXe = null,
    Object? soGheDaDat = null,
    Object? tongSoGhe = null,
    Object? trangThai = null,
    Object? tenTrangThai = null,
    Object? ngayTao = freezed,
    Object? nguoiTao = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      idNhaXe: null == idNhaXe
          ? _value.idNhaXe
          : idNhaXe // ignore: cast_nullable_to_non_nullable
              as int,
      tenNhaXe: null == tenNhaXe
          ? _value.tenNhaXe
          : tenNhaXe // ignore: cast_nullable_to_non_nullable
              as String,
      idTuyenDuong: null == idTuyenDuong
          ? _value.idTuyenDuong
          : idTuyenDuong // ignore: cast_nullable_to_non_nullable
              as int,
      tenTuyenDuong: null == tenTuyenDuong
          ? _value.tenTuyenDuong
          : tenTuyenDuong // ignore: cast_nullable_to_non_nullable
              as String,
      ngayChay: freezed == ngayChay
          ? _value.ngayChay
          : ngayChay // ignore: cast_nullable_to_non_nullable
              as String?,
      gioDi: freezed == gioDi
          ? _value.gioDi
          : gioDi // ignore: cast_nullable_to_non_nullable
              as String?,
      idLoaiXe: null == idLoaiXe
          ? _value.idLoaiXe
          : idLoaiXe // ignore: cast_nullable_to_non_nullable
              as int,
      tenLoaiXe: null == tenLoaiXe
          ? _value.tenLoaiXe
          : tenLoaiXe // ignore: cast_nullable_to_non_nullable
              as String,
      idXe: null == idXe
          ? _value.idXe
          : idXe // ignore: cast_nullable_to_non_nullable
              as int,
      bienSoXe: null == bienSoXe
          ? _value.bienSoXe
          : bienSoXe // ignore: cast_nullable_to_non_nullable
              as String,
      idTaiXe: freezed == idTaiXe
          ? _value.idTaiXe
          : idTaiXe // ignore: cast_nullable_to_non_nullable
              as String?,
      tenTaiXe: null == tenTaiXe
          ? _value.tenTaiXe
          : tenTaiXe // ignore: cast_nullable_to_non_nullable
              as String,
      idPhuXe: freezed == idPhuXe
          ? _value.idPhuXe
          : idPhuXe // ignore: cast_nullable_to_non_nullable
              as String?,
      tenPhuXe: null == tenPhuXe
          ? _value.tenPhuXe
          : tenPhuXe // ignore: cast_nullable_to_non_nullable
              as String,
      soGheDaDat: null == soGheDaDat
          ? _value.soGheDaDat
          : soGheDaDat // ignore: cast_nullable_to_non_nullable
              as int,
      tongSoGhe: null == tongSoGhe
          ? _value.tongSoGhe
          : tongSoGhe // ignore: cast_nullable_to_non_nullable
              as int,
      trangThai: null == trangThai
          ? _value.trangThai
          : trangThai // ignore: cast_nullable_to_non_nullable
              as int,
      tenTrangThai: null == tenTrangThai
          ? _value.tenTrangThai
          : tenTrangThai // ignore: cast_nullable_to_non_nullable
              as String,
      ngayTao: freezed == ngayTao
          ? _value.ngayTao
          : ngayTao // ignore: cast_nullable_to_non_nullable
              as String?,
      nguoiTao: freezed == nguoiTao
          ? _value.nguoiTao
          : nguoiTao // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CoachPaneTripItemImplCopyWith<$Res>
    implements $CoachPaneTripItemCopyWith<$Res> {
  factory _$$CoachPaneTripItemImplCopyWith(_$CoachPaneTripItemImpl value,
          $Res Function(_$CoachPaneTripItemImpl) then) =
      __$$CoachPaneTripItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      int idNhaXe,
      String tenNhaXe,
      int idTuyenDuong,
      String tenTuyenDuong,
      String? ngayChay,
      String? gioDi,
      int idLoaiXe,
      String tenLoaiXe,
      int idXe,
      String bienSoXe,
      String? idTaiXe,
      String tenTaiXe,
      String? idPhuXe,
      String tenPhuXe,
      int soGheDaDat,
      int tongSoGhe,
      int trangThai,
      String tenTrangThai,
      String? ngayTao,
      String? nguoiTao});
}

/// @nodoc
class __$$CoachPaneTripItemImplCopyWithImpl<$Res>
    extends _$CoachPaneTripItemCopyWithImpl<$Res, _$CoachPaneTripItemImpl>
    implements _$$CoachPaneTripItemImplCopyWith<$Res> {
  __$$CoachPaneTripItemImplCopyWithImpl(_$CoachPaneTripItemImpl _value,
      $Res Function(_$CoachPaneTripItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of CoachPaneTripItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? idNhaXe = null,
    Object? tenNhaXe = null,
    Object? idTuyenDuong = null,
    Object? tenTuyenDuong = null,
    Object? ngayChay = freezed,
    Object? gioDi = freezed,
    Object? idLoaiXe = null,
    Object? tenLoaiXe = null,
    Object? idXe = null,
    Object? bienSoXe = null,
    Object? idTaiXe = freezed,
    Object? tenTaiXe = null,
    Object? idPhuXe = freezed,
    Object? tenPhuXe = null,
    Object? soGheDaDat = null,
    Object? tongSoGhe = null,
    Object? trangThai = null,
    Object? tenTrangThai = null,
    Object? ngayTao = freezed,
    Object? nguoiTao = freezed,
  }) {
    return _then(_$CoachPaneTripItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      idNhaXe: null == idNhaXe
          ? _value.idNhaXe
          : idNhaXe // ignore: cast_nullable_to_non_nullable
              as int,
      tenNhaXe: null == tenNhaXe
          ? _value.tenNhaXe
          : tenNhaXe // ignore: cast_nullable_to_non_nullable
              as String,
      idTuyenDuong: null == idTuyenDuong
          ? _value.idTuyenDuong
          : idTuyenDuong // ignore: cast_nullable_to_non_nullable
              as int,
      tenTuyenDuong: null == tenTuyenDuong
          ? _value.tenTuyenDuong
          : tenTuyenDuong // ignore: cast_nullable_to_non_nullable
              as String,
      ngayChay: freezed == ngayChay
          ? _value.ngayChay
          : ngayChay // ignore: cast_nullable_to_non_nullable
              as String?,
      gioDi: freezed == gioDi
          ? _value.gioDi
          : gioDi // ignore: cast_nullable_to_non_nullable
              as String?,
      idLoaiXe: null == idLoaiXe
          ? _value.idLoaiXe
          : idLoaiXe // ignore: cast_nullable_to_non_nullable
              as int,
      tenLoaiXe: null == tenLoaiXe
          ? _value.tenLoaiXe
          : tenLoaiXe // ignore: cast_nullable_to_non_nullable
              as String,
      idXe: null == idXe
          ? _value.idXe
          : idXe // ignore: cast_nullable_to_non_nullable
              as int,
      bienSoXe: null == bienSoXe
          ? _value.bienSoXe
          : bienSoXe // ignore: cast_nullable_to_non_nullable
              as String,
      idTaiXe: freezed == idTaiXe
          ? _value.idTaiXe
          : idTaiXe // ignore: cast_nullable_to_non_nullable
              as String?,
      tenTaiXe: null == tenTaiXe
          ? _value.tenTaiXe
          : tenTaiXe // ignore: cast_nullable_to_non_nullable
              as String,
      idPhuXe: freezed == idPhuXe
          ? _value.idPhuXe
          : idPhuXe // ignore: cast_nullable_to_non_nullable
              as String?,
      tenPhuXe: null == tenPhuXe
          ? _value.tenPhuXe
          : tenPhuXe // ignore: cast_nullable_to_non_nullable
              as String,
      soGheDaDat: null == soGheDaDat
          ? _value.soGheDaDat
          : soGheDaDat // ignore: cast_nullable_to_non_nullable
              as int,
      tongSoGhe: null == tongSoGhe
          ? _value.tongSoGhe
          : tongSoGhe // ignore: cast_nullable_to_non_nullable
              as int,
      trangThai: null == trangThai
          ? _value.trangThai
          : trangThai // ignore: cast_nullable_to_non_nullable
              as int,
      tenTrangThai: null == tenTrangThai
          ? _value.tenTrangThai
          : tenTrangThai // ignore: cast_nullable_to_non_nullable
              as String,
      ngayTao: freezed == ngayTao
          ? _value.ngayTao
          : ngayTao // ignore: cast_nullable_to_non_nullable
              as String?,
      nguoiTao: freezed == nguoiTao
          ? _value.nguoiTao
          : nguoiTao // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CoachPaneTripItemImpl implements _CoachPaneTripItem {
  const _$CoachPaneTripItemImpl(
      {this.id = '',
      this.idNhaXe = 0,
      this.tenNhaXe = '',
      this.idTuyenDuong = 0,
      this.tenTuyenDuong = '',
      this.ngayChay,
      this.gioDi,
      this.idLoaiXe = 0,
      this.tenLoaiXe = '',
      this.idXe = 0,
      this.bienSoXe = '',
      this.idTaiXe,
      this.tenTaiXe = '',
      this.idPhuXe,
      this.tenPhuXe = '',
      this.soGheDaDat = 0,
      this.tongSoGhe = 0,
      this.trangThai = 0,
      this.tenTrangThai = '',
      this.ngayTao,
      this.nguoiTao});

  factory _$CoachPaneTripItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$CoachPaneTripItemImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final int idNhaXe;
  @override
  @JsonKey()
  final String tenNhaXe;
  @override
  @JsonKey()
  final int idTuyenDuong;
  @override
  @JsonKey()
  final String tenTuyenDuong;
  @override
  final String? ngayChay;
  @override
  final String? gioDi;
  @override
  @JsonKey()
  final int idLoaiXe;
  @override
  @JsonKey()
  final String tenLoaiXe;
  @override
  @JsonKey()
  final int idXe;
  @override
  @JsonKey()
  final String bienSoXe;
  @override
  final String? idTaiXe;
  @override
  @JsonKey()
  final String tenTaiXe;
  @override
  final String? idPhuXe;
  @override
  @JsonKey()
  final String tenPhuXe;
  @override
  @JsonKey()
  final int soGheDaDat;
  @override
  @JsonKey()
  final int tongSoGhe;
  @override
  @JsonKey()
  final int trangThai;
  @override
  @JsonKey()
  final String tenTrangThai;
  @override
  final String? ngayTao;
  @override
  final String? nguoiTao;

  @override
  String toString() {
    return 'CoachPaneTripItem(id: $id, idNhaXe: $idNhaXe, tenNhaXe: $tenNhaXe, idTuyenDuong: $idTuyenDuong, tenTuyenDuong: $tenTuyenDuong, ngayChay: $ngayChay, gioDi: $gioDi, idLoaiXe: $idLoaiXe, tenLoaiXe: $tenLoaiXe, idXe: $idXe, bienSoXe: $bienSoXe, idTaiXe: $idTaiXe, tenTaiXe: $tenTaiXe, idPhuXe: $idPhuXe, tenPhuXe: $tenPhuXe, soGheDaDat: $soGheDaDat, tongSoGhe: $tongSoGhe, trangThai: $trangThai, tenTrangThai: $tenTrangThai, ngayTao: $ngayTao, nguoiTao: $nguoiTao)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoachPaneTripItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.idNhaXe, idNhaXe) || other.idNhaXe == idNhaXe) &&
            (identical(other.tenNhaXe, tenNhaXe) ||
                other.tenNhaXe == tenNhaXe) &&
            (identical(other.idTuyenDuong, idTuyenDuong) ||
                other.idTuyenDuong == idTuyenDuong) &&
            (identical(other.tenTuyenDuong, tenTuyenDuong) ||
                other.tenTuyenDuong == tenTuyenDuong) &&
            (identical(other.ngayChay, ngayChay) ||
                other.ngayChay == ngayChay) &&
            (identical(other.gioDi, gioDi) || other.gioDi == gioDi) &&
            (identical(other.idLoaiXe, idLoaiXe) ||
                other.idLoaiXe == idLoaiXe) &&
            (identical(other.tenLoaiXe, tenLoaiXe) ||
                other.tenLoaiXe == tenLoaiXe) &&
            (identical(other.idXe, idXe) || other.idXe == idXe) &&
            (identical(other.bienSoXe, bienSoXe) ||
                other.bienSoXe == bienSoXe) &&
            (identical(other.idTaiXe, idTaiXe) || other.idTaiXe == idTaiXe) &&
            (identical(other.tenTaiXe, tenTaiXe) ||
                other.tenTaiXe == tenTaiXe) &&
            (identical(other.idPhuXe, idPhuXe) || other.idPhuXe == idPhuXe) &&
            (identical(other.tenPhuXe, tenPhuXe) ||
                other.tenPhuXe == tenPhuXe) &&
            (identical(other.soGheDaDat, soGheDaDat) ||
                other.soGheDaDat == soGheDaDat) &&
            (identical(other.tongSoGhe, tongSoGhe) ||
                other.tongSoGhe == tongSoGhe) &&
            (identical(other.trangThai, trangThai) ||
                other.trangThai == trangThai) &&
            (identical(other.tenTrangThai, tenTrangThai) ||
                other.tenTrangThai == tenTrangThai) &&
            (identical(other.ngayTao, ngayTao) || other.ngayTao == ngayTao) &&
            (identical(other.nguoiTao, nguoiTao) ||
                other.nguoiTao == nguoiTao));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        idNhaXe,
        tenNhaXe,
        idTuyenDuong,
        tenTuyenDuong,
        ngayChay,
        gioDi,
        idLoaiXe,
        tenLoaiXe,
        idXe,
        bienSoXe,
        idTaiXe,
        tenTaiXe,
        idPhuXe,
        tenPhuXe,
        soGheDaDat,
        tongSoGhe,
        trangThai,
        tenTrangThai,
        ngayTao,
        nguoiTao
      ]);

  /// Create a copy of CoachPaneTripItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CoachPaneTripItemImplCopyWith<_$CoachPaneTripItemImpl> get copyWith =>
      __$$CoachPaneTripItemImplCopyWithImpl<_$CoachPaneTripItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CoachPaneTripItemImplToJson(
      this,
    );
  }
}

abstract class _CoachPaneTripItem implements CoachPaneTripItem {
  const factory _CoachPaneTripItem(
      {final String id,
      final int idNhaXe,
      final String tenNhaXe,
      final int idTuyenDuong,
      final String tenTuyenDuong,
      final String? ngayChay,
      final String? gioDi,
      final int idLoaiXe,
      final String tenLoaiXe,
      final int idXe,
      final String bienSoXe,
      final String? idTaiXe,
      final String tenTaiXe,
      final String? idPhuXe,
      final String tenPhuXe,
      final int soGheDaDat,
      final int tongSoGhe,
      final int trangThai,
      final String tenTrangThai,
      final String? ngayTao,
      final String? nguoiTao}) = _$CoachPaneTripItemImpl;

  factory _CoachPaneTripItem.fromJson(Map<String, dynamic> json) =
      _$CoachPaneTripItemImpl.fromJson;

  @override
  String get id;
  @override
  int get idNhaXe;
  @override
  String get tenNhaXe;
  @override
  int get idTuyenDuong;
  @override
  String get tenTuyenDuong;
  @override
  String? get ngayChay;
  @override
  String? get gioDi;
  @override
  int get idLoaiXe;
  @override
  String get tenLoaiXe;
  @override
  int get idXe;
  @override
  String get bienSoXe;
  @override
  String? get idTaiXe;
  @override
  String get tenTaiXe;
  @override
  String? get idPhuXe;
  @override
  String get tenPhuXe;
  @override
  int get soGheDaDat;
  @override
  int get tongSoGhe;
  @override
  int get trangThai;
  @override
  String get tenTrangThai;
  @override
  String? get ngayTao;
  @override
  String? get nguoiTao;

  /// Create a copy of CoachPaneTripItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CoachPaneTripItemImplCopyWith<_$CoachPaneTripItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
