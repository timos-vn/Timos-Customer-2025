// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_coach_pane_trip_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DetailCoachPaneTripResponseImpl _$$DetailCoachPaneTripResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$DetailCoachPaneTripResponseImpl(
      data: json['data'] == null
          ? null
          : DetailCoachPaneTripData.fromJson(
              json['data'] as Map<String, dynamic>),
      statusCode: (json['statusCode'] as num?)?.toInt() ?? 0,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$DetailCoachPaneTripResponseImplToJson(
        _$DetailCoachPaneTripResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'statusCode': instance.statusCode,
      'message': instance.message,
    };

_$DetailCoachPaneTripDataImpl _$$DetailCoachPaneTripDataImplFromJson(
        Map<String, dynamic> json) =>
    _$DetailCoachPaneTripDataImpl(
      idLichXeLimousine: json['idLichXeLimousine'] as String? ?? '',
      maLimo: json['maLimo'] as String? ?? '',
      bienSoXe: json['bienSoXe'] as String? ?? '',
      ngayChay: json['ngayChay'] as String?,
      gioDi: json['gioDi'] as String?,
      tenTaiXe: json['tenTaiXe'] as String? ?? '',
      soDienThoaiTaiXe: json['soDienThoaiTaiXe'] as String? ?? '',
      soGheDaDat: (json['soGheDaDat'] as num?)?.toInt() ?? 0,
      tongSoGhe: (json['tongSoGhe'] as num?)?.toInt() ?? 0,
      tongDoanhThu: (json['tongDoanhThu'] as num?)?.toDouble() ?? 0.0,
      soGheDaDatCount: (json['soGheDaDatCount'] as num?)?.toInt() ?? 0,
      soGheGiuChoCount: (json['soGheGiuChoCount'] as num?)?.toInt() ?? 0,
      soGheTrongCount: (json['soGheTrongCount'] as num?)?.toInt() ?? 0,
      danhSachTang: (json['danhSachTang'] as List<dynamic>?)
              ?.map((e) => DetailTangItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      tangHienTai: json['tangHienTai'] == null
          ? null
          : DetailTangItem.fromJson(
              json['tangHienTai'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DetailCoachPaneTripDataImplToJson(
        _$DetailCoachPaneTripDataImpl instance) =>
    <String, dynamic>{
      'idLichXeLimousine': instance.idLichXeLimousine,
      'maLimo': instance.maLimo,
      'bienSoXe': instance.bienSoXe,
      'ngayChay': instance.ngayChay,
      'gioDi': instance.gioDi,
      'tenTaiXe': instance.tenTaiXe,
      'soDienThoaiTaiXe': instance.soDienThoaiTaiXe,
      'soGheDaDat': instance.soGheDaDat,
      'tongSoGhe': instance.tongSoGhe,
      'tongDoanhThu': instance.tongDoanhThu,
      'soGheDaDatCount': instance.soGheDaDatCount,
      'soGheGiuChoCount': instance.soGheGiuChoCount,
      'soGheTrongCount': instance.soGheTrongCount,
      'danhSachTang': instance.danhSachTang,
      'tangHienTai': instance.tangHienTai,
    };

_$DetailTangItemImpl _$$DetailTangItemImplFromJson(Map<String, dynamic> json) =>
    _$DetailTangItemImpl(
      tang: (json['tang'] as num?)?.toInt() ?? 0,
      soGheDaDat: (json['soGheDaDat'] as num?)?.toInt() ?? 0,
      soGheGiuCho: (json['soGheGiuCho'] as num?)?.toInt() ?? 0,
      soGheTrong: (json['soGheTrong'] as num?)?.toInt() ?? 0,
      danhSachGhe: (json['danhSachGhe'] as List<dynamic>?)
              ?.map((e) => DetailGheItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$DetailTangItemImplToJson(
        _$DetailTangItemImpl instance) =>
    <String, dynamic>{
      'tang': instance.tang,
      'soGheDaDat': instance.soGheDaDat,
      'soGheGiuCho': instance.soGheGiuCho,
      'soGheTrong': instance.soGheTrong,
      'danhSachGhe': instance.danhSachGhe,
    };

_$DetailGheItemImpl _$$DetailGheItemImplFromJson(Map<String, dynamic> json) =>
    _$DetailGheItemImpl(
      idGhe: (json['idGhe'] as num?)?.toInt() ?? 0,
      tenGhe: json['tenGhe'] as String? ?? '',
      tang: (json['tang'] as num?)?.toInt() ?? 0,
      day: (json['day'] as num?)?.toInt() ?? 0,
      hang: (json['hang'] as num?)?.toInt() ?? 0,
      trangThaiGhe: (json['trangThaiGhe'] as num?)?.toInt() ?? 0,
      tenTrangThaiGhe: json['tenTrangThaiGhe'] as String? ?? '',
      giaVe: (json['giaVe'] as num?)?.toDouble() ?? 0.0,
      mauSac: json['mauSac'] as String? ?? '',
    );

Map<String, dynamic> _$$DetailGheItemImplToJson(_$DetailGheItemImpl instance) =>
    <String, dynamic>{
      'idGhe': instance.idGhe,
      'tenGhe': instance.tenGhe,
      'tang': instance.tang,
      'day': instance.day,
      'hang': instance.hang,
      'trangThaiGhe': instance.trangThaiGhe,
      'tenTrangThaiGhe': instance.tenTrangThaiGhe,
      'giaVe': instance.giaVe,
      'mauSac': instance.mauSac,
    };
