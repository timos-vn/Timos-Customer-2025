// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GroupListResponseImpl _$$GroupListResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GroupListResponseImpl(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => GroupItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      statusCode: (json['statusCode'] as num?)?.toInt() ?? 0,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$GroupListResponseImplToJson(
        _$GroupListResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'statusCode': instance.statusCode,
      'message': instance.message,
    };

_$GroupItemImpl _$$GroupItemImplFromJson(Map<String, dynamic> json) =>
    _$GroupItemImpl(
      idNhom: (json['idNhom'] as num?)?.toInt() ?? 0,
      maNhom: json['maNhom'] as String? ?? '',
      tenNhom: json['tenNhom'] as String? ?? '',
      isPublic: (json['isPublic'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$GroupItemImplToJson(_$GroupItemImpl instance) =>
    <String, dynamic>{
      'idNhom': instance.idNhom,
      'maNhom': instance.maNhom,
      'tenNhom': instance.tenNhom,
      'isPublic': instance.isPublic,
    };
