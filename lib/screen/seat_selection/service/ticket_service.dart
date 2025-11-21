
import 'package:timos_customer_2025/base_api/base_repository.dart';
import 'package:timos_customer_2025/screen/booking_ticket/ticket_price/model/book_ticket_model.dart';
import 'package:timos_customer_2025/screen/booking_ticket/ticket_price/model/seating_model.dart';
import 'package:timos_customer_2025/screen/booking_ticket/ticket_price/model/seating_request_model.dart';

class TicketService extends BaseRepository {
  Future<void> bookTicket(BookTicketModel bookTicketModel) async {
    await baseCallApi(
      "https://devapicus.trungchuyenhn.com/api/v2/khach-hang-dat-ve/dat-ve-vang-lai",
      "POST",
      jsonMap: bookTicketModel.toJson(),
      isToken: false,
    );
  }

  Future<SeatingModel> getSeatingPlan(SeatingRequestModel seat) async {
    final response = await baseCallApi(
      "",
      "POST",
      urlOther: "https://devapicus.trungchuyenhn.com/api/v2/khach-hang-dat-ve/so-do-ghe-da-dat",
      isToken: false,
      jsonMap: seat.toJson(),
    );
    return SeatingModel.fromJson(response);
  }

}

//
// "departure_location": "Ga Cổ Loa, Dục Nội, Xã Việt Hùng, Huyện Đông Anh, Thành phố Hà Nội",
// "departure_city": "Thành phố Hà Nội",
// "destination_location": "Thành phố Thái Binh",
// "destination_city": "Thành phố Thái Bình",
// "vehicle_type": "5 chỗ",
// "number_people": 1,
// "rental_form": "ALL",
// "customer_name": "Huy Test ",
// "customer_phone": "0908204880",
// "departure_time": "2025-08-27T02:05:00",
// "price": 105677,
// "tenant_id": 88888,
// "transit_type": 1,
// "status": 1,
// "driver": null,
// "vehicle": null,
// "return_time": "2025-08-26T02:08:00",
// "direction": "TOWWAY",
// "serviceType": "airport",
// "isVat": false

// TicketDetailModel ticketDetail = TicketDetailModel(
//   dropoff: state.dropoff, // điểm trả
//   pickup: state.pickup, // điểm đón
//   pickupDetail: state.pickupDetail, // chi tiết điểm đón
//   dropoffDetail: state.dropoffDetail, // chi tiết điểm trả
//   departureDate: state.departureDate, // ngày đi
//   returnDate: state.returnDate, // ngày về
//   numCustomers: state.numCustomers, // số hành khách
//   isRoundTrip: state.isRoundTrip, // có khứ hồi hay không
//   typeTicket: state.tabIndex == 0
//       ? TypeTicketEnum.veThuong
//       : TypeTicketEnum.veBaoXe,
//   typeCar: state.selectedVehicleType, // loại xe
// );