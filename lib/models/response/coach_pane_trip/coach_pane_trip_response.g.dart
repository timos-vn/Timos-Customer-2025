// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coach_pane_trip_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CoachPaneTripResponseImpl _$$CoachPaneTripResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CoachPaneTripResponseImpl(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CoachPaneTripItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      statusCode: (json['statusCode'] as num?)?.toInt() ?? 0,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$CoachPaneTripResponseImplToJson(
        _$CoachPaneTripResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'statusCode': instance.statusCode,
      'message': instance.message,
    };

_$CoachPaneTripItemImpl _$$CoachPaneTripItemImplFromJson(
        Map<String, dynamic> json) =>
    _$CoachPaneTripItemImpl(
      id: json['id'] as String? ?? '',
      idNhaXe: (json['idNhaXe'] as num?)?.toInt() ?? 0,
      tenNhaXe: json['tenNhaXe'] as String? ?? '',
      idTuyenDuong: (json['idTuyenDuong'] as num?)?.toInt() ?? 0,
      tenTuyenDuong: json['tenTuyenDuong'] as String? ?? '',
      ngayChay: json['ngayChay'] as String?,
      gioDi: json['gioDi'] as String?,
      idLoaiXe: (json['idLoaiXe'] as num?)?.toInt() ?? 0,
      tenLoaiXe: json['tenLoaiXe'] as String? ?? '',
      idXe: (json['idXe'] as num?)?.toInt() ?? 0,
      bienSoXe: json['bienSoXe'] as String? ?? '',
      idTaiXe: json['idTaiXe'] as String?,
      tenTaiXe: json['tenTaiXe'] as String? ?? '',
      idPhuXe: json['idPhuXe'] as String?,
      tenPhuXe: json['tenPhuXe'] as String? ?? '',
      soGheDaDat: (json['soGheDaDat'] as num?)?.toInt() ?? 0,
      tongSoGhe: (json['tongSoGhe'] as num?)?.toInt() ?? 0,
      trangThai: (json['trangThai'] as num?)?.toInt() ?? 0,
      tenTrangThai: json['tenTrangThai'] as String? ?? '',
      ngayTao: json['ngayTao'] as String?,
      nguoiTao: json['nguoiTao'] as String?,
    );

Map<String, dynamic> _$$CoachPaneTripItemImplToJson(
        _$CoachPaneTripItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idNhaXe': instance.idNhaXe,
      'tenNhaXe': instance.tenNhaXe,
      'idTuyenDuong': instance.idTuyenDuong,
      'tenTuyenDuong': instance.tenTuyenDuong,
      'ngayChay': instance.ngayChay,
      'gioDi': instance.gioDi,
      'idLoaiXe': instance.idLoaiXe,
      'tenLoaiXe': instance.tenLoaiXe,
      'idXe': instance.idXe,
      'bienSoXe': instance.bienSoXe,
      'idTaiXe': instance.idTaiXe,
      'tenTaiXe': instance.tenTaiXe,
      'idPhuXe': instance.idPhuXe,
      'tenPhuXe': instance.tenPhuXe,
      'soGheDaDat': instance.soGheDaDat,
      'tongSoGhe': instance.tongSoGhe,
      'trangThai': instance.trangThai,
      'tenTrangThai': instance.tenTrangThai,
      'ngayTao': instance.ngayTao,
      'nguoiTao': instance.nguoiTao,
    };
