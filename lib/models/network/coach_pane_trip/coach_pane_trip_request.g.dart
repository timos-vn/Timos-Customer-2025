// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coach_pane_trip_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CoachPaneTripRequestImpl _$$CoachPaneTripRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$CoachPaneTripRequestImpl(
      idNhaXe: (json['idNhaXe'] as num).toInt(),
      idLoaiNhaXe: (json['idLoaiNhaXe'] as num).toInt(),
      idNhanVien: json['idNhanVien'] as String,
      ngayBatDau: json['ngayBatDau'] as String,
      ngayKetThuc: json['ngayKetThuc'] as String,
      pageIndex: (json['pageIndex'] as num).toInt(),
      pageSize: (json['pageSize'] as num).toInt(),
    );

Map<String, dynamic> _$$CoachPaneTripRequestImplToJson(
        _$CoachPaneTripRequestImpl instance) =>
    <String, dynamic>{
      'idNhaXe': instance.idNhaXe,
      'idLoaiNhaXe': instance.idLoaiNhaXe,
      'idNhanVien': instance.idNhanVien,
      'ngayBatDau': instance.ngayBatDau,
      'ngayKetThuc': instance.ngayKetThuc,
      'pageIndex': instance.pageIndex,
      'pageSize': instance.pageSize,
    };
