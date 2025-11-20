import 'package:equatable/equatable.dart';
import 'package:timos_customer_2025/screen/booking_ticket/booking/model/vehicle_type_model.dart';

class BookingState extends Equatable {
  final int tabIndex;
  final bool isRoundTrip;
  final String pickup;
  final String pickupDetail; // Thêm trường này cần chi tiết hơn về điểm đón
  final String dropoff;
  final String dropoffDetail; // Thêm trường này cần chi tiết hơn về điểm trả
  final DateTime departureDate; // ngày đi
  final DateTime returnDate; // ngày về
  final int numCustomers;
  final String nameNumCustomers;
  final DatumVehicle? selectedVehicleType; // loại xe

  final String idDiemLen; // id điểm lẻ lên
  final String idDiemXuong; // id điểm lẻ xuống

  final List<DatumVehicle> listVehicleType;


  // final List<GoiY> listSuggest;

  const BookingState({
    this.tabIndex = 0,
    this.isRoundTrip = false,
    this.pickup = "Chọn điểm đón",
    this.pickupDetail = "",
    this.dropoff = "Chọn điểm trả",
    this.dropoffDetail = "",
    required this.departureDate,
    required this.returnDate,
    this.numCustomers = 0,
    this.nameNumCustomers = "Chọn số người",
    this.selectedVehicleType,
    this.listVehicleType = const [],
    // this.userModel,
    // this.listSuggest = const [],
    this.idDiemLen = "",
    this.idDiemXuong = "",
  });

  BookingState copyWith({
    int? tabIndex,
    bool? isRoundTrip,
    String? pickup,
    String? dropoff,
    DateTime? departureDate,
    DateTime? returnDate,
    int? numCustomers,
    String? nameNumCustomers,
    String? pickupDetail,
    String? dropoffDetail,
    DatumVehicle? selectedVehicleType,
    List<DatumVehicle>? listVehicleType,
    // UserLoginModel? userModel,
    // List<GoiY>? listSuggest,
    String? idDiemLen,
    String? idDiemXuong,
  }) {
    return BookingState(
      tabIndex: tabIndex ?? this.tabIndex,
      isRoundTrip: isRoundTrip ?? this.isRoundTrip,
      pickup: pickup ?? this.pickup,
      dropoff: dropoff ?? this.dropoff,
      departureDate: departureDate ?? this.departureDate,
      returnDate: returnDate ?? this.returnDate,
      numCustomers: numCustomers ?? this.numCustomers,
      nameNumCustomers: nameNumCustomers ?? this.nameNumCustomers,
      pickupDetail: pickupDetail ?? this.pickupDetail,
      dropoffDetail: dropoffDetail ?? this.dropoffDetail,
      selectedVehicleType: selectedVehicleType ?? this.selectedVehicleType,
      listVehicleType: listVehicleType ?? this.listVehicleType,
      // userModel: userModel ?? this.userModel,
      // listSuggest: listSuggest ?? this.listSuggest,
      idDiemLen: idDiemLen ?? this.idDiemLen,
      idDiemXuong: idDiemXuong ?? this.idDiemXuong,
    );
  }

  @override
  List<Object?> get props => [
    tabIndex,
    isRoundTrip,
    pickup,
    dropoff,
    departureDate,
    returnDate,
    numCustomers,
    nameNumCustomers,
    pickupDetail,
    dropoffDetail,
    selectedVehicleType,
    listVehicleType,
    // userModel,
    // listSuggest
  ];
}