// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) {
  return _LoginResponse.fromJson(json);
}

/// @nodoc
mixin _$LoginResponse {
  LoginData? get data => throw _privateConstructorUsedError;
  int get statusCode => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  /// Serializes this LoginResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginResponseCopyWith<LoginResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginResponseCopyWith<$Res> {
  factory $LoginResponseCopyWith(
          LoginResponse value, $Res Function(LoginResponse) then) =
      _$LoginResponseCopyWithImpl<$Res, LoginResponse>;
  @useResult
  $Res call({LoginData? data, int statusCode, String? message});

  $LoginDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$LoginResponseCopyWithImpl<$Res, $Val extends LoginResponse>
    implements $LoginResponseCopyWith<$Res> {
  _$LoginResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginResponse
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
              as LoginData?,
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

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LoginDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $LoginDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LoginResponseImplCopyWith<$Res>
    implements $LoginResponseCopyWith<$Res> {
  factory _$$LoginResponseImplCopyWith(
          _$LoginResponseImpl value, $Res Function(_$LoginResponseImpl) then) =
      __$$LoginResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LoginData? data, int statusCode, String? message});

  @override
  $LoginDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$LoginResponseImplCopyWithImpl<$Res>
    extends _$LoginResponseCopyWithImpl<$Res, _$LoginResponseImpl>
    implements _$$LoginResponseImplCopyWith<$Res> {
  __$$LoginResponseImplCopyWithImpl(
      _$LoginResponseImpl _value, $Res Function(_$LoginResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? statusCode = null,
    Object? message = freezed,
  }) {
    return _then(_$LoginResponseImpl(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as LoginData?,
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
class _$LoginResponseImpl implements _LoginResponse {
  const _$LoginResponseImpl({this.data, this.statusCode = 0, this.message});

  factory _$LoginResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginResponseImplFromJson(json);

  @override
  final LoginData? data;
  @override
  @JsonKey()
  final int statusCode;
  @override
  final String? message;

  @override
  String toString() {
    return 'LoginResponse(data: $data, statusCode: $statusCode, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginResponseImpl &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, data, statusCode, message);

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginResponseImplCopyWith<_$LoginResponseImpl> get copyWith =>
      __$$LoginResponseImplCopyWithImpl<_$LoginResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginResponseImplToJson(
      this,
    );
  }
}

abstract class _LoginResponse implements LoginResponse {
  const factory _LoginResponse(
      {final LoginData? data,
      final int statusCode,
      final String? message}) = _$LoginResponseImpl;

  factory _LoginResponse.fromJson(Map<String, dynamic> json) =
      _$LoginResponseImpl.fromJson;

  @override
  LoginData? get data;
  @override
  int get statusCode;
  @override
  String? get message;

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginResponseImplCopyWith<_$LoginResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LoginData _$LoginDataFromJson(Map<String, dynamic> json) {
  return _LoginData.fromJson(json);
}

/// @nodoc
mixin _$LoginData {
  String get accessToken => throw _privateConstructorUsedError;
  String get refreshToken => throw _privateConstructorUsedError;
  UserAccount get taiKhoan => throw _privateConstructorUsedError;

  /// Serializes this LoginData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoginData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginDataCopyWith<LoginData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginDataCopyWith<$Res> {
  factory $LoginDataCopyWith(LoginData value, $Res Function(LoginData) then) =
      _$LoginDataCopyWithImpl<$Res, LoginData>;
  @useResult
  $Res call({String accessToken, String refreshToken, UserAccount taiKhoan});

  $UserAccountCopyWith<$Res> get taiKhoan;
}

/// @nodoc
class _$LoginDataCopyWithImpl<$Res, $Val extends LoginData>
    implements $LoginDataCopyWith<$Res> {
  _$LoginDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? taiKhoan = null,
  }) {
    return _then(_value.copyWith(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      taiKhoan: null == taiKhoan
          ? _value.taiKhoan
          : taiKhoan // ignore: cast_nullable_to_non_nullable
              as UserAccount,
    ) as $Val);
  }

  /// Create a copy of LoginData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserAccountCopyWith<$Res> get taiKhoan {
    return $UserAccountCopyWith<$Res>(_value.taiKhoan, (value) {
      return _then(_value.copyWith(taiKhoan: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LoginDataImplCopyWith<$Res>
    implements $LoginDataCopyWith<$Res> {
  factory _$$LoginDataImplCopyWith(
          _$LoginDataImpl value, $Res Function(_$LoginDataImpl) then) =
      __$$LoginDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String accessToken, String refreshToken, UserAccount taiKhoan});

  @override
  $UserAccountCopyWith<$Res> get taiKhoan;
}

/// @nodoc
class __$$LoginDataImplCopyWithImpl<$Res>
    extends _$LoginDataCopyWithImpl<$Res, _$LoginDataImpl>
    implements _$$LoginDataImplCopyWith<$Res> {
  __$$LoginDataImplCopyWithImpl(
      _$LoginDataImpl _value, $Res Function(_$LoginDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? taiKhoan = null,
  }) {
    return _then(_$LoginDataImpl(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      taiKhoan: null == taiKhoan
          ? _value.taiKhoan
          : taiKhoan // ignore: cast_nullable_to_non_nullable
              as UserAccount,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginDataImpl implements _LoginData {
  const _$LoginDataImpl(
      {this.accessToken = '', this.refreshToken = '', required this.taiKhoan});

  factory _$LoginDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginDataImplFromJson(json);

  @override
  @JsonKey()
  final String accessToken;
  @override
  @JsonKey()
  final String refreshToken;
  @override
  final UserAccount taiKhoan;

  @override
  String toString() {
    return 'LoginData(accessToken: $accessToken, refreshToken: $refreshToken, taiKhoan: $taiKhoan)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginDataImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.taiKhoan, taiKhoan) ||
                other.taiKhoan == taiKhoan));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, accessToken, refreshToken, taiKhoan);

  /// Create a copy of LoginData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginDataImplCopyWith<_$LoginDataImpl> get copyWith =>
      __$$LoginDataImplCopyWithImpl<_$LoginDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginDataImplToJson(
      this,
    );
  }
}

abstract class _LoginData implements LoginData {
  const factory _LoginData(
      {final String accessToken,
      final String refreshToken,
      required final UserAccount taiKhoan}) = _$LoginDataImpl;

  factory _LoginData.fromJson(Map<String, dynamic> json) =
      _$LoginDataImpl.fromJson;

  @override
  String get accessToken;
  @override
  String get refreshToken;
  @override
  UserAccount get taiKhoan;

  /// Create a copy of LoginData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginDataImplCopyWith<_$LoginDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserAccount _$UserAccountFromJson(Map<String, dynamic> json) {
  return _UserAccount.fromJson(json);
}

/// @nodoc
mixin _$UserAccount {
  String get id => throw _privateConstructorUsedError;
  String get tenDangNhap => throw _privateConstructorUsedError;
  String? get dienThoai => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get hoTen => throw _privateConstructorUsedError;
  int get chucVu => throw _privateConstructorUsedError;
  int get idNhaXe => throw _privateConstructorUsedError;
  int get diemThuong => throw _privateConstructorUsedError;
  bool get lienKetTrungChuyen => throw _privateConstructorUsedError;
  bool get truongHoacPhoNhom => throw _privateConstructorUsedError;

  /// Serializes this UserAccount to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserAccount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserAccountCopyWith<UserAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAccountCopyWith<$Res> {
  factory $UserAccountCopyWith(
          UserAccount value, $Res Function(UserAccount) then) =
      _$UserAccountCopyWithImpl<$Res, UserAccount>;
  @useResult
  $Res call(
      {String id,
      String tenDangNhap,
      String? dienThoai,
      String? email,
      String? hoTen,
      int chucVu,
      int idNhaXe,
      int diemThuong,
      bool lienKetTrungChuyen,
      bool truongHoacPhoNhom});
}

/// @nodoc
class _$UserAccountCopyWithImpl<$Res, $Val extends UserAccount>
    implements $UserAccountCopyWith<$Res> {
  _$UserAccountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserAccount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tenDangNhap = null,
    Object? dienThoai = freezed,
    Object? email = freezed,
    Object? hoTen = freezed,
    Object? chucVu = null,
    Object? idNhaXe = null,
    Object? diemThuong = null,
    Object? lienKetTrungChuyen = null,
    Object? truongHoacPhoNhom = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      tenDangNhap: null == tenDangNhap
          ? _value.tenDangNhap
          : tenDangNhap // ignore: cast_nullable_to_non_nullable
              as String,
      dienThoai: freezed == dienThoai
          ? _value.dienThoai
          : dienThoai // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      hoTen: freezed == hoTen
          ? _value.hoTen
          : hoTen // ignore: cast_nullable_to_non_nullable
              as String?,
      chucVu: null == chucVu
          ? _value.chucVu
          : chucVu // ignore: cast_nullable_to_non_nullable
              as int,
      idNhaXe: null == idNhaXe
          ? _value.idNhaXe
          : idNhaXe // ignore: cast_nullable_to_non_nullable
              as int,
      diemThuong: null == diemThuong
          ? _value.diemThuong
          : diemThuong // ignore: cast_nullable_to_non_nullable
              as int,
      lienKetTrungChuyen: null == lienKetTrungChuyen
          ? _value.lienKetTrungChuyen
          : lienKetTrungChuyen // ignore: cast_nullable_to_non_nullable
              as bool,
      truongHoacPhoNhom: null == truongHoacPhoNhom
          ? _value.truongHoacPhoNhom
          : truongHoacPhoNhom // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserAccountImplCopyWith<$Res>
    implements $UserAccountCopyWith<$Res> {
  factory _$$UserAccountImplCopyWith(
          _$UserAccountImpl value, $Res Function(_$UserAccountImpl) then) =
      __$$UserAccountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String tenDangNhap,
      String? dienThoai,
      String? email,
      String? hoTen,
      int chucVu,
      int idNhaXe,
      int diemThuong,
      bool lienKetTrungChuyen,
      bool truongHoacPhoNhom});
}

/// @nodoc
class __$$UserAccountImplCopyWithImpl<$Res>
    extends _$UserAccountCopyWithImpl<$Res, _$UserAccountImpl>
    implements _$$UserAccountImplCopyWith<$Res> {
  __$$UserAccountImplCopyWithImpl(
      _$UserAccountImpl _value, $Res Function(_$UserAccountImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserAccount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tenDangNhap = null,
    Object? dienThoai = freezed,
    Object? email = freezed,
    Object? hoTen = freezed,
    Object? chucVu = null,
    Object? idNhaXe = null,
    Object? diemThuong = null,
    Object? lienKetTrungChuyen = null,
    Object? truongHoacPhoNhom = null,
  }) {
    return _then(_$UserAccountImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      tenDangNhap: null == tenDangNhap
          ? _value.tenDangNhap
          : tenDangNhap // ignore: cast_nullable_to_non_nullable
              as String,
      dienThoai: freezed == dienThoai
          ? _value.dienThoai
          : dienThoai // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      hoTen: freezed == hoTen
          ? _value.hoTen
          : hoTen // ignore: cast_nullable_to_non_nullable
              as String?,
      chucVu: null == chucVu
          ? _value.chucVu
          : chucVu // ignore: cast_nullable_to_non_nullable
              as int,
      idNhaXe: null == idNhaXe
          ? _value.idNhaXe
          : idNhaXe // ignore: cast_nullable_to_non_nullable
              as int,
      diemThuong: null == diemThuong
          ? _value.diemThuong
          : diemThuong // ignore: cast_nullable_to_non_nullable
              as int,
      lienKetTrungChuyen: null == lienKetTrungChuyen
          ? _value.lienKetTrungChuyen
          : lienKetTrungChuyen // ignore: cast_nullable_to_non_nullable
              as bool,
      truongHoacPhoNhom: null == truongHoacPhoNhom
          ? _value.truongHoacPhoNhom
          : truongHoacPhoNhom // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserAccountImpl implements _UserAccount {
  const _$UserAccountImpl(
      {this.id = '',
      this.tenDangNhap = '',
      this.dienThoai,
      this.email,
      this.hoTen,
      this.chucVu = 0,
      this.idNhaXe = 0,
      this.diemThuong = 0,
      this.lienKetTrungChuyen = false,
      this.truongHoacPhoNhom = false});

  factory _$UserAccountImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserAccountImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String tenDangNhap;
  @override
  final String? dienThoai;
  @override
  final String? email;
  @override
  final String? hoTen;
  @override
  @JsonKey()
  final int chucVu;
  @override
  @JsonKey()
  final int idNhaXe;
  @override
  @JsonKey()
  final int diemThuong;
  @override
  @JsonKey()
  final bool lienKetTrungChuyen;
  @override
  @JsonKey()
  final bool truongHoacPhoNhom;

  @override
  String toString() {
    return 'UserAccount(id: $id, tenDangNhap: $tenDangNhap, dienThoai: $dienThoai, email: $email, hoTen: $hoTen, chucVu: $chucVu, idNhaXe: $idNhaXe, diemThuong: $diemThuong, lienKetTrungChuyen: $lienKetTrungChuyen, truongHoacPhoNhom: $truongHoacPhoNhom)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserAccountImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.tenDangNhap, tenDangNhap) ||
                other.tenDangNhap == tenDangNhap) &&
            (identical(other.dienThoai, dienThoai) ||
                other.dienThoai == dienThoai) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.hoTen, hoTen) || other.hoTen == hoTen) &&
            (identical(other.chucVu, chucVu) || other.chucVu == chucVu) &&
            (identical(other.idNhaXe, idNhaXe) || other.idNhaXe == idNhaXe) &&
            (identical(other.diemThuong, diemThuong) ||
                other.diemThuong == diemThuong) &&
            (identical(other.lienKetTrungChuyen, lienKetTrungChuyen) ||
                other.lienKetTrungChuyen == lienKetTrungChuyen) &&
            (identical(other.truongHoacPhoNhom, truongHoacPhoNhom) ||
                other.truongHoacPhoNhom == truongHoacPhoNhom));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      tenDangNhap,
      dienThoai,
      email,
      hoTen,
      chucVu,
      idNhaXe,
      diemThuong,
      lienKetTrungChuyen,
      truongHoacPhoNhom);

  /// Create a copy of UserAccount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserAccountImplCopyWith<_$UserAccountImpl> get copyWith =>
      __$$UserAccountImplCopyWithImpl<_$UserAccountImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserAccountImplToJson(
      this,
    );
  }
}

abstract class _UserAccount implements UserAccount {
  const factory _UserAccount(
      {final String id,
      final String tenDangNhap,
      final String? dienThoai,
      final String? email,
      final String? hoTen,
      final int chucVu,
      final int idNhaXe,
      final int diemThuong,
      final bool lienKetTrungChuyen,
      final bool truongHoacPhoNhom}) = _$UserAccountImpl;

  factory _UserAccount.fromJson(Map<String, dynamic> json) =
      _$UserAccountImpl.fromJson;

  @override
  String get id;
  @override
  String get tenDangNhap;
  @override
  String? get dienThoai;
  @override
  String? get email;
  @override
  String? get hoTen;
  @override
  int get chucVu;
  @override
  int get idNhaXe;
  @override
  int get diemThuong;
  @override
  bool get lienKetTrungChuyen;
  @override
  bool get truongHoacPhoNhom;

  /// Create a copy of UserAccount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserAccountImplCopyWith<_$UserAccountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RefreshTokenResponse _$RefreshTokenResponseFromJson(Map<String, dynamic> json) {
  return _RefreshTokenResponse.fromJson(json);
}

/// @nodoc
mixin _$RefreshTokenResponse {
  RefreshTokenData? get data => throw _privateConstructorUsedError;
  int get statusCode => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  /// Serializes this RefreshTokenResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RefreshTokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RefreshTokenResponseCopyWith<RefreshTokenResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefreshTokenResponseCopyWith<$Res> {
  factory $RefreshTokenResponseCopyWith(RefreshTokenResponse value,
          $Res Function(RefreshTokenResponse) then) =
      _$RefreshTokenResponseCopyWithImpl<$Res, RefreshTokenResponse>;
  @useResult
  $Res call({RefreshTokenData? data, int statusCode, String? message});

  $RefreshTokenDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$RefreshTokenResponseCopyWithImpl<$Res,
        $Val extends RefreshTokenResponse>
    implements $RefreshTokenResponseCopyWith<$Res> {
  _$RefreshTokenResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RefreshTokenResponse
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
              as RefreshTokenData?,
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

  /// Create a copy of RefreshTokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RefreshTokenDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $RefreshTokenDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RefreshTokenResponseImplCopyWith<$Res>
    implements $RefreshTokenResponseCopyWith<$Res> {
  factory _$$RefreshTokenResponseImplCopyWith(_$RefreshTokenResponseImpl value,
          $Res Function(_$RefreshTokenResponseImpl) then) =
      __$$RefreshTokenResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RefreshTokenData? data, int statusCode, String? message});

  @override
  $RefreshTokenDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$RefreshTokenResponseImplCopyWithImpl<$Res>
    extends _$RefreshTokenResponseCopyWithImpl<$Res, _$RefreshTokenResponseImpl>
    implements _$$RefreshTokenResponseImplCopyWith<$Res> {
  __$$RefreshTokenResponseImplCopyWithImpl(_$RefreshTokenResponseImpl _value,
      $Res Function(_$RefreshTokenResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of RefreshTokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? statusCode = null,
    Object? message = freezed,
  }) {
    return _then(_$RefreshTokenResponseImpl(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as RefreshTokenData?,
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
class _$RefreshTokenResponseImpl implements _RefreshTokenResponse {
  const _$RefreshTokenResponseImpl(
      {this.data, this.statusCode = 0, this.message});

  factory _$RefreshTokenResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RefreshTokenResponseImplFromJson(json);

  @override
  final RefreshTokenData? data;
  @override
  @JsonKey()
  final int statusCode;
  @override
  final String? message;

  @override
  String toString() {
    return 'RefreshTokenResponse(data: $data, statusCode: $statusCode, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshTokenResponseImpl &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, data, statusCode, message);

  /// Create a copy of RefreshTokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshTokenResponseImplCopyWith<_$RefreshTokenResponseImpl>
      get copyWith =>
          __$$RefreshTokenResponseImplCopyWithImpl<_$RefreshTokenResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RefreshTokenResponseImplToJson(
      this,
    );
  }
}

abstract class _RefreshTokenResponse implements RefreshTokenResponse {
  const factory _RefreshTokenResponse(
      {final RefreshTokenData? data,
      final int statusCode,
      final String? message}) = _$RefreshTokenResponseImpl;

  factory _RefreshTokenResponse.fromJson(Map<String, dynamic> json) =
      _$RefreshTokenResponseImpl.fromJson;

  @override
  RefreshTokenData? get data;
  @override
  int get statusCode;
  @override
  String? get message;

  /// Create a copy of RefreshTokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RefreshTokenResponseImplCopyWith<_$RefreshTokenResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RefreshTokenData _$RefreshTokenDataFromJson(Map<String, dynamic> json) {
  return _RefreshTokenData.fromJson(json);
}

/// @nodoc
mixin _$RefreshTokenData {
  String get accessToken => throw _privateConstructorUsedError;
  String get refreshToken => throw _privateConstructorUsedError;

  /// Serializes this RefreshTokenData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RefreshTokenData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RefreshTokenDataCopyWith<RefreshTokenData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefreshTokenDataCopyWith<$Res> {
  factory $RefreshTokenDataCopyWith(
          RefreshTokenData value, $Res Function(RefreshTokenData) then) =
      _$RefreshTokenDataCopyWithImpl<$Res, RefreshTokenData>;
  @useResult
  $Res call({String accessToken, String refreshToken});
}

/// @nodoc
class _$RefreshTokenDataCopyWithImpl<$Res, $Val extends RefreshTokenData>
    implements $RefreshTokenDataCopyWith<$Res> {
  _$RefreshTokenDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RefreshTokenData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
  }) {
    return _then(_value.copyWith(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RefreshTokenDataImplCopyWith<$Res>
    implements $RefreshTokenDataCopyWith<$Res> {
  factory _$$RefreshTokenDataImplCopyWith(_$RefreshTokenDataImpl value,
          $Res Function(_$RefreshTokenDataImpl) then) =
      __$$RefreshTokenDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String accessToken, String refreshToken});
}

/// @nodoc
class __$$RefreshTokenDataImplCopyWithImpl<$Res>
    extends _$RefreshTokenDataCopyWithImpl<$Res, _$RefreshTokenDataImpl>
    implements _$$RefreshTokenDataImplCopyWith<$Res> {
  __$$RefreshTokenDataImplCopyWithImpl(_$RefreshTokenDataImpl _value,
      $Res Function(_$RefreshTokenDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of RefreshTokenData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
  }) {
    return _then(_$RefreshTokenDataImpl(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RefreshTokenDataImpl implements _RefreshTokenData {
  const _$RefreshTokenDataImpl({this.accessToken = '', this.refreshToken = ''});

  factory _$RefreshTokenDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$RefreshTokenDataImplFromJson(json);

  @override
  @JsonKey()
  final String accessToken;
  @override
  @JsonKey()
  final String refreshToken;

  @override
  String toString() {
    return 'RefreshTokenData(accessToken: $accessToken, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshTokenDataImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, accessToken, refreshToken);

  /// Create a copy of RefreshTokenData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshTokenDataImplCopyWith<_$RefreshTokenDataImpl> get copyWith =>
      __$$RefreshTokenDataImplCopyWithImpl<_$RefreshTokenDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RefreshTokenDataImplToJson(
      this,
    );
  }
}

abstract class _RefreshTokenData implements RefreshTokenData {
  const factory _RefreshTokenData(
      {final String accessToken,
      final String refreshToken}) = _$RefreshTokenDataImpl;

  factory _RefreshTokenData.fromJson(Map<String, dynamic> json) =
      _$RefreshTokenDataImpl.fromJson;

  @override
  String get accessToken;
  @override
  String get refreshToken;

  /// Create a copy of RefreshTokenData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RefreshTokenDataImplCopyWith<_$RefreshTokenDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
