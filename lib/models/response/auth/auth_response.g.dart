// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginResponseImpl _$$LoginResponseImplFromJson(Map<String, dynamic> json) =>
    _$LoginResponseImpl(
      data: json['data'] == null
          ? null
          : LoginData.fromJson(json['data'] as Map<String, dynamic>),
      statusCode: (json['statusCode'] as num?)?.toInt() ?? 0,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$LoginResponseImplToJson(_$LoginResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'statusCode': instance.statusCode,
      'message': instance.message,
    };

_$LoginDataImpl _$$LoginDataImplFromJson(Map<String, dynamic> json) =>
    _$LoginDataImpl(
      accessToken: json['accessToken'] as String? ?? '',
      refreshToken: json['refreshToken'] as String? ?? '',
      taiKhoan: UserAccount.fromJson(json['taiKhoan'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LoginDataImplToJson(_$LoginDataImpl instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'taiKhoan': instance.taiKhoan,
    };

_$UserAccountImpl _$$UserAccountImplFromJson(Map<String, dynamic> json) =>
    _$UserAccountImpl(
      id: json['id'] as String? ?? '',
      tenDangNhap: json['tenDangNhap'] as String? ?? '',
      dienThoai: json['dienThoai'] as String?,
      email: json['email'] as String?,
      hoTen: json['hoTen'] as String?,
      chucVu: (json['chucVu'] as num?)?.toInt() ?? 0,
      idNhaXe: (json['idNhaXe'] as num?)?.toInt() ?? 0,
      diemThuong: (json['diemThuong'] as num?)?.toInt() ?? 0,
      lienKetTrungChuyen: json['lienKetTrungChuyen'] as bool? ?? false,
      truongHoacPhoNhom: json['truongHoacPhoNhom'] as bool? ?? false,
    );

Map<String, dynamic> _$$UserAccountImplToJson(_$UserAccountImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tenDangNhap': instance.tenDangNhap,
      'dienThoai': instance.dienThoai,
      'email': instance.email,
      'hoTen': instance.hoTen,
      'chucVu': instance.chucVu,
      'idNhaXe': instance.idNhaXe,
      'diemThuong': instance.diemThuong,
      'lienKetTrungChuyen': instance.lienKetTrungChuyen,
      'truongHoacPhoNhom': instance.truongHoacPhoNhom,
    };

_$RefreshTokenResponseImpl _$$RefreshTokenResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$RefreshTokenResponseImpl(
      data: json['data'] == null
          ? null
          : RefreshTokenData.fromJson(json['data'] as Map<String, dynamic>),
      statusCode: (json['statusCode'] as num?)?.toInt() ?? 0,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$RefreshTokenResponseImplToJson(
        _$RefreshTokenResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'statusCode': instance.statusCode,
      'message': instance.message,
    };

_$RefreshTokenDataImpl _$$RefreshTokenDataImplFromJson(
        Map<String, dynamic> json) =>
    _$RefreshTokenDataImpl(
      accessToken: json['accessToken'] as String? ?? '',
      refreshToken: json['refreshToken'] as String? ?? '',
    );

Map<String, dynamic> _$$RefreshTokenDataImplToJson(
        _$RefreshTokenDataImpl instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
