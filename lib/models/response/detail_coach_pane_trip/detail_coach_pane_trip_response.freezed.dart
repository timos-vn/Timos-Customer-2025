// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_coach_pane_trip_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DetailCoachPaneTripResponse _$DetailCoachPaneTripResponseFromJson(
    Map<String, dynamic> json) {
  return _DetailCoachPaneTripResponse.fromJson(json);
}

/// @nodoc
mixin _$DetailCoachPaneTripResponse {
  DetailCoachPaneTripData? get data => throw _privateConstructorUsedError;
  int get statusCode => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  /// Serializes this DetailCoachPaneTripResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DetailCoachPaneTripResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DetailCoachPaneTripResponseCopyWith<DetailCoachPaneTripResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailCoachPaneTripResponseCopyWith<$Res> {
  factory $DetailCoachPaneTripResponseCopyWith(
          DetailCoachPaneTripResponse value,
          $Res Function(DetailCoachPaneTripResponse) then) =
      _$DetailCoachPaneTripResponseCopyWithImpl<$Res,
          DetailCoachPaneTripResponse>;
  @useResult
  $Res call({DetailCoachPaneTripData? data, int statusCode, String? message});

  $DetailCoachPaneTripDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$DetailCoachPaneTripResponseCopyWithImpl<$Res,
        $Val extends DetailCoachPaneTripResponse>
    implements $DetailCoachPaneTripResponseCopyWith<$Res> {
  _$DetailCoachPaneTripResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DetailCoachPaneTripResponse
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
              as DetailCoachPaneTripData?,
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

  /// Create a copy of DetailCoachPaneTripResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DetailCoachPaneTripDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $DetailCoachPaneTripDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DetailCoachPaneTripResponseImplCopyWith<$Res>
    implements $DetailCoachPaneTripResponseCopyWith<$Res> {
  factory _$$DetailCoachPaneTripResponseImplCopyWith(
          _$DetailCoachPaneTripResponseImpl value,
          $Res Function(_$DetailCoachPaneTripResponseImpl) then) =
      __$$DetailCoachPaneTripResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DetailCoachPaneTripData? data, int statusCode, String? message});

  @override
  $DetailCoachPaneTripDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$DetailCoachPaneTripResponseImplCopyWithImpl<$Res>
    extends _$DetailCoachPaneTripResponseCopyWithImpl<$Res,
        _$DetailCoachPaneTripResponseImpl>
    implements _$$DetailCoachPaneTripResponseImplCopyWith<$Res> {
  __$$DetailCoachPaneTripResponseImplCopyWithImpl(
      _$DetailCoachPaneTripResponseImpl _value,
      $Res Function(_$DetailCoachPaneTripResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of DetailCoachPaneTripResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? statusCode = null,
    Object? message = freezed,
  }) {
    return _then(_$DetailCoachPaneTripResponseImpl(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DetailCoachPaneTripData?,
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
class _$DetailCoachPaneTripResponseImpl
    implements _DetailCoachPaneTripResponse {
  const _$DetailCoachPaneTripResponseImpl(
      {this.data, this.statusCode = 0, this.message});

  factory _$DetailCoachPaneTripResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DetailCoachPaneTripResponseImplFromJson(json);

  @override
  final DetailCoachPaneTripData? data;
  @override
  @JsonKey()
  final int statusCode;
  @override
  final String? message;

  @override
  String toString() {
    return 'DetailCoachPaneTripResponse(data: $data, statusCode: $statusCode, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailCoachPaneTripResponseImpl &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, data, statusCode, message);

  /// Create a copy of DetailCoachPaneTripResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailCoachPaneTripResponseImplCopyWith<_$DetailCoachPaneTripResponseImpl>
      get copyWith => __$$DetailCoachPaneTripResponseImplCopyWithImpl<
          _$DetailCoachPaneTripResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailCoachPaneTripResponseImplToJson(
      this,
    );
  }
}

abstract class _DetailCoachPaneTripResponse
    implements DetailCoachPaneTripResponse {
  const factory _DetailCoachPaneTripResponse(
      {final DetailCoachPaneTripData? data,
      final int statusCode,
      final String? message}) = _$DetailCoachPaneTripResponseImpl;

  factory _DetailCoachPaneTripResponse.fromJson(Map<String, dynamic> json) =
      _$DetailCoachPaneTripResponseImpl.fromJson;

  @override
  DetailCoachPaneTripData? get data;
  @override
  int get statusCode;
  @override
  String? get message;

  /// Create a copy of DetailCoachPaneTripResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetailCoachPaneTripResponseImplCopyWith<_$DetailCoachPaneTripResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DetailCoachPaneTripData _$DetailCoachPaneTripDataFromJson(
    Map<String, dynamic> json) {
  return _DetailCoachPaneTripData.fromJson(json);
}

/// @nodoc
mixin _$DetailCoachPaneTripData {
  String get idLichXeLimousine => throw _privateConstructorUsedError;
  String get maLimo => throw _privateConstructorUsedError;
  String get bienSoXe => throw _privateConstructorUsedError;
  String? get ngayChay => throw _privateConstructorUsedError;
  String? get gioDi => throw _privateConstructorUsedError;
  String get tenTaiXe => throw _privateConstructorUsedError;
  String get soDienThoaiTaiXe => throw _privateConstructorUsedError;
  int get soGheDaDat => throw _privateConstructorUsedError;
  int get tongSoGhe => throw _privateConstructorUsedError;
  double get tongDoanhThu => throw _privateConstructorUsedError;
  int get soGheDaDatCount => throw _privateConstructorUsedError;
  int get soGheGiuChoCount => throw _privateConstructorUsedError;
  int get soGheTrongCount => throw _privateConstructorUsedError;
  List<DetailTangItem> get danhSachTang => throw _privateConstructorUsedError;
  DetailTangItem? get tangHienTai => throw _privateConstructorUsedError;

  /// Serializes this DetailCoachPaneTripData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DetailCoachPaneTripData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DetailCoachPaneTripDataCopyWith<DetailCoachPaneTripData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailCoachPaneTripDataCopyWith<$Res> {
  factory $DetailCoachPaneTripDataCopyWith(DetailCoachPaneTripData value,
          $Res Function(DetailCoachPaneTripData) then) =
      _$DetailCoachPaneTripDataCopyWithImpl<$Res, DetailCoachPaneTripData>;
  @useResult
  $Res call(
      {String idLichXeLimousine,
      String maLimo,
      String bienSoXe,
      String? ngayChay,
      String? gioDi,
      String tenTaiXe,
      String soDienThoaiTaiXe,
      int soGheDaDat,
      int tongSoGhe,
      double tongDoanhThu,
      int soGheDaDatCount,
      int soGheGiuChoCount,
      int soGheTrongCount,
      List<DetailTangItem> danhSachTang,
      DetailTangItem? tangHienTai});

  $DetailTangItemCopyWith<$Res>? get tangHienTai;
}

/// @nodoc
class _$DetailCoachPaneTripDataCopyWithImpl<$Res,
        $Val extends DetailCoachPaneTripData>
    implements $DetailCoachPaneTripDataCopyWith<$Res> {
  _$DetailCoachPaneTripDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DetailCoachPaneTripData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idLichXeLimousine = null,
    Object? maLimo = null,
    Object? bienSoXe = null,
    Object? ngayChay = freezed,
    Object? gioDi = freezed,
    Object? tenTaiXe = null,
    Object? soDienThoaiTaiXe = null,
    Object? soGheDaDat = null,
    Object? tongSoGhe = null,
    Object? tongDoanhThu = null,
    Object? soGheDaDatCount = null,
    Object? soGheGiuChoCount = null,
    Object? soGheTrongCount = null,
    Object? danhSachTang = null,
    Object? tangHienTai = freezed,
  }) {
    return _then(_value.copyWith(
      idLichXeLimousine: null == idLichXeLimousine
          ? _value.idLichXeLimousine
          : idLichXeLimousine // ignore: cast_nullable_to_non_nullable
              as String,
      maLimo: null == maLimo
          ? _value.maLimo
          : maLimo // ignore: cast_nullable_to_non_nullable
              as String,
      bienSoXe: null == bienSoXe
          ? _value.bienSoXe
          : bienSoXe // ignore: cast_nullable_to_non_nullable
              as String,
      ngayChay: freezed == ngayChay
          ? _value.ngayChay
          : ngayChay // ignore: cast_nullable_to_non_nullable
              as String?,
      gioDi: freezed == gioDi
          ? _value.gioDi
          : gioDi // ignore: cast_nullable_to_non_nullable
              as String?,
      tenTaiXe: null == tenTaiXe
          ? _value.tenTaiXe
          : tenTaiXe // ignore: cast_nullable_to_non_nullable
              as String,
      soDienThoaiTaiXe: null == soDienThoaiTaiXe
          ? _value.soDienThoaiTaiXe
          : soDienThoaiTaiXe // ignore: cast_nullable_to_non_nullable
              as String,
      soGheDaDat: null == soGheDaDat
          ? _value.soGheDaDat
          : soGheDaDat // ignore: cast_nullable_to_non_nullable
              as int,
      tongSoGhe: null == tongSoGhe
          ? _value.tongSoGhe
          : tongSoGhe // ignore: cast_nullable_to_non_nullable
              as int,
      tongDoanhThu: null == tongDoanhThu
          ? _value.tongDoanhThu
          : tongDoanhThu // ignore: cast_nullable_to_non_nullable
              as double,
      soGheDaDatCount: null == soGheDaDatCount
          ? _value.soGheDaDatCount
          : soGheDaDatCount // ignore: cast_nullable_to_non_nullable
              as int,
      soGheGiuChoCount: null == soGheGiuChoCount
          ? _value.soGheGiuChoCount
          : soGheGiuChoCount // ignore: cast_nullable_to_non_nullable
              as int,
      soGheTrongCount: null == soGheTrongCount
          ? _value.soGheTrongCount
          : soGheTrongCount // ignore: cast_nullable_to_non_nullable
              as int,
      danhSachTang: null == danhSachTang
          ? _value.danhSachTang
          : danhSachTang // ignore: cast_nullable_to_non_nullable
              as List<DetailTangItem>,
      tangHienTai: freezed == tangHienTai
          ? _value.tangHienTai
          : tangHienTai // ignore: cast_nullable_to_non_nullable
              as DetailTangItem?,
    ) as $Val);
  }

  /// Create a copy of DetailCoachPaneTripData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DetailTangItemCopyWith<$Res>? get tangHienTai {
    if (_value.tangHienTai == null) {
      return null;
    }

    return $DetailTangItemCopyWith<$Res>(_value.tangHienTai!, (value) {
      return _then(_value.copyWith(tangHienTai: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DetailCoachPaneTripDataImplCopyWith<$Res>
    implements $DetailCoachPaneTripDataCopyWith<$Res> {
  factory _$$DetailCoachPaneTripDataImplCopyWith(
          _$DetailCoachPaneTripDataImpl value,
          $Res Function(_$DetailCoachPaneTripDataImpl) then) =
      __$$DetailCoachPaneTripDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String idLichXeLimousine,
      String maLimo,
      String bienSoXe,
      String? ngayChay,
      String? gioDi,
      String tenTaiXe,
      String soDienThoaiTaiXe,
      int soGheDaDat,
      int tongSoGhe,
      double tongDoanhThu,
      int soGheDaDatCount,
      int soGheGiuChoCount,
      int soGheTrongCount,
      List<DetailTangItem> danhSachTang,
      DetailTangItem? tangHienTai});

  @override
  $DetailTangItemCopyWith<$Res>? get tangHienTai;
}

/// @nodoc
class __$$DetailCoachPaneTripDataImplCopyWithImpl<$Res>
    extends _$DetailCoachPaneTripDataCopyWithImpl<$Res,
        _$DetailCoachPaneTripDataImpl>
    implements _$$DetailCoachPaneTripDataImplCopyWith<$Res> {
  __$$DetailCoachPaneTripDataImplCopyWithImpl(
      _$DetailCoachPaneTripDataImpl _value,
      $Res Function(_$DetailCoachPaneTripDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of DetailCoachPaneTripData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idLichXeLimousine = null,
    Object? maLimo = null,
    Object? bienSoXe = null,
    Object? ngayChay = freezed,
    Object? gioDi = freezed,
    Object? tenTaiXe = null,
    Object? soDienThoaiTaiXe = null,
    Object? soGheDaDat = null,
    Object? tongSoGhe = null,
    Object? tongDoanhThu = null,
    Object? soGheDaDatCount = null,
    Object? soGheGiuChoCount = null,
    Object? soGheTrongCount = null,
    Object? danhSachTang = null,
    Object? tangHienTai = freezed,
  }) {
    return _then(_$DetailCoachPaneTripDataImpl(
      idLichXeLimousine: null == idLichXeLimousine
          ? _value.idLichXeLimousine
          : idLichXeLimousine // ignore: cast_nullable_to_non_nullable
              as String,
      maLimo: null == maLimo
          ? _value.maLimo
          : maLimo // ignore: cast_nullable_to_non_nullable
              as String,
      bienSoXe: null == bienSoXe
          ? _value.bienSoXe
          : bienSoXe // ignore: cast_nullable_to_non_nullable
              as String,
      ngayChay: freezed == ngayChay
          ? _value.ngayChay
          : ngayChay // ignore: cast_nullable_to_non_nullable
              as String?,
      gioDi: freezed == gioDi
          ? _value.gioDi
          : gioDi // ignore: cast_nullable_to_non_nullable
              as String?,
      tenTaiXe: null == tenTaiXe
          ? _value.tenTaiXe
          : tenTaiXe // ignore: cast_nullable_to_non_nullable
              as String,
      soDienThoaiTaiXe: null == soDienThoaiTaiXe
          ? _value.soDienThoaiTaiXe
          : soDienThoaiTaiXe // ignore: cast_nullable_to_non_nullable
              as String,
      soGheDaDat: null == soGheDaDat
          ? _value.soGheDaDat
          : soGheDaDat // ignore: cast_nullable_to_non_nullable
              as int,
      tongSoGhe: null == tongSoGhe
          ? _value.tongSoGhe
          : tongSoGhe // ignore: cast_nullable_to_non_nullable
              as int,
      tongDoanhThu: null == tongDoanhThu
          ? _value.tongDoanhThu
          : tongDoanhThu // ignore: cast_nullable_to_non_nullable
              as double,
      soGheDaDatCount: null == soGheDaDatCount
          ? _value.soGheDaDatCount
          : soGheDaDatCount // ignore: cast_nullable_to_non_nullable
              as int,
      soGheGiuChoCount: null == soGheGiuChoCount
          ? _value.soGheGiuChoCount
          : soGheGiuChoCount // ignore: cast_nullable_to_non_nullable
              as int,
      soGheTrongCount: null == soGheTrongCount
          ? _value.soGheTrongCount
          : soGheTrongCount // ignore: cast_nullable_to_non_nullable
              as int,
      danhSachTang: null == danhSachTang
          ? _value._danhSachTang
          : danhSachTang // ignore: cast_nullable_to_non_nullable
              as List<DetailTangItem>,
      tangHienTai: freezed == tangHienTai
          ? _value.tangHienTai
          : tangHienTai // ignore: cast_nullable_to_non_nullable
              as DetailTangItem?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailCoachPaneTripDataImpl implements _DetailCoachPaneTripData {
  const _$DetailCoachPaneTripDataImpl(
      {this.idLichXeLimousine = '',
      this.maLimo = '',
      this.bienSoXe = '',
      this.ngayChay,
      this.gioDi,
      this.tenTaiXe = '',
      this.soDienThoaiTaiXe = '',
      this.soGheDaDat = 0,
      this.tongSoGhe = 0,
      this.tongDoanhThu = 0.0,
      this.soGheDaDatCount = 0,
      this.soGheGiuChoCount = 0,
      this.soGheTrongCount = 0,
      final List<DetailTangItem> danhSachTang = const [],
      this.tangHienTai})
      : _danhSachTang = danhSachTang;

  factory _$DetailCoachPaneTripDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailCoachPaneTripDataImplFromJson(json);

  @override
  @JsonKey()
  final String idLichXeLimousine;
  @override
  @JsonKey()
  final String maLimo;
  @override
  @JsonKey()
  final String bienSoXe;
  @override
  final String? ngayChay;
  @override
  final String? gioDi;
  @override
  @JsonKey()
  final String tenTaiXe;
  @override
  @JsonKey()
  final String soDienThoaiTaiXe;
  @override
  @JsonKey()
  final int soGheDaDat;
  @override
  @JsonKey()
  final int tongSoGhe;
  @override
  @JsonKey()
  final double tongDoanhThu;
  @override
  @JsonKey()
  final int soGheDaDatCount;
  @override
  @JsonKey()
  final int soGheGiuChoCount;
  @override
  @JsonKey()
  final int soGheTrongCount;
  final List<DetailTangItem> _danhSachTang;
  @override
  @JsonKey()
  List<DetailTangItem> get danhSachTang {
    if (_danhSachTang is EqualUnmodifiableListView) return _danhSachTang;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_danhSachTang);
  }

  @override
  final DetailTangItem? tangHienTai;

  @override
  String toString() {
    return 'DetailCoachPaneTripData(idLichXeLimousine: $idLichXeLimousine, maLimo: $maLimo, bienSoXe: $bienSoXe, ngayChay: $ngayChay, gioDi: $gioDi, tenTaiXe: $tenTaiXe, soDienThoaiTaiXe: $soDienThoaiTaiXe, soGheDaDat: $soGheDaDat, tongSoGhe: $tongSoGhe, tongDoanhThu: $tongDoanhThu, soGheDaDatCount: $soGheDaDatCount, soGheGiuChoCount: $soGheGiuChoCount, soGheTrongCount: $soGheTrongCount, danhSachTang: $danhSachTang, tangHienTai: $tangHienTai)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailCoachPaneTripDataImpl &&
            (identical(other.idLichXeLimousine, idLichXeLimousine) ||
                other.idLichXeLimousine == idLichXeLimousine) &&
            (identical(other.maLimo, maLimo) || other.maLimo == maLimo) &&
            (identical(other.bienSoXe, bienSoXe) ||
                other.bienSoXe == bienSoXe) &&
            (identical(other.ngayChay, ngayChay) ||
                other.ngayChay == ngayChay) &&
            (identical(other.gioDi, gioDi) || other.gioDi == gioDi) &&
            (identical(other.tenTaiXe, tenTaiXe) ||
                other.tenTaiXe == tenTaiXe) &&
            (identical(other.soDienThoaiTaiXe, soDienThoaiTaiXe) ||
                other.soDienThoaiTaiXe == soDienThoaiTaiXe) &&
            (identical(other.soGheDaDat, soGheDaDat) ||
                other.soGheDaDat == soGheDaDat) &&
            (identical(other.tongSoGhe, tongSoGhe) ||
                other.tongSoGhe == tongSoGhe) &&
            (identical(other.tongDoanhThu, tongDoanhThu) ||
                other.tongDoanhThu == tongDoanhThu) &&
            (identical(other.soGheDaDatCount, soGheDaDatCount) ||
                other.soGheDaDatCount == soGheDaDatCount) &&
            (identical(other.soGheGiuChoCount, soGheGiuChoCount) ||
                other.soGheGiuChoCount == soGheGiuChoCount) &&
            (identical(other.soGheTrongCount, soGheTrongCount) ||
                other.soGheTrongCount == soGheTrongCount) &&
            const DeepCollectionEquality()
                .equals(other._danhSachTang, _danhSachTang) &&
            (identical(other.tangHienTai, tangHienTai) ||
                other.tangHienTai == tangHienTai));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      idLichXeLimousine,
      maLimo,
      bienSoXe,
      ngayChay,
      gioDi,
      tenTaiXe,
      soDienThoaiTaiXe,
      soGheDaDat,
      tongSoGhe,
      tongDoanhThu,
      soGheDaDatCount,
      soGheGiuChoCount,
      soGheTrongCount,
      const DeepCollectionEquality().hash(_danhSachTang),
      tangHienTai);

  /// Create a copy of DetailCoachPaneTripData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailCoachPaneTripDataImplCopyWith<_$DetailCoachPaneTripDataImpl>
      get copyWith => __$$DetailCoachPaneTripDataImplCopyWithImpl<
          _$DetailCoachPaneTripDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailCoachPaneTripDataImplToJson(
      this,
    );
  }
}

abstract class _DetailCoachPaneTripData implements DetailCoachPaneTripData {
  const factory _DetailCoachPaneTripData(
      {final String idLichXeLimousine,
      final String maLimo,
      final String bienSoXe,
      final String? ngayChay,
      final String? gioDi,
      final String tenTaiXe,
      final String soDienThoaiTaiXe,
      final int soGheDaDat,
      final int tongSoGhe,
      final double tongDoanhThu,
      final int soGheDaDatCount,
      final int soGheGiuChoCount,
      final int soGheTrongCount,
      final List<DetailTangItem> danhSachTang,
      final DetailTangItem? tangHienTai}) = _$DetailCoachPaneTripDataImpl;

  factory _DetailCoachPaneTripData.fromJson(Map<String, dynamic> json) =
      _$DetailCoachPaneTripDataImpl.fromJson;

  @override
  String get idLichXeLimousine;
  @override
  String get maLimo;
  @override
  String get bienSoXe;
  @override
  String? get ngayChay;
  @override
  String? get gioDi;
  @override
  String get tenTaiXe;
  @override
  String get soDienThoaiTaiXe;
  @override
  int get soGheDaDat;
  @override
  int get tongSoGhe;
  @override
  double get tongDoanhThu;
  @override
  int get soGheDaDatCount;
  @override
  int get soGheGiuChoCount;
  @override
  int get soGheTrongCount;
  @override
  List<DetailTangItem> get danhSachTang;
  @override
  DetailTangItem? get tangHienTai;

  /// Create a copy of DetailCoachPaneTripData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetailCoachPaneTripDataImplCopyWith<_$DetailCoachPaneTripDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DetailTangItem _$DetailTangItemFromJson(Map<String, dynamic> json) {
  return _DetailTangItem.fromJson(json);
}

/// @nodoc
mixin _$DetailTangItem {
  int get tang => throw _privateConstructorUsedError;
  int get soGheDaDat => throw _privateConstructorUsedError;
  int get soGheGiuCho => throw _privateConstructorUsedError;
  int get soGheTrong => throw _privateConstructorUsedError;
  List<DetailGheItem> get danhSachGhe => throw _privateConstructorUsedError;

  /// Serializes this DetailTangItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DetailTangItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DetailTangItemCopyWith<DetailTangItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailTangItemCopyWith<$Res> {
  factory $DetailTangItemCopyWith(
          DetailTangItem value, $Res Function(DetailTangItem) then) =
      _$DetailTangItemCopyWithImpl<$Res, DetailTangItem>;
  @useResult
  $Res call(
      {int tang,
      int soGheDaDat,
      int soGheGiuCho,
      int soGheTrong,
      List<DetailGheItem> danhSachGhe});
}

/// @nodoc
class _$DetailTangItemCopyWithImpl<$Res, $Val extends DetailTangItem>
    implements $DetailTangItemCopyWith<$Res> {
  _$DetailTangItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DetailTangItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tang = null,
    Object? soGheDaDat = null,
    Object? soGheGiuCho = null,
    Object? soGheTrong = null,
    Object? danhSachGhe = null,
  }) {
    return _then(_value.copyWith(
      tang: null == tang
          ? _value.tang
          : tang // ignore: cast_nullable_to_non_nullable
              as int,
      soGheDaDat: null == soGheDaDat
          ? _value.soGheDaDat
          : soGheDaDat // ignore: cast_nullable_to_non_nullable
              as int,
      soGheGiuCho: null == soGheGiuCho
          ? _value.soGheGiuCho
          : soGheGiuCho // ignore: cast_nullable_to_non_nullable
              as int,
      soGheTrong: null == soGheTrong
          ? _value.soGheTrong
          : soGheTrong // ignore: cast_nullable_to_non_nullable
              as int,
      danhSachGhe: null == danhSachGhe
          ? _value.danhSachGhe
          : danhSachGhe // ignore: cast_nullable_to_non_nullable
              as List<DetailGheItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetailTangItemImplCopyWith<$Res>
    implements $DetailTangItemCopyWith<$Res> {
  factory _$$DetailTangItemImplCopyWith(_$DetailTangItemImpl value,
          $Res Function(_$DetailTangItemImpl) then) =
      __$$DetailTangItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int tang,
      int soGheDaDat,
      int soGheGiuCho,
      int soGheTrong,
      List<DetailGheItem> danhSachGhe});
}

/// @nodoc
class __$$DetailTangItemImplCopyWithImpl<$Res>
    extends _$DetailTangItemCopyWithImpl<$Res, _$DetailTangItemImpl>
    implements _$$DetailTangItemImplCopyWith<$Res> {
  __$$DetailTangItemImplCopyWithImpl(
      _$DetailTangItemImpl _value, $Res Function(_$DetailTangItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of DetailTangItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tang = null,
    Object? soGheDaDat = null,
    Object? soGheGiuCho = null,
    Object? soGheTrong = null,
    Object? danhSachGhe = null,
  }) {
    return _then(_$DetailTangItemImpl(
      tang: null == tang
          ? _value.tang
          : tang // ignore: cast_nullable_to_non_nullable
              as int,
      soGheDaDat: null == soGheDaDat
          ? _value.soGheDaDat
          : soGheDaDat // ignore: cast_nullable_to_non_nullable
              as int,
      soGheGiuCho: null == soGheGiuCho
          ? _value.soGheGiuCho
          : soGheGiuCho // ignore: cast_nullable_to_non_nullable
              as int,
      soGheTrong: null == soGheTrong
          ? _value.soGheTrong
          : soGheTrong // ignore: cast_nullable_to_non_nullable
              as int,
      danhSachGhe: null == danhSachGhe
          ? _value._danhSachGhe
          : danhSachGhe // ignore: cast_nullable_to_non_nullable
              as List<DetailGheItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailTangItemImpl implements _DetailTangItem {
  const _$DetailTangItemImpl(
      {this.tang = 0,
      this.soGheDaDat = 0,
      this.soGheGiuCho = 0,
      this.soGheTrong = 0,
      final List<DetailGheItem> danhSachGhe = const []})
      : _danhSachGhe = danhSachGhe;

  factory _$DetailTangItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailTangItemImplFromJson(json);

  @override
  @JsonKey()
  final int tang;
  @override
  @JsonKey()
  final int soGheDaDat;
  @override
  @JsonKey()
  final int soGheGiuCho;
  @override
  @JsonKey()
  final int soGheTrong;
  final List<DetailGheItem> _danhSachGhe;
  @override
  @JsonKey()
  List<DetailGheItem> get danhSachGhe {
    if (_danhSachGhe is EqualUnmodifiableListView) return _danhSachGhe;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_danhSachGhe);
  }

  @override
  String toString() {
    return 'DetailTangItem(tang: $tang, soGheDaDat: $soGheDaDat, soGheGiuCho: $soGheGiuCho, soGheTrong: $soGheTrong, danhSachGhe: $danhSachGhe)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailTangItemImpl &&
            (identical(other.tang, tang) || other.tang == tang) &&
            (identical(other.soGheDaDat, soGheDaDat) ||
                other.soGheDaDat == soGheDaDat) &&
            (identical(other.soGheGiuCho, soGheGiuCho) ||
                other.soGheGiuCho == soGheGiuCho) &&
            (identical(other.soGheTrong, soGheTrong) ||
                other.soGheTrong == soGheTrong) &&
            const DeepCollectionEquality()
                .equals(other._danhSachGhe, _danhSachGhe));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, tang, soGheDaDat, soGheGiuCho,
      soGheTrong, const DeepCollectionEquality().hash(_danhSachGhe));

  /// Create a copy of DetailTangItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailTangItemImplCopyWith<_$DetailTangItemImpl> get copyWith =>
      __$$DetailTangItemImplCopyWithImpl<_$DetailTangItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailTangItemImplToJson(
      this,
    );
  }
}

abstract class _DetailTangItem implements DetailTangItem {
  const factory _DetailTangItem(
      {final int tang,
      final int soGheDaDat,
      final int soGheGiuCho,
      final int soGheTrong,
      final List<DetailGheItem> danhSachGhe}) = _$DetailTangItemImpl;

  factory _DetailTangItem.fromJson(Map<String, dynamic> json) =
      _$DetailTangItemImpl.fromJson;

  @override
  int get tang;
  @override
  int get soGheDaDat;
  @override
  int get soGheGiuCho;
  @override
  int get soGheTrong;
  @override
  List<DetailGheItem> get danhSachGhe;

  /// Create a copy of DetailTangItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetailTangItemImplCopyWith<_$DetailTangItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DetailGheItem _$DetailGheItemFromJson(Map<String, dynamic> json) {
  return _DetailGheItem.fromJson(json);
}

/// @nodoc
mixin _$DetailGheItem {
  int get idGhe => throw _privateConstructorUsedError;
  String get tenGhe => throw _privateConstructorUsedError;
  int get tang => throw _privateConstructorUsedError;
  int get day => throw _privateConstructorUsedError;
  int get hang => throw _privateConstructorUsedError;
  int get trangThaiGhe => throw _privateConstructorUsedError;
  String get tenTrangThaiGhe => throw _privateConstructorUsedError;
  double get giaVe => throw _privateConstructorUsedError;
  String get mauSac => throw _privateConstructorUsedError;

  /// Serializes this DetailGheItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DetailGheItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DetailGheItemCopyWith<DetailGheItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailGheItemCopyWith<$Res> {
  factory $DetailGheItemCopyWith(
          DetailGheItem value, $Res Function(DetailGheItem) then) =
      _$DetailGheItemCopyWithImpl<$Res, DetailGheItem>;
  @useResult
  $Res call(
      {int idGhe,
      String tenGhe,
      int tang,
      int day,
      int hang,
      int trangThaiGhe,
      String tenTrangThaiGhe,
      double giaVe,
      String mauSac});
}

/// @nodoc
class _$DetailGheItemCopyWithImpl<$Res, $Val extends DetailGheItem>
    implements $DetailGheItemCopyWith<$Res> {
  _$DetailGheItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DetailGheItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idGhe = null,
    Object? tenGhe = null,
    Object? tang = null,
    Object? day = null,
    Object? hang = null,
    Object? trangThaiGhe = null,
    Object? tenTrangThaiGhe = null,
    Object? giaVe = null,
    Object? mauSac = null,
  }) {
    return _then(_value.copyWith(
      idGhe: null == idGhe
          ? _value.idGhe
          : idGhe // ignore: cast_nullable_to_non_nullable
              as int,
      tenGhe: null == tenGhe
          ? _value.tenGhe
          : tenGhe // ignore: cast_nullable_to_non_nullable
              as String,
      tang: null == tang
          ? _value.tang
          : tang // ignore: cast_nullable_to_non_nullable
              as int,
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
      hang: null == hang
          ? _value.hang
          : hang // ignore: cast_nullable_to_non_nullable
              as int,
      trangThaiGhe: null == trangThaiGhe
          ? _value.trangThaiGhe
          : trangThaiGhe // ignore: cast_nullable_to_non_nullable
              as int,
      tenTrangThaiGhe: null == tenTrangThaiGhe
          ? _value.tenTrangThaiGhe
          : tenTrangThaiGhe // ignore: cast_nullable_to_non_nullable
              as String,
      giaVe: null == giaVe
          ? _value.giaVe
          : giaVe // ignore: cast_nullable_to_non_nullable
              as double,
      mauSac: null == mauSac
          ? _value.mauSac
          : mauSac // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetailGheItemImplCopyWith<$Res>
    implements $DetailGheItemCopyWith<$Res> {
  factory _$$DetailGheItemImplCopyWith(
          _$DetailGheItemImpl value, $Res Function(_$DetailGheItemImpl) then) =
      __$$DetailGheItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int idGhe,
      String tenGhe,
      int tang,
      int day,
      int hang,
      int trangThaiGhe,
      String tenTrangThaiGhe,
      double giaVe,
      String mauSac});
}

/// @nodoc
class __$$DetailGheItemImplCopyWithImpl<$Res>
    extends _$DetailGheItemCopyWithImpl<$Res, _$DetailGheItemImpl>
    implements _$$DetailGheItemImplCopyWith<$Res> {
  __$$DetailGheItemImplCopyWithImpl(
      _$DetailGheItemImpl _value, $Res Function(_$DetailGheItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of DetailGheItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idGhe = null,
    Object? tenGhe = null,
    Object? tang = null,
    Object? day = null,
    Object? hang = null,
    Object? trangThaiGhe = null,
    Object? tenTrangThaiGhe = null,
    Object? giaVe = null,
    Object? mauSac = null,
  }) {
    return _then(_$DetailGheItemImpl(
      idGhe: null == idGhe
          ? _value.idGhe
          : idGhe // ignore: cast_nullable_to_non_nullable
              as int,
      tenGhe: null == tenGhe
          ? _value.tenGhe
          : tenGhe // ignore: cast_nullable_to_non_nullable
              as String,
      tang: null == tang
          ? _value.tang
          : tang // ignore: cast_nullable_to_non_nullable
              as int,
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
      hang: null == hang
          ? _value.hang
          : hang // ignore: cast_nullable_to_non_nullable
              as int,
      trangThaiGhe: null == trangThaiGhe
          ? _value.trangThaiGhe
          : trangThaiGhe // ignore: cast_nullable_to_non_nullable
              as int,
      tenTrangThaiGhe: null == tenTrangThaiGhe
          ? _value.tenTrangThaiGhe
          : tenTrangThaiGhe // ignore: cast_nullable_to_non_nullable
              as String,
      giaVe: null == giaVe
          ? _value.giaVe
          : giaVe // ignore: cast_nullable_to_non_nullable
              as double,
      mauSac: null == mauSac
          ? _value.mauSac
          : mauSac // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailGheItemImpl implements _DetailGheItem {
  const _$DetailGheItemImpl(
      {this.idGhe = 0,
      this.tenGhe = '',
      this.tang = 0,
      this.day = 0,
      this.hang = 0,
      this.trangThaiGhe = 0,
      this.tenTrangThaiGhe = '',
      this.giaVe = 0.0,
      this.mauSac = ''});

  factory _$DetailGheItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailGheItemImplFromJson(json);

  @override
  @JsonKey()
  final int idGhe;
  @override
  @JsonKey()
  final String tenGhe;
  @override
  @JsonKey()
  final int tang;
  @override
  @JsonKey()
  final int day;
  @override
  @JsonKey()
  final int hang;
  @override
  @JsonKey()
  final int trangThaiGhe;
  @override
  @JsonKey()
  final String tenTrangThaiGhe;
  @override
  @JsonKey()
  final double giaVe;
  @override
  @JsonKey()
  final String mauSac;

  @override
  String toString() {
    return 'DetailGheItem(idGhe: $idGhe, tenGhe: $tenGhe, tang: $tang, day: $day, hang: $hang, trangThaiGhe: $trangThaiGhe, tenTrangThaiGhe: $tenTrangThaiGhe, giaVe: $giaVe, mauSac: $mauSac)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailGheItemImpl &&
            (identical(other.idGhe, idGhe) || other.idGhe == idGhe) &&
            (identical(other.tenGhe, tenGhe) || other.tenGhe == tenGhe) &&
            (identical(other.tang, tang) || other.tang == tang) &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.hang, hang) || other.hang == hang) &&
            (identical(other.trangThaiGhe, trangThaiGhe) ||
                other.trangThaiGhe == trangThaiGhe) &&
            (identical(other.tenTrangThaiGhe, tenTrangThaiGhe) ||
                other.tenTrangThaiGhe == tenTrangThaiGhe) &&
            (identical(other.giaVe, giaVe) || other.giaVe == giaVe) &&
            (identical(other.mauSac, mauSac) || other.mauSac == mauSac));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, idGhe, tenGhe, tang, day, hang,
      trangThaiGhe, tenTrangThaiGhe, giaVe, mauSac);

  /// Create a copy of DetailGheItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailGheItemImplCopyWith<_$DetailGheItemImpl> get copyWith =>
      __$$DetailGheItemImplCopyWithImpl<_$DetailGheItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailGheItemImplToJson(
      this,
    );
  }
}

abstract class _DetailGheItem implements DetailGheItem {
  const factory _DetailGheItem(
      {final int idGhe,
      final String tenGhe,
      final int tang,
      final int day,
      final int hang,
      final int trangThaiGhe,
      final String tenTrangThaiGhe,
      final double giaVe,
      final String mauSac}) = _$DetailGheItemImpl;

  factory _DetailGheItem.fromJson(Map<String, dynamic> json) =
      _$DetailGheItemImpl.fromJson;

  @override
  int get idGhe;
  @override
  String get tenGhe;
  @override
  int get tang;
  @override
  int get day;
  @override
  int get hang;
  @override
  int get trangThaiGhe;
  @override
  String get tenTrangThaiGhe;
  @override
  double get giaVe;
  @override
  String get mauSac;

  /// Create a copy of DetailGheItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetailGheItemImplCopyWith<_$DetailGheItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
