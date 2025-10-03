import 'package:get_storage/get_storage.dart';
import 'package:timos_customer_2025/const/const.dart';
import 'package:timos_customer_2025/models/response/auth/auth_response.dart';
import 'package:timos_customer_2025/models/network/auth/auth_request.dart';
import 'package:timos_customer_2025/base_api/base_repository.dart';
import 'package:timos_customer_2025/enum/enum_request_method.dart';

class AuthService extends BaseRepository {
  static final AuthService _instance = AuthService._internal();
  static final GetStorage _storage = GetStorage();
  
  factory AuthService() => _instance;
  AuthService._internal();
  static UserAccount? _currentUser;
  static String? _accessToken;
  static String? _refreshToken;

  static UserAccount? get currentUser => _currentUser;
  static String? get accessToken => _accessToken;
  static String? get refreshToken => _refreshToken;
  static bool get isLoggedIn => _accessToken != null && _currentUser != null;
  
  static bool get isManager => _currentUser?.isManager() ?? false;
  static bool get isAdmin => _currentUser?.isAdmin() ?? false;
  static bool get isDriver => _currentUser?.isDriver() ?? false;
  static bool get isDispatcher => _currentUser?.isDispatcher() ?? false;
  static String get currentUserRole => _currentUser?.roleName ?? 'Không xác định';

  static Future<void> init() async {
    await GetStorage.init();
    _loadStoredAuth();
  }

  static void _loadStoredAuth() {
    _accessToken = _storage.read(Const.ACCESS_TOKEN);
    _refreshToken = _storage.read(Const.REFRESH_TOKEN);
    
    final userData = _storage.read('user_data');
    if (userData != null) {
      _currentUser = UserAccount.fromJson(Map<String, dynamic>.from(userData));
    }
  }

  static Future<void> _saveAuthData(LoginData loginData) async {
    _accessToken = loginData.accessToken;
    _refreshToken = loginData.refreshToken;
    _currentUser = loginData.taiKhoan;

    await _storage.write(Const.ACCESS_TOKEN, _accessToken);
    await _storage.write(Const.REFRESH_TOKEN, _refreshToken);
    await _storage.write('user_data', _currentUser?.toJson());
    
    Const.username = _currentUser?.tenDangNhap ?? '';
    Const.phoneNumber = _currentUser?.dienThoai ?? '';
    Const.diemThuong = _currentUser?.diemThuong ?? 0;
    Const.ID_NHA_XE = _currentUser?.idNhaXe ?? 0;
  }

  static Future<UserAccount?> signIn({
    required String username,
    required String password,
  }) async {
    try {
      final loginRequest = LoginRequest(
        tenDangNhap: username,
        matKhau: password,
      );

      final response = await _instance.baseCallApi(
        '/api/v1/dangnhap/dangnhap-quanly',
        EnumRequestMethod.post,
        jsonMap: loginRequest.toJson(),
        isToken: false,
      );

      final loginResponse = LoginResponse.fromJson(response);
      
      if (loginResponse.isSuccess && loginResponse.data != null) {
        await _saveAuthData(loginResponse.data!);
        return _currentUser;
      } else {
        throw Exception(loginResponse.message ?? 'Đăng nhập thất bại');
      }
    } catch (e) {
      throw Exception('Đăng nhập thất bại: $e');
    }
  }

  static Future<void> signOut() async {
    try {
      if (_accessToken != null) {
        await _instance.baseCallApi(
          '/api/v1/dangnhap/dangxuat',
          EnumRequestMethod.post,
          jsonMap: {},
          isToken: true,
        );
      }
    } catch (e) {
        print(e);
    } finally {     
      _currentUser = null;
      _accessToken = null;
      _refreshToken = null;
      
      await _storage.remove(Const.ACCESS_TOKEN);
      await _storage.remove(Const.REFRESH_TOKEN);
      await _storage.remove('user_data');
      
      Const.username = '';
      Const.phoneNumber = '';
      Const.diemThuong = 0;
      Const.ID_NHA_XE = 0;
    }
  }



  static Future<dynamic> makeAuthenticatedRequest(
    String endpoint, {
    String method = 'GET',
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    if (!isLoggedIn) {
      throw Exception('User not authenticated');
    }

    try {
      final response = await _instance.baseCallApi(
        endpoint,
        method.toUpperCase(),
        jsonMap: data,
        isToken: true,
      );
      
      return response;
    } catch (e) {
      final refreshSuccess = await refreshAccessToken();
      
      if (refreshSuccess) {
        final response = await _instance.baseCallApi(
          endpoint,
          method.toUpperCase(),
          jsonMap: data,
          isToken: true,
        );
        
        return response;
      } else {
        throw Exception('Session expired. Please login again.');
      }
    }
  }

  static Future<bool> refreshAccessToken() async {
    if (_refreshToken == null || _accessToken == null) return false;
    
    try {
      final refreshRequest = RefreshTokenRequest(
        refreshToken: _refreshToken!,
      );

      final response = await _instance.baseCallApi(
        '/api/v1/dangnhap/refresh-token',
        EnumRequestMethod.post,
        jsonMap: refreshRequest.toJson(),
        isToken: true,
      );

      final refreshResponse = RefreshTokenResponse.fromJson(response);
      
      if (refreshResponse.isSuccess && refreshResponse.data != null) {
        _accessToken = refreshResponse.data!.accessToken;
        _refreshToken = refreshResponse.data!.refreshToken;
        
        await _storage.write(Const.ACCESS_TOKEN, _accessToken);
        await _storage.write(Const.REFRESH_TOKEN, _refreshToken);
        
        return true;
      } else {
        await signOut();
        return false;
      }
    } catch (e) {
      await signOut();
      return false;
    }
  }
}

extension UserAccountExtension on UserAccount {
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tenDangNhap': tenDangNhap,
      'dienThoai': dienThoai,
      'email': email,
      'hoTen': hoTen,
      'chucVu': chucVu,
      'idNhaXe': idNhaXe,
      'diemThuong': diemThuong,
      'lienKetTrungChuyen': lienKetTrungChuyen,
      'truongHoacPhoNhom': truongHoacPhoNhom,
    };
  }
}