import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timos_customer_2025/screen/booking_ticket/booking/model/ticket_detail_model.dart';
import 'package:timos_customer_2025/screen/booking_ticket/ticket_price/bloc/ticket_price_bloc.dart';
import 'package:timos_customer_2025/screen/booking_ticket/ticket_price/bloc/ticket_price_event.dart';
import 'package:timos_customer_2025/screen/booking_ticket/ticket_price/bloc/ticket_price_state.dart';
import 'package:timos_customer_2025/screen/utils/widget/utils_widget.dart';
import 'package:timos_customer_2025/utils/date_utils.dart';
import 'package:timos_customer_2025/utils/utils.dart';

import '../../routers/router_generator.dart';

class TicketPriceScreen extends StatefulWidget {
  final TicketDetailModel ticketDetailModel;

  const TicketPriceScreen(this.ticketDetailModel, {super.key});

  @override
  State<TicketPriceScreen> createState() => _TicketPriceScreenState();
}

class _TicketPriceScreenState extends State<TicketPriceScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TicketPriceBloc()
        ..add(
          GetTypeTicketBusEvent(
            loaiHinhDichVu: 0,
            idTinhDi: widget.ticketDetailModel.idDiemLen ?? "",
            idTinhDen: widget.ticketDetailModel.idDiemXuong ?? "",
            gioDi: widget.ticketDetailModel.departureDate ?? DateTime.now(),
            loaiXe: 0,
            ngayChay: widget.ticketDetailModel.departureDate ?? DateTime.now(),
            tuKhoa: "",
          ),
        ),
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UtilsWidget.buildText(
                  text:
                      "${widget.ticketDetailModel.pickup} - ${widget.ticketDetailModel.dropoff}",
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              UtilsWidget.buildText(
                text:
                    "${convertDateToString(widget.ticketDetailModel.departureDate, pattern1)} - ${widget.ticketDetailModel.numCustomers} Hành khách",
                fontSize: 14,
                textColor: Colors.grey[600],
              ),
            ],
          ),
        ),
        body: BlocBuilder<TicketPriceBloc, TicketPriceState>(
            builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView.separated(
              itemBuilder: (context, index) {
                final item = state.listTuyen[index];
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        widget.ticketDetailModel.idChang = item.idChang;
                        widget.ticketDetailModel.idVanPhongDon =
                            item.idVanPhongDon;
                        widget.ticketDetailModel.idVanPhongTra = item.idVanPhongTra;
                        // Navigator.push(
                        //   context,
                        //     MaterialPageRoute(
                        //       builder: (context) => RoadTripScreen(
                        //         typeTicketBusModel: state.typeTicketBusModel,
                        //         thongTinTuyenDuong: item,
                        //         ticketDetailModel: widget.ticketDetailModel,
                        //       ),
                        //     )
                        // );
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
              itemCount: state.listTuyen.length,
            ),
          );
        }),
      ),
    );
  }
}
