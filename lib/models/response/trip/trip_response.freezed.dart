// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trip_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TripListResponse _$TripListResponseFromJson(Map<String, dynamic> json) {
  return _TripListResponse.fromJson(json);
}

/// @nodoc
mixin _$TripListResponse {
  int get totalDonKhach => throw _privateConstructorUsedError;
  int get totalTraKhach => throw _privateConstructorUsedError;
  List<TripItem>? get data => throw _privateConstructorUsedError;
  int get statusCode => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  int get pageIndex => throw _privateConstructorUsedError;
  int get pageSize => throw _privateConstructorUsedError;
  int get totalRecords => throw _privateConstructorUsedError;
  int get pageCount => throw _privateConstructorUsedError;

  /// Serializes this TripListResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TripListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TripListResponseCopyWith<TripListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TripListResponseCopyWith<$Res> {
  factory $TripListResponseCopyWith(
          TripListResponse value, $Res Function(TripListResponse) then) =
      _$TripListResponseCopyWithImpl<$Res, TripListResponse>;
  @useResult
  $Res call(
      {int totalDonKhach,
      int totalTraKhach,
      List<TripItem>? data,
      int statusCode,
      String? message,
      int pageIndex,
      int pageSize,
      int totalRecords,
      int pageCount});
}

/// @nodoc
class _$TripListResponseCopyWithImpl<$Res, $Val extends TripListResponse>
    implements $TripListResponseCopyWith<$Res> {
  _$TripListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TripListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalDonKhach = null,
    Object? totalTraKhach = null,
    Object? data = freezed,
    Object? statusCode = null,
    Object? message = freezed,
    Object? pageIndex = null,
    Object? pageSize = null,
    Object? totalRecords = null,
    Object? pageCount = null,
  }) {
    return _then(_value.copyWith(
      totalDonKhach: null == totalDonKhach
          ? _value.totalDonKhach
          : totalDonKhach // ignore: cast_nullable_to_non_nullable
              as int,
      totalTraKhach: null == totalTraKhach
          ? _value.totalTraKhach
          : totalTraKhach // ignore: cast_nullable_to_non_nullable
              as int,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<TripItem>?,
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      pageIndex: null == pageIndex
          ? _value.pageIndex
          : pageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      totalRecords: null == totalRecords
          ? _value.totalRecords
          : totalRecords // ignore: cast_nullable_to_non_nullable
              as int,
      pageCount: null == pageCount
          ? _value.pageCount
          : pageCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TripListResponseImplCopyWith<$Res>
    implements $TripListResponseCopyWith<$Res> {
  factory _$$TripListResponseImplCopyWith(_$TripListResponseImpl value,
          $Res Function(_$TripListResponseImpl) then) =
      __$$TripListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalDonKhach,
      int totalTraKhach,
      List<TripItem>? data,
      int statusCode,
      String? message,
      int pageIndex,
      int pageSize,
      int totalRecords,
      int pageCount});
}

/// @nodoc
class __$$TripListResponseImplCopyWithImpl<$Res>
    extends _$TripListResponseCopyWithImpl<$Res, _$TripListResponseImpl>
    implements _$$TripListResponseImplCopyWith<$Res> {
  __$$TripListResponseImplCopyWithImpl(_$TripListResponseImpl _value,
      $Res Function(_$TripListResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of TripListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalDonKhach = null,
    Object? totalTraKhach = null,
    Object? data = freezed,
    Object? statusCode = null,
    Object? message = freezed,
    Object? pageIndex = null,
    Object? pageSize = null,
    Object? totalRecords = null,
    Object? pageCount = null,
  }) {
    return _then(_$TripListResponseImpl(
      totalDonKhach: null == totalDonKhach
          ? _value.totalDonKhach
          : totalDonKhach // ignore: cast_nullable_to_non_nullable
              as int,
      totalTraKhach: null == totalTraKhach
          ? _value.totalTraKhach
          : totalTraKhach // ignore: cast_nullable_to_non_nullable
              as int,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<TripItem>?,
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      pageIndex: null == pageIndex
          ? _value.pageIndex
          : pageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      totalRecords: null == totalRecords
          ? _value.totalRecords
          : totalRecords // ignore: cast_nullable_to_non_nullable
              as int,
      pageCount: null == pageCount
          ? _value.pageCount
          : pageCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TripListResponseImpl implements _TripListResponse {
  const _$TripListResponseImpl(
      {this.totalDonKhach = 0,
      this.totalTraKhach = 0,
      final List<TripItem>? data,
      this.statusCode = 0,
      this.message,
      this.pageIndex = 0,
      this.pageSize = 0,
      this.totalRecords = 0,
      this.pageCount = 0})
      : _data = data;

  factory _$TripListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TripListResponseImplFromJson(json);

  @override
  @JsonKey()
  final int totalDonKhach;
  @override
  @JsonKey()
  final int totalTraKhach;
  final List<TripItem>? _data;
  @override
  List<TripItem>? get data {
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
  @JsonKey()
  final int pageIndex;
  @override
  @JsonKey()
  final int pageSize;
  @override
  @JsonKey()
  final int totalRecords;
  @override
  @JsonKey()
  final int pageCount;

  @override
  String toString() {
    return 'TripListResponse(totalDonKhach: $totalDonKhach, totalTraKhach: $totalTraKhach, data: $data, statusCode: $statusCode, message: $message, pageIndex: $pageIndex, pageSize: $pageSize, totalRecords: $totalRecords, pageCount: $pageCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TripListResponseImpl &&
            (identical(other.totalDonKhach, totalDonKhach) ||
                other.totalDonKhach == totalDonKhach) &&
            (identical(other.totalTraKhach, totalTraKhach) ||
                other.totalTraKhach == totalTraKhach) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.pageIndex, pageIndex) ||
                other.pageIndex == pageIndex) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.totalRecords, totalRecords) ||
                other.totalRecords == totalRecords) &&
            (identical(other.pageCount, pageCount) ||
                other.pageCount == pageCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalDonKhach,
      totalTraKhach,
      const DeepCollectionEquality().hash(_data),
      statusCode,
      message,
      pageIndex,
      pageSize,
      totalRecords,
      pageCount);

  /// Create a copy of TripListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TripListResponseImplCopyWith<_$TripListResponseImpl> get copyWith =>
      __$$TripListResponseImplCopyWithImpl<_$TripListResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TripListResponseImplToJson(
      this,
    );
  }
}

abstract class _TripListResponse implements TripListResponse {
  const factory _TripListResponse(
      {final int totalDonKhach,
      final int totalTraKhach,
      final List<TripItem>? data,
      final int statusCode,
      final String? message,
      final int pageIndex,
      final int pageSize,
      final int totalRecords,
      final int pageCount}) = _$TripListResponseImpl;

  factory _TripListResponse.fromJson(Map<String, dynamic> json) =
      _$TripListResponseImpl.fromJson;

  @override
  int get totalDonKhach;
  @override
  int get totalTraKhach;
  @override
  List<TripItem>? get data;
  @override
  int get statusCode;
  @override
  String? get message;
  @override
  int get pageIndex;
  @override
  int get pageSize;
  @override
  int get totalRecords;
  @override
  int get pageCount;

  /// Create a copy of TripListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TripListResponseImplCopyWith<_$TripListResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TripItem _$TripItemFromJson(Map<String, dynamic> json) {
  return _TripItem.fromJson(json);
}

/// @nodoc
mixin _$TripItem {
  String get idDatVe => throw _privateConstructorUsedError;
  String get idYeuCauDatVe => throw _privateConstructorUsedError;
  String get idTaiXeTC => throw _privateConstructorUsedError;
  String get maVe => throw _privateConstructorUsedError;
  String get idDatVeTotal => throw _privateConstructorUsedError;
  String get soGhe => throw _privateConstructorUsedError;
  String? get hoTenTaiXeTrungChuyen => throw _privateConstructorUsedError;
  String? get dienThoaiTaiXeTrungChuyen => throw _privateConstructorUsedError;
  String? get tenXeTrungChuyen => throw _privateConstructorUsedError;
  String? get bienSoXeTrungChuyen => throw _privateConstructorUsedError;
  String get tenKhachHang => throw _privateConstructorUsedError;
  String get soDienThoaiKhach => throw _privateConstructorUsedError;
  String get diaChiKhachDi => throw _privateConstructorUsedError;
  String? get toaDoDiaChiKhachDi => throw _privateConstructorUsedError;
  String get diaChiKhachDen => throw _privateConstructorUsedError;
  String? get toaDoDiaChiKhachDen => throw _privateConstructorUsedError;
  String? get diaChiLimoDi => throw _privateConstructorUsedError;
  String? get toaDoLimoDi => throw _privateConstructorUsedError;
  String get vanPhongDen => throw _privateConstructorUsedError;
  String get diaChiLimoDen => throw _privateConstructorUsedError;
  String? get toaDoLimoDen => throw _privateConstructorUsedError;
  String? get ghiChu => throw _privateConstructorUsedError;
  String? get ngayChay => throw _privateConstructorUsedError;
  String? get thoiGianDi => throw _privateConstructorUsedError;
  int get idNhaXeLimo => throw _privateConstructorUsedError;
  int get loaiKhach => throw _privateConstructorUsedError;
  String? get khachTrungChuyen => throw _privateConstructorUsedError;
  int get trangThaiVe => throw _privateConstructorUsedError;
  int get trangThaiTC => throw _privateConstructorUsedError;
  int get daThanhToan => throw _privateConstructorUsedError;
  double get tienVe => throw _privateConstructorUsedError;
  double get chietKhau => throw _privateConstructorUsedError;
  double get soTienCoc => throw _privateConstructorUsedError;
  String? get hoTenKhachDatHo => throw _privateConstructorUsedError;
  String? get soDienThoaiKhachDatHo => throw _privateConstructorUsedError;
  String? get tenNhom => throw _privateConstructorUsedError;
  int get diemBanVe => throw _privateConstructorUsedError;
  int get diemQuanLy => throw _privateConstructorUsedError;
  int get soKhach => throw _privateConstructorUsedError;
  String? get tenHinhThuc => throw _privateConstructorUsedError;
  String? get ngayChayList => throw _privateConstructorUsedError;
  String? get thoiGianList => throw _privateConstructorUsedError;
  int get idHinhThucDiChuyen => throw _privateConstructorUsedError;
  String? get loaVe => throw _privateConstructorUsedError;
  String? get hoTenTaiXe => throw _privateConstructorUsedError;
  String? get dienThoaiTaiXe => throw _privateConstructorUsedError;
  String? get nguoiTao => throw _privateConstructorUsedError;
  int get khuHoiYn => throw _privateConstructorUsedError;

  /// Serializes this TripItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TripItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TripItemCopyWith<TripItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TripItemCopyWith<$Res> {
  factory $TripItemCopyWith(TripItem value, $Res Function(TripItem) then) =
      _$TripItemCopyWithImpl<$Res, TripItem>;
  @useResult
  $Res call(
      {String idDatVe,
      String idYeuCauDatVe,
      String idTaiXeTC,
      String maVe,
      String idDatVeTotal,
      String soGhe,
      String? hoTenTaiXeTrungChuyen,
      String? dienThoaiTaiXeTrungChuyen,
      String? tenXeTrungChuyen,
      String? bienSoXeTrungChuyen,
      String tenKhachHang,
      String soDienThoaiKhach,
      String diaChiKhachDi,
      String? toaDoDiaChiKhachDi,
      String diaChiKhachDen,
      String? toaDoDiaChiKhachDen,
      String? diaChiLimoDi,
      String? toaDoLimoDi,
      String vanPhongDen,
      String diaChiLimoDen,
      String? toaDoLimoDen,
      String? ghiChu,
      String? ngayChay,
      String? thoiGianDi,
      int idNhaXeLimo,
      int loaiKhach,
      String? khachTrungChuyen,
      int trangThaiVe,
      int trangThaiTC,
      int daThanhToan,
      double tienVe,
      double chietKhau,
      double soTienCoc,
      String? hoTenKhachDatHo,
      String? soDienThoaiKhachDatHo,
      String? tenNhom,
      int diemBanVe,
      int diemQuanLy,
      int soKhach,
      String? tenHinhThuc,
      String? ngayChayList,
      String? thoiGianList,
      int idHinhThucDiChuyen,
      String? loaVe,
      String? hoTenTaiXe,
      String? dienThoaiTaiXe,
      String? nguoiTao,
      int khuHoiYn});
}

/// @nodoc
class _$TripItemCopyWithImpl<$Res, $Val extends TripItem>
    implements $TripItemCopyWith<$Res> {
  _$TripItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TripItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idDatVe = null,
    Object? idYeuCauDatVe = null,
    Object? idTaiXeTC = null,
    Object? maVe = null,
    Object? idDatVeTotal = null,
    Object? soGhe = null,
    Object? hoTenTaiXeTrungChuyen = freezed,
    Object? dienThoaiTaiXeTrungChuyen = freezed,
    Object? tenXeTrungChuyen = freezed,
    Object? bienSoXeTrungChuyen = freezed,
    Object? tenKhachHang = null,
    Object? soDienThoaiKhach = null,
    Object? diaChiKhachDi = null,
    Object? toaDoDiaChiKhachDi = freezed,
    Object? diaChiKhachDen = null,
    Object? toaDoDiaChiKhachDen = freezed,
    Object? diaChiLimoDi = freezed,
    Object? toaDoLimoDi = freezed,
    Object? vanPhongDen = null,
    Object? diaChiLimoDen = null,
    Object? toaDoLimoDen = freezed,
    Object? ghiChu = freezed,
    Object? ngayChay = freezed,
    Object? thoiGianDi = freezed,
    Object? idNhaXeLimo = null,
    Object? loaiKhach = null,
    Object? khachTrungChuyen = freezed,
    Object? trangThaiVe = null,
    Object? trangThaiTC = null,
    Object? daThanhToan = null,
    Object? tienVe = null,
    Object? chietKhau = null,
    Object? soTienCoc = null,
    Object? hoTenKhachDatHo = freezed,
    Object? soDienThoaiKhachDatHo = freezed,
    Object? tenNhom = freezed,
    Object? diemBanVe = null,
    Object? diemQuanLy = null,
    Object? soKhach = null,
    Object? tenHinhThuc = freezed,
    Object? ngayChayList = freezed,
    Object? thoiGianList = freezed,
    Object? idHinhThucDiChuyen = null,
    Object? loaVe = freezed,
    Object? hoTenTaiXe = freezed,
    Object? dienThoaiTaiXe = freezed,
    Object? nguoiTao = freezed,
    Object? khuHoiYn = null,
  }) {
    return _then(_value.copyWith(
      idDatVe: null == idDatVe
          ? _value.idDatVe
          : idDatVe // ignore: cast_nullable_to_non_nullable
              as String,
      idYeuCauDatVe: null == idYeuCauDatVe
          ? _value.idYeuCauDatVe
          : idYeuCauDatVe // ignore: cast_nullable_to_non_nullable
              as String,
      idTaiXeTC: null == idTaiXeTC
          ? _value.idTaiXeTC
          : idTaiXeTC // ignore: cast_nullable_to_non_nullable
              as String,
      maVe: null == maVe
          ? _value.maVe
          : maVe // ignore: cast_nullable_to_non_nullable
              as String,
      idDatVeTotal: null == idDatVeTotal
          ? _value.idDatVeTotal
          : idDatVeTotal // ignore: cast_nullable_to_non_nullable
              as String,
      soGhe: null == soGhe
          ? _value.soGhe
          : soGhe // ignore: cast_nullable_to_non_nullable
              as String,
      hoTenTaiXeTrungChuyen: freezed == hoTenTaiXeTrungChuyen
          ? _value.hoTenTaiXeTrungChuyen
          : hoTenTaiXeTrungChuyen // ignore: cast_nullable_to_non_nullable
              as String?,
      dienThoaiTaiXeTrungChuyen: freezed == dienThoaiTaiXeTrungChuyen
          ? _value.dienThoaiTaiXeTrungChuyen
          : dienThoaiTaiXeTrungChuyen // ignore: cast_nullable_to_non_nullable
              as String?,
      tenXeTrungChuyen: freezed == tenXeTrungChuyen
          ? _value.tenXeTrungChuyen
          : tenXeTrungChuyen // ignore: cast_nullable_to_non_nullable
              as String?,
      bienSoXeTrungChuyen: freezed == bienSoXeTrungChuyen
          ? _value.bienSoXeTrungChuyen
          : bienSoXeTrungChuyen // ignore: cast_nullable_to_non_nullable
              as String?,
      tenKhachHang: null == tenKhachHang
          ? _value.tenKhachHang
          : tenKhachHang // ignore: cast_nullable_to_non_nullable
              as String,
      soDienThoaiKhach: null == soDienThoaiKhach
          ? _value.soDienThoaiKhach
          : soDienThoaiKhach // ignore: cast_nullable_to_non_nullable
              as String,
      diaChiKhachDi: null == diaChiKhachDi
          ? _value.diaChiKhachDi
          : diaChiKhachDi // ignore: cast_nullable_to_non_nullable
              as String,
      toaDoDiaChiKhachDi: freezed == toaDoDiaChiKhachDi
          ? _value.toaDoDiaChiKhachDi
          : toaDoDiaChiKhachDi // ignore: cast_nullable_to_non_nullable
              as String?,
      diaChiKhachDen: null == diaChiKhachDen
          ? _value.diaChiKhachDen
          : diaChiKhachDen // ignore: cast_nullable_to_non_nullable
              as String,
      toaDoDiaChiKhachDen: freezed == toaDoDiaChiKhachDen
          ? _value.toaDoDiaChiKhachDen
          : toaDoDiaChiKhachDen // ignore: cast_nullable_to_non_nullable
              as String?,
      diaChiLimoDi: freezed == diaChiLimoDi
          ? _value.diaChiLimoDi
          : diaChiLimoDi // ignore: cast_nullable_to_non_nullable
              as String?,
      toaDoLimoDi: freezed == toaDoLimoDi
          ? _value.toaDoLimoDi
          : toaDoLimoDi // ignore: cast_nullable_to_non_nullable
              as String?,
      vanPhongDen: null == vanPhongDen
          ? _value.vanPhongDen
          : vanPhongDen // ignore: cast_nullable_to_non_nullable
              as String,
      diaChiLimoDen: null == diaChiLimoDen
          ? _value.diaChiLimoDen
          : diaChiLimoDen // ignore: cast_nullable_to_non_nullable
              as String,
      toaDoLimoDen: freezed == toaDoLimoDen
          ? _value.toaDoLimoDen
          : toaDoLimoDen // ignore: cast_nullable_to_non_nullable
              as String?,
      ghiChu: freezed == ghiChu
          ? _value.ghiChu
          : ghiChu // ignore: cast_nullable_to_non_nullable
              as String?,
      ngayChay: freezed == ngayChay
          ? _value.ngayChay
          : ngayChay // ignore: cast_nullable_to_non_nullable
              as String?,
      thoiGianDi: freezed == thoiGianDi
          ? _value.thoiGianDi
          : thoiGianDi // ignore: cast_nullable_to_non_nullable
              as String?,
      idNhaXeLimo: null == idNhaXeLimo
          ? _value.idNhaXeLimo
          : idNhaXeLimo // ignore: cast_nullable_to_non_nullable
              as int,
      loaiKhach: null == loaiKhach
          ? _value.loaiKhach
          : loaiKhach // ignore: cast_nullable_to_non_nullable
              as int,
      khachTrungChuyen: freezed == khachTrungChuyen
          ? _value.khachTrungChuyen
          : khachTrungChuyen // ignore: cast_nullable_to_non_nullable
              as String?,
      trangThaiVe: null == trangThaiVe
          ? _value.trangThaiVe
          : trangThaiVe // ignore: cast_nullable_to_non_nullable
              as int,
      trangThaiTC: null == trangThaiTC
          ? _value.trangThaiTC
          : trangThaiTC // ignore: cast_nullable_to_non_nullable
              as int,
      daThanhToan: null == daThanhToan
          ? _value.daThanhToan
          : daThanhToan // ignore: cast_nullable_to_non_nullable
              as int,
      tienVe: null == tienVe
          ? _value.tienVe
          : tienVe // ignore: cast_nullable_to_non_nullable
              as double,
      chietKhau: null == chietKhau
          ? _value.chietKhau
          : chietKhau // ignore: cast_nullable_to_non_nullable
              as double,
      soTienCoc: null == soTienCoc
          ? _value.soTienCoc
          : soTienCoc // ignore: cast_nullable_to_non_nullable
              as double,
      hoTenKhachDatHo: freezed == hoTenKhachDatHo
          ? _value.hoTenKhachDatHo
          : hoTenKhachDatHo // ignore: cast_nullable_to_non_nullable
              as String?,
      soDienThoaiKhachDatHo: freezed == soDienThoaiKhachDatHo
          ? _value.soDienThoaiKhachDatHo
          : soDienThoaiKhachDatHo // ignore: cast_nullable_to_non_nullable
              as String?,
      tenNhom: freezed == tenNhom
          ? _value.tenNhom
          : tenNhom // ignore: cast_nullable_to_non_nullable
              as String?,
      diemBanVe: null == diemBanVe
          ? _value.diemBanVe
          : diemBanVe // ignore: cast_nullable_to_non_nullable
              as int,
      diemQuanLy: null == diemQuanLy
          ? _value.diemQuanLy
          : diemQuanLy // ignore: cast_nullable_to_non_nullable
              as int,
      soKhach: null == soKhach
          ? _value.soKhach
          : soKhach // ignore: cast_nullable_to_non_nullable
              as int,
      tenHinhThuc: freezed == tenHinhThuc
          ? _value.tenHinhThuc
          : tenHinhThuc // ignore: cast_nullable_to_non_nullable
              as String?,
      ngayChayList: freezed == ngayChayList
          ? _value.ngayChayList
          : ngayChayList // ignore: cast_nullable_to_non_nullable
              as String?,
      thoiGianList: freezed == thoiGianList
          ? _value.thoiGianList
          : thoiGianList // ignore: cast_nullable_to_non_nullable
              as String?,
      idHinhThucDiChuyen: null == idHinhThucDiChuyen
          ? _value.idHinhThucDiChuyen
          : idHinhThucDiChuyen // ignore: cast_nullable_to_non_nullable
              as int,
      loaVe: freezed == loaVe
          ? _value.loaVe
          : loaVe // ignore: cast_nullable_to_non_nullable
              as String?,
      hoTenTaiXe: freezed == hoTenTaiXe
          ? _value.hoTenTaiXe
          : hoTenTaiXe // ignore: cast_nullable_to_non_nullable
              as String?,
      dienThoaiTaiXe: freezed == dienThoaiTaiXe
          ? _value.dienThoaiTaiXe
          : dienThoaiTaiXe // ignore: cast_nullable_to_non_nullable
              as String?,
      nguoiTao: freezed == nguoiTao
          ? _value.nguoiTao
          : nguoiTao // ignore: cast_nullable_to_non_nullable
              as String?,
      khuHoiYn: null == khuHoiYn
          ? _value.khuHoiYn
          : khuHoiYn // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TripItemImplCopyWith<$Res>
    implements $TripItemCopyWith<$Res> {
  factory _$$TripItemImplCopyWith(
          _$TripItemImpl value, $Res Function(_$TripItemImpl) then) =
      __$$TripItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String idDatVe,
      String idYeuCauDatVe,
      String idTaiXeTC,
      String maVe,
      String idDatVeTotal,
      String soGhe,
      String? hoTenTaiXeTrungChuyen,
      String? dienThoaiTaiXeTrungChuyen,
      String? tenXeTrungChuyen,
      String? bienSoXeTrungChuyen,
      String tenKhachHang,
      String soDienThoaiKhach,
      String diaChiKhachDi,
      String? toaDoDiaChiKhachDi,
      String diaChiKhachDen,
      String? toaDoDiaChiKhachDen,
      String? diaChiLimoDi,
      String? toaDoLimoDi,
      String vanPhongDen,
      String diaChiLimoDen,
      String? toaDoLimoDen,
      String? ghiChu,
      String? ngayChay,
      String? thoiGianDi,
      int idNhaXeLimo,
      int loaiKhach,
      String? khachTrungChuyen,
      int trangThaiVe,
      int trangThaiTC,
      int daThanhToan,
      double tienVe,
      double chietKhau,
      double soTienCoc,
      String? hoTenKhachDatHo,
      String? soDienThoaiKhachDatHo,
      String? tenNhom,
      int diemBanVe,
      int diemQuanLy,
      int soKhach,
      String? tenHinhThuc,
      String? ngayChayList,
      String? thoiGianList,
      int idHinhThucDiChuyen,
      String? loaVe,
      String? hoTenTaiXe,
      String? dienThoaiTaiXe,
      String? nguoiTao,
      int khuHoiYn});
}

/// @nodoc
class __$$TripItemImplCopyWithImpl<$Res>
    extends _$TripItemCopyWithImpl<$Res, _$TripItemImpl>
    implements _$$TripItemImplCopyWith<$Res> {
  __$$TripItemImplCopyWithImpl(
      _$TripItemImpl _value, $Res Function(_$TripItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of TripItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idDatVe = null,
    Object? idYeuCauDatVe = null,
    Object? idTaiXeTC = null,
    Object? maVe = null,
    Object? idDatVeTotal = null,
    Object? soGhe = null,
    Object? hoTenTaiXeTrungChuyen = freezed,
    Object? dienThoaiTaiXeTrungChuyen = freezed,
    Object? tenXeTrungChuyen = freezed,
    Object? bienSoXeTrungChuyen = freezed,
    Object? tenKhachHang = null,
    Object? soDienThoaiKhach = null,
    Object? diaChiKhachDi = null,
    Object? toaDoDiaChiKhachDi = freezed,
    Object? diaChiKhachDen = null,
    Object? toaDoDiaChiKhachDen = freezed,
    Object? diaChiLimoDi = freezed,
    Object? toaDoLimoDi = freezed,
    Object? vanPhongDen = null,
    Object? diaChiLimoDen = null,
    Object? toaDoLimoDen = freezed,
    Object? ghiChu = freezed,
    Object? ngayChay = freezed,
    Object? thoiGianDi = freezed,
    Object? idNhaXeLimo = null,
    Object? loaiKhach = null,
    Object? khachTrungChuyen = freezed,
    Object? trangThaiVe = null,
    Object? trangThaiTC = null,
    Object? daThanhToan = null,
    Object? tienVe = null,
    Object? chietKhau = null,
    Object? soTienCoc = null,
    Object? hoTenKhachDatHo = freezed,
    Object? soDienThoaiKhachDatHo = freezed,
    Object? tenNhom = freezed,
    Object? diemBanVe = null,
    Object? diemQuanLy = null,
    Object? soKhach = null,
    Object? tenHinhThuc = freezed,
    Object? ngayChayList = freezed,
    Object? thoiGianList = freezed,
    Object? idHinhThucDiChuyen = null,
    Object? loaVe = freezed,
    Object? hoTenTaiXe = freezed,
    Object? dienThoaiTaiXe = freezed,
    Object? nguoiTao = freezed,
    Object? khuHoiYn = null,
  }) {
    return _then(_$TripItemImpl(
      idDatVe: null == idDatVe
          ? _value.idDatVe
          : idDatVe // ignore: cast_nullable_to_non_nullable
              as String,
      idYeuCauDatVe: null == idYeuCauDatVe
          ? _value.idYeuCauDatVe
          : idYeuCauDatVe // ignore: cast_nullable_to_non_nullable
              as String,
      idTaiXeTC: null == idTaiXeTC
          ? _value.idTaiXeTC
          : idTaiXeTC // ignore: cast_nullable_to_non_nullable
              as String,
      maVe: null == maVe
          ? _value.maVe
          : maVe // ignore: cast_nullable_to_non_nullable
              as String,
      idDatVeTotal: null == idDatVeTotal
          ? _value.idDatVeTotal
          : idDatVeTotal // ignore: cast_nullable_to_non_nullable
              as String,
      soGhe: null == soGhe
          ? _value.soGhe
          : soGhe // ignore: cast_nullable_to_non_nullable
              as String,
      hoTenTaiXeTrungChuyen: freezed == hoTenTaiXeTrungChuyen
          ? _value.hoTenTaiXeTrungChuyen
          : hoTenTaiXeTrungChuyen // ignore: cast_nullable_to_non_nullable
              as String?,
      dienThoaiTaiXeTrungChuyen: freezed == dienThoaiTaiXeTrungChuyen
          ? _value.dienThoaiTaiXeTrungChuyen
          : dienThoaiTaiXeTrungChuyen // ignore: cast_nullable_to_non_nullable
              as String?,
      tenXeTrungChuyen: freezed == tenXeTrungChuyen
          ? _value.tenXeTrungChuyen
          : tenXeTrungChuyen // ignore: cast_nullable_to_non_nullable
              as String?,
      bienSoXeTrungChuyen: freezed == bienSoXeTrungChuyen
          ? _value.bienSoXeTrungChuyen
          : bienSoXeTrungChuyen // ignore: cast_nullable_to_non_nullable
              as String?,
      tenKhachHang: null == tenKhachHang
          ? _value.tenKhachHang
          : tenKhachHang // ignore: cast_nullable_to_non_nullable
              as String,
      soDienThoaiKhach: null == soDienThoaiKhach
          ? _value.soDienThoaiKhach
          : soDienThoaiKhach // ignore: cast_nullable_to_non_nullable
              as String,
      diaChiKhachDi: null == diaChiKhachDi
          ? _value.diaChiKhachDi
          : diaChiKhachDi // ignore: cast_nullable_to_non_nullable
              as String,
      toaDoDiaChiKhachDi: freezed == toaDoDiaChiKhachDi
          ? _value.toaDoDiaChiKhachDi
          : toaDoDiaChiKhachDi // ignore: cast_nullable_to_non_nullable
              as String?,
      diaChiKhachDen: null == diaChiKhachDen
          ? _value.diaChiKhachDen
          : diaChiKhachDen // ignore: cast_nullable_to_non_nullable
              as String,
      toaDoDiaChiKhachDen: freezed == toaDoDiaChiKhachDen
          ? _value.toaDoDiaChiKhachDen
          : toaDoDiaChiKhachDen // ignore: cast_nullable_to_non_nullable
              as String?,
      diaChiLimoDi: freezed == diaChiLimoDi
          ? _value.diaChiLimoDi
          : diaChiLimoDi // ignore: cast_nullable_to_non_nullable
              as String?,
      toaDoLimoDi: freezed == toaDoLimoDi
          ? _value.toaDoLimoDi
          : toaDoLimoDi // ignore: cast_nullable_to_non_nullable
              as String?,
      vanPhongDen: null == vanPhongDen
          ? _value.vanPhongDen
          : vanPhongDen // ignore: cast_nullable_to_non_nullable
              as String,
      diaChiLimoDen: null == diaChiLimoDen
          ? _value.diaChiLimoDen
          : diaChiLimoDen // ignore: cast_nullable_to_non_nullable
              as String,
      toaDoLimoDen: freezed == toaDoLimoDen
          ? _value.toaDoLimoDen
          : toaDoLimoDen // ignore: cast_nullable_to_non_nullable
              as String?,
      ghiChu: freezed == ghiChu
          ? _value.ghiChu
          : ghiChu // ignore: cast_nullable_to_non_nullable
              as String?,
      ngayChay: freezed == ngayChay
          ? _value.ngayChay
          : ngayChay // ignore: cast_nullable_to_non_nullable
              as String?,
      thoiGianDi: freezed == thoiGianDi
          ? _value.thoiGianDi
          : thoiGianDi // ignore: cast_nullable_to_non_nullable
              as String?,
      idNhaXeLimo: null == idNhaXeLimo
          ? _value.idNhaXeLimo
          : idNhaXeLimo // ignore: cast_nullable_to_non_nullable
              as int,
      loaiKhach: null == loaiKhach
          ? _value.loaiKhach
          : loaiKhach // ignore: cast_nullable_to_non_nullable
              as int,
      khachTrungChuyen: freezed == khachTrungChuyen
          ? _value.khachTrungChuyen
          : khachTrungChuyen // ignore: cast_nullable_to_non_nullable
              as String?,
      trangThaiVe: null == trangThaiVe
          ? _value.trangThaiVe
          : trangThaiVe // ignore: cast_nullable_to_non_nullable
              as int,
      trangThaiTC: null == trangThaiTC
          ? _value.trangThaiTC
          : trangThaiTC // ignore: cast_nullable_to_non_nullable
              as int,
      daThanhToan: null == daThanhToan
          ? _value.daThanhToan
          : daThanhToan // ignore: cast_nullable_to_non_nullable
              as int,
      tienVe: null == tienVe
          ? _value.tienVe
          : tienVe // ignore: cast_nullable_to_non_nullable
              as double,
      chietKhau: null == chietKhau
          ? _value.chietKhau
          : chietKhau // ignore: cast_nullable_to_non_nullable
              as double,
      soTienCoc: null == soTienCoc
          ? _value.soTienCoc
          : soTienCoc // ignore: cast_nullable_to_non_nullable
              as double,
      hoTenKhachDatHo: freezed == hoTenKhachDatHo
          ? _value.hoTenKhachDatHo
          : hoTenKhachDatHo // ignore: cast_nullable_to_non_nullable
              as String?,
      soDienThoaiKhachDatHo: freezed == soDienThoaiKhachDatHo
          ? _value.soDienThoaiKhachDatHo
          : soDienThoaiKhachDatHo // ignore: cast_nullable_to_non_nullable
              as String?,
      tenNhom: freezed == tenNhom
          ? _value.tenNhom
          : tenNhom // ignore: cast_nullable_to_non_nullable
              as String?,
      diemBanVe: null == diemBanVe
          ? _value.diemBanVe
          : diemBanVe // ignore: cast_nullable_to_non_nullable
              as int,
      diemQuanLy: null == diemQuanLy
          ? _value.diemQuanLy
          : diemQuanLy // ignore: cast_nullable_to_non_nullable
              as int,
      soKhach: null == soKhach
          ? _value.soKhach
          : soKhach // ignore: cast_nullable_to_non_nullable
              as int,
      tenHinhThuc: freezed == tenHinhThuc
          ? _value.tenHinhThuc
          : tenHinhThuc // ignore: cast_nullable_to_non_nullable
              as String?,
      ngayChayList: freezed == ngayChayList
          ? _value.ngayChayList
          : ngayChayList // ignore: cast_nullable_to_non_nullable
              as String?,
      thoiGianList: freezed == thoiGianList
          ? _value.thoiGianList
          : thoiGianList // ignore: cast_nullable_to_non_nullable
              as String?,
      idHinhThucDiChuyen: null == idHinhThucDiChuyen
          ? _value.idHinhThucDiChuyen
          : idHinhThucDiChuyen // ignore: cast_nullable_to_non_nullable
              as int,
      loaVe: freezed == loaVe
          ? _value.loaVe
          : loaVe // ignore: cast_nullable_to_non_nullable
              as String?,
      hoTenTaiXe: freezed == hoTenTaiXe
          ? _value.hoTenTaiXe
          : hoTenTaiXe // ignore: cast_nullable_to_non_nullable
              as String?,
      dienThoaiTaiXe: freezed == dienThoaiTaiXe
          ? _value.dienThoaiTaiXe
          : dienThoaiTaiXe // ignore: cast_nullable_to_non_nullable
              as String?,
      nguoiTao: freezed == nguoiTao
          ? _value.nguoiTao
          : nguoiTao // ignore: cast_nullable_to_non_nullable
              as String?,
      khuHoiYn: null == khuHoiYn
          ? _value.khuHoiYn
          : khuHoiYn // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TripItemImpl implements _TripItem {
  const _$TripItemImpl(
      {this.idDatVe = '',
      this.idYeuCauDatVe = '',
      this.idTaiXeTC = '',
      this.maVe = '',
      this.idDatVeTotal = '',
      this.soGhe = '',
      this.hoTenTaiXeTrungChuyen,
      this.dienThoaiTaiXeTrungChuyen,
      this.tenXeTrungChuyen,
      this.bienSoXeTrungChuyen,
      this.tenKhachHang = '',
      this.soDienThoaiKhach = '',
      this.diaChiKhachDi = '',
      this.toaDoDiaChiKhachDi,
      this.diaChiKhachDen = '',
      this.toaDoDiaChiKhachDen,
      this.diaChiLimoDi,
      this.toaDoLimoDi,
      this.vanPhongDen = '',
      this.diaChiLimoDen = '',
      this.toaDoLimoDen,
      this.ghiChu,
      this.ngayChay,
      this.thoiGianDi,
      this.idNhaXeLimo = 0,
      this.loaiKhach = 0,
      this.khachTrungChuyen,
      this.trangThaiVe = 0,
      this.trangThaiTC = 0,
      this.daThanhToan = 0,
      this.tienVe = 0.0,
      this.chietKhau = 0.0,
      this.soTienCoc = 0.0,
      this.hoTenKhachDatHo,
      this.soDienThoaiKhachDatHo,
      this.tenNhom,
      this.diemBanVe = 0,
      this.diemQuanLy = 0,
      this.soKhach = 0,
      this.tenHinhThuc,
      this.ngayChayList,
      this.thoiGianList,
      this.idHinhThucDiChuyen = 0,
      this.loaVe,
      this.hoTenTaiXe,
      this.dienThoaiTaiXe,
      this.nguoiTao,
      this.khuHoiYn = 0});

  factory _$TripItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$TripItemImplFromJson(json);

  @override
  @JsonKey()
  final String idDatVe;
  @override
  @JsonKey()
  final String idYeuCauDatVe;
  @override
  @JsonKey()
  final String idTaiXeTC;
  @override
  @JsonKey()
  final String maVe;
  @override
  @JsonKey()
  final String idDatVeTotal;
  @override
  @JsonKey()
  final String soGhe;
  @override
  final String? hoTenTaiXeTrungChuyen;
  @override
  final String? dienThoaiTaiXeTrungChuyen;
  @override
  final String? tenXeTrungChuyen;
  @override
  final String? bienSoXeTrungChuyen;
  @override
  @JsonKey()
  final String tenKhachHang;
  @override
  @JsonKey()
  final String soDienThoaiKhach;
  @override
  @JsonKey()
  final String diaChiKhachDi;
  @override
  final String? toaDoDiaChiKhachDi;
  @override
  @JsonKey()
  final String diaChiKhachDen;
  @override
  final String? toaDoDiaChiKhachDen;
  @override
  final String? diaChiLimoDi;
  @override
  final String? toaDoLimoDi;
  @override
  @JsonKey()
  final String vanPhongDen;
  @override
  @JsonKey()
  final String diaChiLimoDen;
  @override
  final String? toaDoLimoDen;
  @override
  final String? ghiChu;
  @override
  final String? ngayChay;
  @override
  final String? thoiGianDi;
  @override
  @JsonKey()
  final int idNhaXeLimo;
  @override
  @JsonKey()
  final int loaiKhach;
  @override
  final String? khachTrungChuyen;
  @override
  @JsonKey()
  final int trangThaiVe;
  @override
  @JsonKey()
  final int trangThaiTC;
  @override
  @JsonKey()
  final int daThanhToan;
  @override
  @JsonKey()
  final double tienVe;
  @override
  @JsonKey()
  final double chietKhau;
  @override
  @JsonKey()
  final double soTienCoc;
  @override
  final String? hoTenKhachDatHo;
  @override
  final String? soDienThoaiKhachDatHo;
  @override
  final String? tenNhom;
  @override
  @JsonKey()
  final int diemBanVe;
  @override
  @JsonKey()
  final int diemQuanLy;
  @override
  @JsonKey()
  final int soKhach;
  @override
  final String? tenHinhThuc;
  @override
  final String? ngayChayList;
  @override
  final String? thoiGianList;
  @override
  @JsonKey()
  final int idHinhThucDiChuyen;
  @override
  final String? loaVe;
  @override
  final String? hoTenTaiXe;
  @override
  final String? dienThoaiTaiXe;
  @override
  final String? nguoiTao;
  @override
  @JsonKey()
  final int khuHoiYn;

  @override
  String toString() {
    return 'TripItem(idDatVe: $idDatVe, idYeuCauDatVe: $idYeuCauDatVe, idTaiXeTC: $idTaiXeTC, maVe: $maVe, idDatVeTotal: $idDatVeTotal, soGhe: $soGhe, hoTenTaiXeTrungChuyen: $hoTenTaiXeTrungChuyen, dienThoaiTaiXeTrungChuyen: $dienThoaiTaiXeTrungChuyen, tenXeTrungChuyen: $tenXeTrungChuyen, bienSoXeTrungChuyen: $bienSoXeTrungChuyen, tenKhachHang: $tenKhachHang, soDienThoaiKhach: $soDienThoaiKhach, diaChiKhachDi: $diaChiKhachDi, toaDoDiaChiKhachDi: $toaDoDiaChiKhachDi, diaChiKhachDen: $diaChiKhachDen, toaDoDiaChiKhachDen: $toaDoDiaChiKhachDen, diaChiLimoDi: $diaChiLimoDi, toaDoLimoDi: $toaDoLimoDi, vanPhongDen: $vanPhongDen, diaChiLimoDen: $diaChiLimoDen, toaDoLimoDen: $toaDoLimoDen, ghiChu: $ghiChu, ngayChay: $ngayChay, thoiGianDi: $thoiGianDi, idNhaXeLimo: $idNhaXeLimo, loaiKhach: $loaiKhach, khachTrungChuyen: $khachTrungChuyen, trangThaiVe: $trangThaiVe, trangThaiTC: $trangThaiTC, daThanhToan: $daThanhToan, tienVe: $tienVe, chietKhau: $chietKhau, soTienCoc: $soTienCoc, hoTenKhachDatHo: $hoTenKhachDatHo, soDienThoaiKhachDatHo: $soDienThoaiKhachDatHo, tenNhom: $tenNhom, diemBanVe: $diemBanVe, diemQuanLy: $diemQuanLy, soKhach: $soKhach, tenHinhThuc: $tenHinhThuc, ngayChayList: $ngayChayList, thoiGianList: $thoiGianList, idHinhThucDiChuyen: $idHinhThucDiChuyen, loaVe: $loaVe, hoTenTaiXe: $hoTenTaiXe, dienThoaiTaiXe: $dienThoaiTaiXe, nguoiTao: $nguoiTao, khuHoiYn: $khuHoiYn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TripItemImpl &&
            (identical(other.idDatVe, idDatVe) || other.idDatVe == idDatVe) &&
            (identical(other.idYeuCauDatVe, idYeuCauDatVe) ||
                other.idYeuCauDatVe == idYeuCauDatVe) &&
            (identical(other.idTaiXeTC, idTaiXeTC) ||
                other.idTaiXeTC == idTaiXeTC) &&
            (identical(other.maVe, maVe) || other.maVe == maVe) &&
            (identical(other.idDatVeTotal, idDatVeTotal) ||
                other.idDatVeTotal == idDatVeTotal) &&
            (identical(other.soGhe, soGhe) || other.soGhe == soGhe) &&
            (identical(other.hoTenTaiXeTrungChuyen, hoTenTaiXeTrungChuyen) ||
                other.hoTenTaiXeTrungChuyen == hoTenTaiXeTrungChuyen) &&
            (identical(other.dienThoaiTaiXeTrungChuyen, dienThoaiTaiXeTrungChuyen) ||
                other.dienThoaiTaiXeTrungChuyen == dienThoaiTaiXeTrungChuyen) &&
            (identical(other.tenXeTrungChuyen, tenXeTrungChuyen) ||
                other.tenXeTrungChuyen == tenXeTrungChuyen) &&
            (identical(other.bienSoXeTrungChuyen, bienSoXeTrungChuyen) ||
                other.bienSoXeTrungChuyen == bienSoXeTrungChuyen) &&
            (identical(other.tenKhachHang, tenKhachHang) ||
                other.tenKhachHang == tenKhachHang) &&
            (identical(other.soDienThoaiKhach, soDienThoaiKhach) ||
                other.soDienThoaiKhach == soDienThoaiKhach) &&
            (identical(other.diaChiKhachDi, diaChiKhachDi) ||
                other.diaChiKhachDi == diaChiKhachDi) &&
            (identical(other.toaDoDiaChiKhachDi, toaDoDiaChiKhachDi) ||
                other.toaDoDiaChiKhachDi == toaDoDiaChiKhachDi) &&
            (identical(other.diaChiKhachDen, diaChiKhachDen) ||
                other.diaChiKhachDen == diaChiKhachDen) &&
            (identical(other.toaDoDiaChiKhachDen, toaDoDiaChiKhachDen) ||
                other.toaDoDiaChiKhachDen == toaDoDiaChiKhachDen) &&
            (identical(other.diaChiLimoDi, diaChiLimoDi) ||
                other.diaChiLimoDi == diaChiLimoDi) &&
            (identical(other.toaDoLimoDi, toaDoLimoDi) ||
                other.toaDoLimoDi == toaDoLimoDi) &&
            (identical(other.vanPhongDen, vanPhongDen) ||
                other.vanPhongDen == vanPhongDen) &&
            (identical(other.diaChiLimoDen, diaChiLimoDen) ||
                other.diaChiLimoDen == diaChiLimoDen) &&
            (identical(other.toaDoLimoDen, toaDoLimoDen) ||
                other.toaDoLimoDen == toaDoLimoDen) &&
            (identical(other.ghiChu, ghiChu) || other.ghiChu == ghiChu) &&
            (identical(other.ngayChay, ngayChay) ||
                other.ngayChay == ngayChay) &&
            (identical(other.thoiGianDi, thoiGianDi) ||
                other.thoiGianDi == thoiGianDi) &&
            (identical(other.idNhaXeLimo, idNhaXeLimo) ||
                other.idNhaXeLimo == idNhaXeLimo) &&
            (identical(other.loaiKhach, loaiKhach) ||
                other.loaiKhach == loaiKhach) &&
            (identical(other.khachTrungChuyen, khachTrungChuyen) ||
                other.khachTrungChuyen == khachTrungChuyen) &&
            (identical(other.trangThaiVe, trangThaiVe) ||
                other.trangThaiVe == trangThaiVe) &&
            (identical(other.trangThaiTC, trangThaiTC) ||
                other.trangThaiTC == trangThaiTC) &&
            (identical(other.daThanhToan, daThanhToan) ||
                other.daThanhToan == daThanhToan) &&
            (identical(other.tienVe, tienVe) || other.tienVe == tienVe) &&
            (identical(other.chietKhau, chietKhau) ||
                other.chietKhau == chietKhau) &&
            (identical(other.soTienCoc, soTienCoc) ||
                other.soTienCoc == soTienCoc) &&
            (identical(other.hoTenKhachDatHo, hoTenKhachDatHo) ||
                other.hoTenKhachDatHo == hoTenKhachDatHo) &&
            (identical(other.soDienThoaiKhachDatHo, soDienThoaiKhachDatHo) ||
                other.soDienThoaiKhachDatHo == soDienThoaiKhachDatHo) &&
            (identical(other.tenNhom, tenNhom) || other.tenNhom == tenNhom) &&
            (identical(other.diemBanVe, diemBanVe) ||
                other.diemBanVe == diemBanVe) &&
            (identical(other.diemQuanLy, diemQuanLy) ||
                other.diemQuanLy == diemQuanLy) &&
            (identical(other.soKhach, soKhach) || other.soKhach == soKhach) &&
            (identical(other.tenHinhThuc, tenHinhThuc) ||
                other.tenHinhThuc == tenHinhThuc) &&
            (identical(other.ngayChayList, ngayChayList) || other.ngayChayList == ngayChayList) &&
            (identical(other.thoiGianList, thoiGianList) || other.thoiGianList == thoiGianList) &&
            (identical(other.idHinhThucDiChuyen, idHinhThucDiChuyen) || other.idHinhThucDiChuyen == idHinhThucDiChuyen) &&
            (identical(other.loaVe, loaVe) || other.loaVe == loaVe) &&
            (identical(other.hoTenTaiXe, hoTenTaiXe) || other.hoTenTaiXe == hoTenTaiXe) &&
            (identical(other.dienThoaiTaiXe, dienThoaiTaiXe) || other.dienThoaiTaiXe == dienThoaiTaiXe) &&
            (identical(other.nguoiTao, nguoiTao) || other.nguoiTao == nguoiTao) &&
            (identical(other.khuHoiYn, khuHoiYn) || other.khuHoiYn == khuHoiYn));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        idDatVe,
        idYeuCauDatVe,
        idTaiXeTC,
        maVe,
        idDatVeTotal,
        soGhe,
        hoTenTaiXeTrungChuyen,
        dienThoaiTaiXeTrungChuyen,
        tenXeTrungChuyen,
        bienSoXeTrungChuyen,
        tenKhachHang,
        soDienThoaiKhach,
        diaChiKhachDi,
        toaDoDiaChiKhachDi,
        diaChiKhachDen,
        toaDoDiaChiKhachDen,
        diaChiLimoDi,
        toaDoLimoDi,
        vanPhongDen,
        diaChiLimoDen,
        toaDoLimoDen,
        ghiChu,
        ngayChay,
        thoiGianDi,
        idNhaXeLimo,
        loaiKhach,
        khachTrungChuyen,
        trangThaiVe,
        trangThaiTC,
        daThanhToan,
        tienVe,
        chietKhau,
        soTienCoc,
        hoTenKhachDatHo,
        soDienThoaiKhachDatHo,
        tenNhom,
        diemBanVe,
        diemQuanLy,
        soKhach,
        tenHinhThuc,
        ngayChayList,
        thoiGianList,
        idHinhThucDiChuyen,
        loaVe,
        hoTenTaiXe,
        dienThoaiTaiXe,
        nguoiTao,
        khuHoiYn
      ]);

  /// Create a copy of TripItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TripItemImplCopyWith<_$TripItemImpl> get copyWith =>
      __$$TripItemImplCopyWithImpl<_$TripItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TripItemImplToJson(
      this,
    );
  }
}

abstract class _TripItem implements TripItem {
  const factory _TripItem(
      {final String idDatVe,
      final String idYeuCauDatVe,
      final String idTaiXeTC,
      final String maVe,
      final String idDatVeTotal,
      final String soGhe,
      final String? hoTenTaiXeTrungChuyen,
      final String? dienThoaiTaiXeTrungChuyen,
      final String? tenXeTrungChuyen,
      final String? bienSoXeTrungChuyen,
      final String tenKhachHang,
      final String soDienThoaiKhach,
      final String diaChiKhachDi,
      final String? toaDoDiaChiKhachDi,
      final String diaChiKhachDen,
      final String? toaDoDiaChiKhachDen,
      final String? diaChiLimoDi,
      final String? toaDoLimoDi,
      final String vanPhongDen,
      final String diaChiLimoDen,
      final String? toaDoLimoDen,
      final String? ghiChu,
      final String? ngayChay,
      final String? thoiGianDi,
      final int idNhaXeLimo,
      final int loaiKhach,
      final String? khachTrungChuyen,
      final int trangThaiVe,
      final int trangThaiTC,
      final int daThanhToan,
      final double tienVe,
      final double chietKhau,
      final double soTienCoc,
      final String? hoTenKhachDatHo,
      final String? soDienThoaiKhachDatHo,
      final String? tenNhom,
      final int diemBanVe,
      final int diemQuanLy,
      final int soKhach,
      final String? tenHinhThuc,
      final String? ngayChayList,
      final String? thoiGianList,
      final int idHinhThucDiChuyen,
      final String? loaVe,
      final String? hoTenTaiXe,
      final String? dienThoaiTaiXe,
      final String? nguoiTao,
      final int khuHoiYn}) = _$TripItemImpl;

  factory _TripItem.fromJson(Map<String, dynamic> json) =
      _$TripItemImpl.fromJson;

  @override
  String get idDatVe;
  @override
  String get idYeuCauDatVe;
  @override
  String get idTaiXeTC;
  @override
  String get maVe;
  @override
  String get idDatVeTotal;
  @override
  String get soGhe;
  @override
  String? get hoTenTaiXeTrungChuyen;
  @override
  String? get dienThoaiTaiXeTrungChuyen;
  @override
  String? get tenXeTrungChuyen;
  @override
  String? get bienSoXeTrungChuyen;
  @override
  String get tenKhachHang;
  @override
  String get soDienThoaiKhach;
  @override
  String get diaChiKhachDi;
  @override
  String? get toaDoDiaChiKhachDi;
  @override
  String get diaChiKhachDen;
  @override
  String? get toaDoDiaChiKhachDen;
  @override
  String? get diaChiLimoDi;
  @override
  String? get toaDoLimoDi;
  @override
  String get vanPhongDen;
  @override
  String get diaChiLimoDen;
  @override
  String? get toaDoLimoDen;
  @override
  String? get ghiChu;
  @override
  String? get ngayChay;
  @override
  String? get thoiGianDi;
  @override
  int get idNhaXeLimo;
  @override
  int get loaiKhach;
  @override
  String? get khachTrungChuyen;
  @override
  int get trangThaiVe;
  @override
  int get trangThaiTC;
  @override
  int get daThanhToan;
  @override
  double get tienVe;
  @override
  double get chietKhau;
  @override
  double get soTienCoc;
  @override
  String? get hoTenKhachDatHo;
  @override
  String? get soDienThoaiKhachDatHo;
  @override
  String? get tenNhom;
  @override
  int get diemBanVe;
  @override
  int get diemQuanLy;
  @override
  int get soKhach;
  @override
  String? get tenHinhThuc;
  @override
  String? get ngayChayList;
  @override
  String? get thoiGianList;
  @override
  int get idHinhThucDiChuyen;
  @override
  String? get loaVe;
  @override
  String? get hoTenTaiXe;
  @override
  String? get dienThoaiTaiXe;
  @override
  String? get nguoiTao;
  @override
  int get khuHoiYn;

  /// Create a copy of TripItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TripItemImplCopyWith<_$TripItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
