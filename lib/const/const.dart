// import 'package:timos_customer_2025/models/network/response/promotion_models.dart';

class Const {
  /// DF server

  /// live : https://api.quanly.timos.vn

  /// dev: https://dev.api.quanly.timos.vn
  // ignore: non_constant_identifier_names
  static String HOST_URL = "https://dev.api.quanly.timos.vn";


  static const String urlWebSocket = "https://dev.api.quanly.timos.vn/hubs/ticket";


  // Lấy tỉnh thành từ file ra
  static const String fileDataProvince = "assets/data/data_province.json";

  // ignore: non_constant_identifier_names
  //static TextInputFormatter FORMAT_DECIMA_NUMBER = BlacklistingTextInputFormatter(RegExp('[\\-|\\ |\\/|\\*|\$|\\#|\\+|\\|]'));
  static const String DATE_FORMAT = "dd/MM/yyyy";
  static const String DATE_TIME_FORMAT_LOCAL = "dd/MM/yyyy HH:mm:ss";
  static const String DATE_TIME_FORMAT = "yyyy-MM-dd HH:mm:ss";
  static const String DATE_FORMAT_1 = "dd-MM-yyyy";
  static const String DATE_SV = "yyyy-MM-dd'T'HH:mm:ss";
  static const String DATE_SV_FORMAT = "yyyy/MM/dd";
  static const String DATE_SV_FORMAT_1 = "MM/dd/yyyy";
  static const String DATE_SV_FORMAT_2 = "yyyy-MM-dd";
  static const String DATE = "EEE";
  static const String DAY = "dd";
  static const String YEAR = "yyyy";
  static const String TIME = "hh:mm aa";
  static const String REFRESH = "REFRESH";
  static const String DEFAULT_LANGUAGE = 'Default Language';
  static const String CODE_LANGUAGE = 'Code Lang';
  static const String Name_LANGUAGE = 'Name Lang';
  static const String DEVICE_TOKEN = "Device Token";
  static const String TOPIC = "TOPIC";
  static const String FULL_NAME = "Full Name";
  static const String SEND_OTP_SUCCESS = "Send OTP Success";
  static const int MAX_COUNT_ITEM = 20;

  static const String ACCESS_TOKEN = "Token";
  static const String REFRESH_TOKEN = "Refresh token";
  static const String USER_ID = 'UserId';
  static const String PASS_WORD = 'Password';
  static const String USER_NAME = "User name";
  static const String REMEMBER_ME = "Remember Me";
  static const String CHUC_VU = "Full name";
  static String username = '';
  static int diemThuong = 0;
  static String phoneNumber = '';
  // ignore: non_constant_identifier_names
  static String CURRENT_ADDRESS = 'Current_address';

  static const String CODE_PROMOTION = "CODE";

  // TODO: Add promotion models later
  // static PromotionsEffectiveResponseData promotionsEffectiveResponseData =
  //     const PromotionsEffectiveResponseData();
  // static FindPromotionsResponseData findPromotionsResponseData =
  //     const FindPromotionsResponseData();

  // ignore: non_constant_identifier_names
  static int ID_NHA_XE = 0;
  static String ID_USER = "";

  static double giaTriChietKhau = 0;

  static const String POINT_USER = "Point User";
  static const String PHONE_NUMBER = "Phone number";
  static const String EMAIL = "Email";


  //status error
  static const int error500 = 500;
  static const int error404 = 404;
  static const int error401 = 401;
  static const int error400 = 400;
  static const int error502 = 502;
  static const int error503 = 503;
}
