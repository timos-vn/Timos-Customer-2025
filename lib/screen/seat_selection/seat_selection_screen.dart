import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timos_customer_2025/screen/booking_ticket/booking/model/ticket_detail_model.dart';
import 'package:timos_customer_2025/screen/booking_ticket/ticket_price/model/type_ticket_bus_model.dart';
import 'package:timos_customer_2025/screen/seat_selection/bloc/seat_bloc.dart';
import 'package:timos_customer_2025/screen/seat_selection/bloc/seat_event.dart';
import 'package:timos_customer_2025/screen/seat_selection/bloc/seat_state.dart';
import 'package:timos_customer_2025/screen/ticket_detail_confirm/ticket_detail_now_screen.dart';
import 'package:timos_customer_2025/screen/utils/widget/utils_widget.dart';
import 'package:timos_customer_2025/themes/colors.dart';
import 'package:timos_customer_2025/utils/utils.dart';


class SeatSelectionScreen extends StatefulWidget {
  final TicketDetailModel ticketCusModel;

  final List<SoDoGheLoaiX> soDoGheLoaiXes;

  const SeatSelectionScreen(
      {required this.ticketCusModel, required this.soDoGheLoaiXes, super.key});

  @override
  State<SeatSelectionScreen> createState() => _SeatSelectionScreenState();
}

class _SeatSelectionScreenState extends State<SeatSelectionScreen> {


  // final signalRService = SignalRService();


  int selectedCoach = 1; // toa hiện tại
  // Set<int> selectedSeats = {}; // các ghế đang chọn

  final List<Map<String, dynamic>> coaches = [
    {"id": 1, "name": "Tầng 1", "available": 16},
    // {"id": 2, "name": "Tầng 2", "available": 20},
  ];

  // fake danh sách ghế (30 ghế)

  List<SoDoGheLoaiX> listTang1 = [];

  List<SoDoGheLoaiX> listTang2 = [];

  Set<int> dayTang1 = {};

  Set<SoDoGheLoaiX> soDuocChon = {};

  double tongSoTien = 0;

  @override
  void initState() {
    bool isTang2 = widget.soDoGheLoaiXes.any((e) => e.tang == 1);

    if (isTang2) {
      coaches.add({"id": 2, "name": "Tầng 2", "available": 20});
    }

    listTang1.addAll(widget.soDoGheLoaiXes.where((e) => e.tang == 0).toList());

    listTang2.addAll(widget.soDoGheLoaiXes.where((e) => e.tang == 1).toList());

    for (var seat in listTang1) {
      dayTang1.add(seat.day);
    }


    super.initState();

    // signalRService.startConnection();

    // // Lắng nghe event realtime từ SignalR
    // signalRService.listenTicketUpdates(
    //       (ticketId) {
    //     debugPrint("🎟️ Nhận thông báo vé mới: $ticketId");
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(content: Text("Có vé mới được claim: $ticketId")),
    //     );
    //   },
    //   key: 'TicketClaimed', // trùng với event key server gửi
    // );

  }

  @override
  void dispose() {
    // Đảm bảo ngắt kết nối SignalR khi rời màn hình
    // signalRService.stopConnection();
    super.dispose();
  }

  void tinhTongGiaTien() {
    tongSoTien = 0;
    for (var seat in soDuocChon) {
      tongSoTien += seat.giaVe;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SeatBloc()
        ..add(
          InitSeatEvent(
              idLichXe: "00000000-0000-0000-0000-000000000000",
              idLichXeChay: widget.ticketCusModel.idLichChayXe ?? 0,
              idNhaXe: widget.ticketCusModel.idNhaXe ?? 0,
              idLoaiXe: widget.ticketCusModel.idLoaiXe ?? 0,
              ngayChay: widget.ticketCusModel.departureDate!),
        ),
      child: Scaffold(
        appBar: AppBar(
          title: UtilsWidget.buildText(
              text: "Chọn chỗ ngồi ${widget.ticketCusModel.numCustomers} chỗ",
              fontSize: 18,
              fontWeight: FontWeight.w600),
          leading: const BackButton(),
        ),
        body: Column(
          children: [
            // Chú thích trạng thái ghế
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildLegendBox(
                      color: Colors.white,
                      borderColor: Colors.grey,
                      label: "Chỗ trống"),
                  const SizedBox(width: 16),
                  _buildLegendBox(
                      color: Colors.green.shade50,
                      label: "Chỗ đang chọn",
                      borderColor: Colors.green),
                  const SizedBox(width: 16),
                  _buildLegendBox(
                      color: Colors.grey.shade300,
                      label: "Đã bán",
                      hasBorder: false),
                ],
              ),
            ),

            Expanded(
              child: BlocBuilder<SeatBloc, SeatState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: primaryColor,
                      ),
                    );
                  } else {
                    for(var seat in state.listSeating) {
                      if(seat.tang == 0) {
                        for(var s in listTang1) {
                          if(s.day == seat.day && s.hang == seat.hang && s.tenGhe == seat.tenGhe) {
                            s.isDatGhe = true;
                          }
                        }
                      } else if(seat.tang == 1) {
                        for(var s in listTang2) {
                          if(s.day == seat.day && s.hang == seat.hang && s.tenGhe == seat.tenGhe) {
                            s.isDatGhe = true;
                          }
                        }
                      }
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 6),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Container(
                                    width: 90,
                                    height: 60,
                                    color: Colors.grey.shade100,
                                    child: ListView(
                                      children: coaches.map((c) {
                                        final bool isSelected =
                                            selectedCoach == c["id"];
                                        return GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              selectedCoach = c["id"];
                                            });
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(12),
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 4, horizontal: 6),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(
                                                color: isSelected
                                                    ? Colors.yellow.shade700
                                                    : Colors.grey.shade300,
                                                width: 2,
                                              ),
                                              color: isSelected
                                                  ? Colors.yellow.shade50
                                                  : Colors.white,
                                            ),
                                            child: Column(
                                              children: [
                                                Text(c["name"],
                                                    style: const TextStyle(
                                                        fontWeight: FontWeight.bold)),
                                              ],
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                  ...List.generate(dayTang1.toList().length,
                                      (index) {
                                    final list = listTang1
                                        .where((e) => e.day == index)
                                        .toList();

                                    return Row(
                                      children: [
                                        if(index == 0)...[
                                          const Padding(
                                            padding: EdgeInsets.all(4.0),
                                            child: SizedBox(
                                              width: 60,
                                              height: 60,
                                              child: Center(
                                                  child: Text("Lái xe")),
                                            ),
                                          ),
                                        ],

                                        ...List.generate(list.length,
                                            (index) {
                                          final seat = list[index];
                                          final bool isSold =
                                              list[index].isDatGhe;
                                          final bool isSelected =
                                              soDuocChon.contains(seat);

                                          if (list[index].maLoaiGhe ==
                                              "TAI_XE") {
                                            return const Padding(
                                              padding: EdgeInsets.all(4.0),
                                              child: SizedBox(
                                                width: 60,
                                                height: 60,
                                                child: Center(
                                                    child: Text("Lái xe")),
                                              ),
                                            );
                                          }



                                          return Padding(
                                            padding:
                                                const EdgeInsets.all(4.0),
                                            child: InkWell(
                                              onTap: () {
                                                if(!seat.isDatGhe) {
                                                  setState(() {
                                                    if (isSelected) {
                                                      // Nếu ghế đang được chọn thì bỏ chọn
                                                      soDuocChon.remove(seat);
                                                    } else {
                                                      // Nếu đã chọn đủ số khách thì bỏ ghế đầu tiên trong set
                                                      if (soDuocChon.length >=
                                                          (widget.ticketCusModel
                                                              .numCustomers ??
                                                              1)) {
                                                        // vì Set không có index, ta phải lấy phần tử đầu tiên
                                                        final firstSeat =
                                                            soDuocChon.first;
                                                        soDuocChon.remove(
                                                            firstSeat);
                                                      }
                                                      // Thêm ghế mới
                                                      soDuocChon.add(seat);
                                                    }

                                                    tinhTongGiaTien(); // cập nhật lại tổng tiền
                                                  });
                                                }
                                              },
                                              child: Container(
                                                width: 60,
                                                height: 60,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8),
                                                  border: Border.all(
                                                    color: isSelected
                                                        ? Colors.green
                                                        : Colors
                                                            .grey.shade300,
                                                    width: 2,
                                                  ),
                                                  color: isSold
                                                      ? Colors.grey.shade300
                                                      : isSelected
                                                          ? Colors
                                                              .green.shade50
                                                          : Colors.white,
                                                ),
                                                child: Center(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Text(
                                                          seat.tenGhe
                                                              .toUpperCase(),
                                                          style: TextStyle(
                                                              color: isSold
                                                                  ? Colors
                                                                      .grey
                                                                  : Colors
                                                                      .black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                      if (!isSold)
                                                        Text(
                                                            Utils.formatTotalMoney(
                                                                seat.giaVe),
                                                            style: const TextStyle(
                                                                fontSize:
                                                                    10,
                                                                color: Colors
                                                                    .black54)),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                      ],
                                    );
                                  }),

                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  }
                },
              ),
            ),

            // Tổng cộng + Nút xác nhận
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: Colors.grey.shade300)),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: UtilsWidget.buildText(
                        text:
                            "Tổng cộng: ${Utils.formatTotalMoney(tongSoTien)}đ",
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  ElevatedButton(
                    onPressed: soDuocChon.isEmpty
                        ? null
                        : () {
                            // Navigator.pushNamed(
                            //     context, RouterGenerator.ticketDetail,
                            //     arguments: widget.ticketCusModel);
                            widget.ticketCusModel.price = tongSoTien.toInt();
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => TicketDetailNowScreen(
                            //         ticketDetail: widget.ticketCusModel,
                            //         soDuocChon: soDuocChon,
                            //       ),
                            //     ));
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow.shade700,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                    ),
                    child: UtilsWidget.buildText(
                      text: "Xác nhận",
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildLegendBox({
    required Color color,
    Color? borderColor,
    required String label,
    bool hasBorder = true,
  }) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
            border: hasBorder
                ? Border.all(color: borderColor ?? Colors.black, width: 1)
                : null,
          ),
        ),
        const SizedBox(width: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
