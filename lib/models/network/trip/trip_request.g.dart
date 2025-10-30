// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TripListRequestImpl _$$TripListRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$TripListRequestImpl(
      pageIndex: (json['pageIndex'] as num).toInt(),
      pageSize: (json['pageSize'] as num).toInt(),
      tuKhoa: json['tuKhoa'] as String?,
      ngayChay: json['ngayChay'] as String,
      idNhanVien: json['idNhanVien'] as String,
      idNhom: (json['idNhom'] as num).toInt(),
      idDoiTac: json['idDoiTac'] as String?,
    );

Map<String, dynamic> _$$TripListRequestImplToJson(
        _$TripListRequestImpl instance) =>
    <String, dynamic>{
      'pageIndex': instance.pageIndex,
      'pageSize': instance.pageSize,
      'tuKhoa': instance.tuKhoa,
      'ngayChay': instance.ngayChay,
      'idNhanVien': instance.idNhanVien,
      'idNhom': instance.idNhom,
      'idDoiTac': instance.idDoiTac,
    };
