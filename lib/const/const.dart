// import 'package:timos_customer_2025/models/network/response/promotion_models.dart';

class Const {
  /// DF server

  /// live : https://apicus.trungchuyenhn.com

  /// dev: https://devapicus.trungchuyenhn.com
  // ignore: non_constant_identifier_names
  static String HOST_URL = "https://dev.api.quanly.timos.vn";
  // static  String HOST_URL = "https://apicus.trungchuyenhn.com";
  // ignore: non_constant_identifier_names
  static int PORT_URL = 0;

  /// DF base URL Dio
  // static const String HOST_GOOGLE_MAP_URL = "https://maps.googleapis.com/maps/api/";
  static const String HOST_GOOGLE_MAP_URL = "https://rsapi.goong.io/";
  //https://rsapi.goong.io/Place/AutoComplete?api_key=2M2M2YDPq6KEHDLpCpdYbzLJyomS6d9DSvbZPM7K&input=hồ%20hoàn%20kiếm
  // static const String PLACE_KEY =//"AIzaSyDD4jhDsa0LDNEbV-8PbgaySS64_pdQZto";
  // "AIzaSyDRm0fBbhT7m22hPbANI8IRBHsilJL8UDI";

  static const ACTION = 0;
  static const HOME = 1;
  static const ACCOUNT = 2;

  static const String ACTION_UPDATE = '1';
  static const String ACTION_DELETE = '4';
  static const String TYPE_ONE = '1';
  static const String TYPE_ALL = '0';

  ///version app
  static String versionApp = '1.0.31';

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

  static double giaTriChietKhau = 0;

  static const String POINT_USER = "Point User";
  static const String PHONE_NUMBER = "Phone number";
  static const String EMAIL = "Email";

  ///banner
  static const List<String> banner = [
    "assets/banner/banner_00.png",
    "assets/banner/banner_01.png",
    "assets/banner/banner_02.png",
    "assets/banner/banner_03.png",
    "assets/banner/banner_04.png",
    "assets/banner/banner_05.png"
  ];

  ///Group time
  static const List<String> dayOfTime = ["Buổi sáng", "Buổi chiều", "Buổi tối"];
  static const List<String> morning = [
    '00:00',
    '01:00',
    '02:00',
    '03:00',
    '04:00',
    '05:00',
    '06:00',
    '07:00',
    '08:00',
    '09:00',
    '10:00',
    '11:00',
  ];
  static const List<String> afternoon = [
    '12:00',
    '13:00',
    '14:00',
    '15:00',
    '16:00',
    '17:00',
    '18:00',
  ];
  static const List<String> tonight = [
    '19:00',
    '20:00',
    '21:00',
    '22:00',
    '23:00',
  ];
  static const List<String> listTime = [
    '00:00',
    '01:00',
    '02:00',
    '03:00',
    '04:00',
    '05:00',
    '06:00',
    '07:00',
    '08:00',
    '09:00',
    '10:00',
    '11:00',
    '12:00',
    '13:00',
    '14:00',
    '15:00',
    '16:00',
    '17:00',
    '18:00',
    '19:00',
    '20:00',
    '21:00',
    '22:00',
    '23:00',
  ];

  ///Type services
  static const List<String> listServices = ["Vé thường", "Bao xe", "Khứ hồi"];

  ///Action & History
  static const List<String> listAction = [
    "Đặt xe",
    "Giao hàng",
    "Vé máy bay",
    "Thanh Toán"
  ];

  ///Voucher
  static const List<String> listVoucher = [
    "Có hiệu lực",
    "Đã sử dụng",
    "Hết hiệu lực"
  ];

  ///Status tickets
  static const int CHUA_XU_LY = 0;
  static const int NHA_XE_CHAP_NHAN_YEU_CAU = 1;
  static const int NHA_XE_HUY_YEU_CAU = 2;
  static const int KHACH_HUY = 2;

  ///Data Air Port
  static var dataAirPort = {
    "data": [
      {
        "title": "Sân Bay Nội Bài - HAN",
        "desc": 'Phú Cường, Sóc Sơn, Hà Nội, Việt Nam',
        "province": "Hà Nội",
        "lat": 21.218934918318205,
        "long": 105.80414943986284
      },
      {
        "title": "Sân Bay Vinh - VII",
        "desc": 'Nghi Liên, Thành Phố Vinh, Nghệ An, Việt Nam',
        "province": "Nghệ An",
        "lat": 10.818610626360796,
        "long": 106.65879231090165
      },
      {
        "title": "Sân Bay Tân Sơn Nhất - SGN",
        "desc": 'Phường 2, Tân Bình, Hồ Chí Minh, Việt Nam',
        "province": "Hồ Chí Minh",
        "lat": 10.818610626360796,
        "long": 106.65879231090165
      },
      {
        "title": "Sân Bay Đà Nẵng - DAD",
        "desc": 'Hoà Thuận Tây, Hải Châu, Đà Nẵng, Việt Nam',
        "province": "Đà Nẵng",
        "lat": 16.053735939625497,
        "long": 108.20303739746139
      },
      {
        "title": "Sân Bay Cần Thơ - VCA",
        "desc": 'Long Hoà, Bình Thuỷ, Cần Thơ, Việt Nam',
        "province": "Cần Thơ",
        "lat": 10.080652104164495,
        "long": 105.71218832623762
      },
      {
        "title": "Sân Bay Vân Đồn - VDO",
        "desc": 'Vẫn Đồn, Quảng Ninh, Việt Nam',
        "province": "Quảng Ninh",
        "lat": 21.116485345551787,
        "long": 107.41879789753222
      },
      {
        "title": "Sân Bay Cam Ranh - CXR",
        "desc": 'Cảm Hải Đông, tp. Cam Ranh, Khánh Hoà, Việt Nam',
        "province": "Khánh Hoà",
        "lat": 12.007777379128267,
        "long": 109.21434116858292
      },
      {
        "title": "Sân Bay Phú Bài - HUI",
        "desc": 'Hương Thuỷ, Thừa Thiên Huế, Việt Nam',
        "province": "Thừa Thiên Huế",
        "lat": 16.39788581304516,
        "long": 107.70067743979469
      },
      {
        "title": "Sân Bay Cát Bi - HPH",
        "desc": 'Cát Bi, Hải An, Hải Phòng, Việt Nam',
        "province": "Hải Phòng",
        "lat": 20.822668160297823,
        "long": 106.72480392821114
      },
      {
        "title": "Sân Bay Buôn Ma Thuột - BMV",
        "desc": '100 Đam San, Hoà Thắng, tp. Buôn Ma Thuột, Việt Nam',
        "province": "Đắk Lắk",
        "lat": 12.6647625436966,
        "long": 108.11762298393089
      },
      {
        "title": "Sân Bay Phú Quốc - PQC",
        "desc": 'Dương Tơ, Phú Quốc, Kiên Giang, Việt Nam',
        "province": "Kiên Giang",
        "lat": 10.162943042297243,
        "long": 103.99812791089654
      },
      {
        "title": "Sân Bay Điện Biên - DIN",
        "desc": 'Tổ 10, Điện Biên, Việt Nam',
        "province": "Điện Biên",
        "lat": 21.40104084558897,
        "long": 103.00595379753663
      },
      {
        "title": "Sân Bay Thọ Xuân - THD",
        "desc": 'TT.Sao Vàng, Thọ Xuân, Thanh Hoá, Việt Nam',
        "province": "Thanh Hoá",
        "lat": 21.400950943896234,
        "long": 103.00651169697976
      },
      {
        "title": "Sân Bay Quốc Tế Chu Lai - VCL",
        "desc": 'Tam Nghĩa, Núi Thành, Quảng Nam, Việt Nam',
        "province": "Quảng Nam",
        "lat": 15.414605204381209,
        "long": 108.70383805512465
      },
      {
        "title": "Sân Bay Phù Cát - UIH",
        "desc": 'Cát Tân, Phù Cát, Bình Định, Việt Nam',
        "province": "Bình Định",
        "lat": 13.9538567982038,
        "long": 109.04842953976666
      },
      {
        "title": "Sân Bay Tuy Hoà - TBB",
        "desc": 'Hùng Vương, Phú Thạnh, Tuy Hoà, Phú Yên, Việt Nam',
        "province": "Phú Yên",
        "lat": 13.04976997778003,
        "long": 109.34455253975743
      },
      {
        "title": "Sân Bay Liên Khương - DLI",
        "desc": 'Liên Nghĩa, Đức Trọng, Lâm Đồng, Việt Nam',
        "province": "Lâm Đồng",
        "lat": 11.750499551697013,
        "long": 108.36811562440342
      },
      {
        "title": "Sân Bay Pleiku - PXU",
        "desc": 'Thống Nhất, tp. Pleiku, Gia Lai, Việt Nam',
        "province": "Gia Lai",
        "lat": 14.007438815856922,
        "long": 108.0047376686026
      },
      {
        "title": "Sân Bay Cà Mau - CAH",
        "desc": 'Lý Thường Kiệt, P6, tp. Cà Mau, Cà Mau, Việt Nam',
        "province": "Cà Mau",
        "lat": 9.175994668042561,
        "long": 105.17562239554748
      },
      {
        "title": "Sân Bay Côn Đảo - VCS",
        "desc": 'Cỏ Ông, Côn Đảo, Bà Rịa - Vũng Tàu, Việt Nam',
        "province": "Bà Rịa - Vũng Tàu",
        "lat": 8.731509279179056,
        "long": 106.62867426855706
      },
      {
        "title": "Sân Bay Rạch Giá - VKG",
        "desc":
            '418 Cách Mạng Tháng 8, Rạch Sỏi, Rạch Giá, Kiên Giang, Việt Nam',
        "province": "Kiên Giang",
        "lat": 19.960031705723404,
        "long": 105.1340715955531
      }
    ],
  };
}
