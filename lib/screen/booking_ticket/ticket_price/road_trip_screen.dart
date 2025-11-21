import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timos_customer_2025/screen/booking_ticket/booking/model/ticket_detail_model.dart';
import 'package:timos_customer_2025/screen/booking_ticket/ticket_price/bloc/road_trip_bloc.dart';
import 'package:timos_customer_2025/screen/booking_ticket/ticket_price/bloc/road_trip_event.dart';
import 'package:timos_customer_2025/screen/booking_ticket/ticket_price/bloc/road_trip_state.dart';
import 'package:timos_customer_2025/screen/booking_ticket/ticket_price/model/type_ticket_bus_model.dart';
import 'package:timos_customer_2025/screen/seat/seat_mng_screen.dart';
import 'package:timos_customer_2025/screen/seat_selection/seat_selection_screen.dart';
import 'package:timos_customer_2025/screen/utils/widget/utils_widget.dart';
import 'package:timos_customer_2025/utils/date_utils.dart';
import 'package:timos_customer_2025/utils/utils.dart';


class RoadTripScreen extends StatefulWidget {
  final TypeTicketBusModel? typeTicketBusModel;

  final ThongTinTuyenDuong? thongTinTuyenDuong;

  final TicketDetailModel? ticketDetailModel;

  const RoadTripScreen({
    Key? key,
    required this.typeTicketBusModel,
    required this.thongTinTuyenDuong,
    required this.ticketDetailModel,
  }) : super(key: key);

  @override
  State<RoadTripScreen> createState() => _RoadTripScreenState();
}

class _RoadTripScreenState extends State<RoadTripScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RoadTripBloc()
        ..add(
          InitRoadTripEvent(
            typeTicketBusModel: widget.typeTicketBusModel,
            thongTinTuyenDuong: widget.thongTinTuyenDuong,
          ),
        ),
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UtilsWidget.buildText(
                  text: "${widget.thongTinTuyenDuong?.tenChang}",
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              UtilsWidget.buildText(
                text:
                    "${convertDateToString(widget.ticketDetailModel?.departureDate, pattern1)} - ${widget.ticketDetailModel?.numCustomers} Hành khách",
                fontSize: 14,
                textColor: Colors.grey[600],
              ),
            ],
          ),
        ),
        body: BlocBuilder<RoadTripBloc, RoadTripState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  final item = state.listThongTinTuyenDuongNhax[index];
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          // widget.ticketDetailModel.price = 200000;
                          // Navigator.pushNamed(
                          //     context, RouterGenerator.seatSelection,
                          //     arguments: widget.ticketDetailModel);
                          //
                          // List<SoDoGheLoaiX> soDoGheLoaiXes = state
                          //         .typeTicketBusModel?.data?.soDoGheLoaiXes
                          //         .where((e) => e.idLoaiXe == item.idLoaiXe)
                          //         .toList() ??
                          //     [];

                          List<SoDoGheLoaiX> soDoGheLoaiXes = [];

                          for (var element in state
                                  .typeTicketBusModel?.data?.soDoGheLoaiXes ??
                              []) {
                            if (element.idLoaiXe == item.idLoaiXe &&
                                element.idChang ==
                                    widget.ticketDetailModel?.idChang) {
                              soDoGheLoaiXes.add(element);
                            }
                          }
                          // Navigator.pushNamed(context, RouterGenerator.seatSelection,
                          //     arguments: widget.ticketDetailModel, );

                          print(
                              "Sô ghe loai xe: ${soDoGheLoaiXes.length} ${widget.ticketDetailModel?.idChang}");

                          widget.ticketDetailModel?.idNhaXe = item.idNhaXe;
                          widget.ticketDetailModel?.idLichChayXe =
                              item.idLichChayXe;

                          widget.ticketDetailModel?.idLoaiXe = item.idLoaiXe;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SeatSelectionScreen(
                                  ticketCusModel: widget.ticketDetailModel ??
                                      TicketDetailModel(),
                                  soDoGheLoaiXes: soDoGheLoaiXes,
                                ),
                              ));
                        },
                        child: Container(
                          width: double.infinity,
                          height: 120,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: UtilsWidget.buildText(
                                        text: item.loaiXe,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  UtilsWidget.buildText(
                                    text:
                                        "${Utils.formatTotalMoney(item.giaVe)}đ",
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    textColor: Colors.red,
                                  )
                                ],
                              ),
                              UtilsWidget.buildText(
                                  text: item.tenNhaXe, fontSize: 12),
                              const SizedBox(
                                height: 8,
                              ),
                              UtilsWidget.buildText(
                                text: "Tuyến: ${item.tenTuyenDuong}",
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 12,
                ),
                itemCount: state.listThongTinTuyenDuongNhax.length,
              ),
            );
          },
        ),
      ),
    );
  }
}
