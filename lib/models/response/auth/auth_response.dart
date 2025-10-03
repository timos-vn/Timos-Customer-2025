import 'package:freezed_annotation/freezed_annotation.dart';
import '../../enum/chuc_vu.dart';

part 'auth_response.freezed.dart';
part 'auth_response.g.dart';

@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    LoginData? data,
    @Default(0) int statusCode,
    String? message,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

extension LoginResponseX on LoginResponse {
  bool get isSuccess => statusCode == 200 && data != null;
}

@freezed
class LoginData with _$LoginData {
  const factory LoginData({
    @Default('') String accessToken,
    @Default('') String refreshToken,
    required UserAccount taiKhoan,
  }) = _LoginData;

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);
}

@freezed
class UserAccount with _$UserAccount {
  const factory UserAccount({
    @Default('') String id,
    @Default('') String tenDangNhap,
    String? dienThoai,
    String? email,
    String? hoTen,
    @Default(0) int chucVu,
    @Default(0) int idNhaXe,
    @Default(0) int diemThuong,
    @Default(false) bool lienKetTrungChuyen,
    @Default(false) bool truongHoacPhoNhom,
  }) = _UserAccount;

  factory UserAccount.fromJson(Map<String, dynamic> json) =>
      _$UserAccountFromJson(json);
}

extension UserAccountX on UserAccount {
  ChucVu? get chucVuEnum => ChucVu.fromValue(chucVu);
  
  bool isManager() => chucVuEnum?.isManager ?? false;
  bool isAdmin() => chucVuEnum?.isAdmin ?? false;
  bool isDriver() => chucVuEnum?.isDriver ?? false;
  bool isDispatcher() => chucVuEnum?.isDispatcher ?? false;
  
  String get roleName => chucVuEnum?.displayName ?? 'Không xác định';
}

@freezed
class RefreshTokenResponse with _$RefreshTokenResponse {
  const factory RefreshTokenResponse({
    RefreshTokenData? data,
    @Default(0) int statusCode,
    String? message,
  }) = _RefreshTokenResponse;

  factory RefreshTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenResponseFromJson(json);
}

extension RefreshTokenResponseX on RefreshTokenResponse {
  bool get isSuccess => statusCode == 200 && data != null;
}

@freezed
class RefreshTokenData with _$RefreshTokenData {
  const factory RefreshTokenData({
    @Default('') String accessToken,
    @Default('') String refreshToken,
  }) = _RefreshTokenData;

  factory RefreshTokenData.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenDataFromJson(json);
}