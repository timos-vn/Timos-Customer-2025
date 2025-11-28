import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timos_customer_2025/const/app_dimens.dart';
import 'package:timos_customer_2025/const/app_icon.dart';
import 'package:timos_customer_2025/models/response/response.dart';
import 'package:timos_customer_2025/screen/booking_ticket/booking/model/ticket_detail_model.dart';
import 'package:timos_customer_2025/screen/booking_ticket/ticket_price/model/book_ticket_request.dart';
import 'package:timos_customer_2025/screen/booking_ticket/ticket_price/model/book_ticket_update_rquest.dart';
import 'package:timos_customer_2025/screen/booking_ticket/ticket_price/model/type_ticket_bus_model.dart';
import 'package:timos_customer_2025/screen/ticket_detail_confirm/bloc/ticket_detail_now_bloc.dart';
import 'package:timos_customer_2025/screen/ticket_detail_confirm/bloc/ticket_detail_now_event.dart';
import 'package:timos_customer_2025/screen/ticket_detail_confirm/bloc/ticket_detail_now_state.dart';
import 'package:timos_customer_2025/screen/utils/widget/utils_widget.dart';
import 'package:timos_customer_2025/themes/colors.dart';
import 'package:timos_customer_2025/utils/date_utils.dart';
import 'package:timos_customer_2025/utils/input_widget.dart';
import 'package:timos_customer_2025/utils/utils.dart';

class TicketDetailNowScreen extends StatefulWidget {
  final TicketDetailModel ticketDetail;

  final Set<ChiTietGhe>? chiTietGhe;
  final Set<ChiTietGheUpdate>? chiTietGheUpdate;
  final CoachPaneTripItem coachPaneTripItem;
  final DetailCoachPaneTripData? detailCoachPaneTrip;
  final DanhSachGhe? danhSachGhe;
  final bool? isUpdate;


  const TicketDetailNowScreen(
      {required this.ticketDetail, this.chiTietGhe,
      required this.coachPaneTripItem, this.chiTietGheUpdate,
        this.detailCoachPaneTrip,
        this.danhSachGhe,
        this.isUpdate,
      super.key});

  @override
  State<TicketDetailNowScreen> createState() => _TicketDetailNowScreenState();
}

class _TicketDetailNowScreenState extends State<TicketDetailNowScreen> {
  late final TicketDetailNowBloc _bloc = TicketDetailNowBloc();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _bloc.add(InitDataEvent(ticketDetailModel: widget.ticketDetail));
    if(widget.isUpdate ?? false) {
      textNameController.text = widget.danhSachGhe?.tenKhachHang ?? "";
      textNumberPhoneController.text = widget.danhSachGhe?.soDienThoaiKhachHang ?? "";
      diaChiKhachDi.text = widget.danhSachGhe?.diaChiKhachDi ?? "";
      diaChiKhachDen.text = widget.danhSachGhe?.diaChiKhachDen ?? "";
    }
    super.initState();
  }

  TextEditingController textNameController = TextEditingController();
  TextEditingController textNumberPhoneController = TextEditingController();

  final diaChiKhachDi = TextEditingController();
  final diaChiKhachDen = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: UtilsWidget.buildText(
            text: "Chi tiết vé",
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          centerTitle: true,
        ),
        body: BlocListener<TicketDetailNowBloc, TicketDetailState>(
          listener: (context, state) {
            if (state.bookTicketResponse?.statusCode == 200) {
              // Utils.showCustomToast(context, Icons.check_circle,
              //     'Thành công! Đặt vé thành công.');

              // Navigator.popUntil(context, (route) => route.isFirst);
              // Future.delayed(const Duration(milliseconds: 300), () {
              //
              // });
              // Navigator.pop(context);
              // Navigator.popUntil(context, (route) => route.settings.name == "TRIP_DETAIL");
              Navigator.popUntil(context, (route) => route.isFirst);
              if(state.codeScreen == 1) {
                Utils.showMyToast(context, 'Thành công! Đặt vé thành công.');
              } else if(state.codeScreen == 2) {
                Utils.showMyToast(context, 'Thành công! Cập nhật vé thành công.');
              }
            }
            if (state.bookTicketResponse?.statusCode != 200 &&  state.bookTicketResponse != null && !state.isLoading) {
              Utils.showMyToast(context, 'Thất bại! Đặt vé không thành công.');
            }
          },
          child: BlocBuilder<TicketDetailNowBloc, TicketDetailState>(
              builder: (context, state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  _buildTripCard(state.ticketDetailModel),
                  const SizedBox(height: 6),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            UtilsWidget.buildText(
                                text: "Thông tin khách hàng",
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                            const SizedBox(height: 4),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text("Họ và tên",
                                        style: GoogleFonts.roboto(
                                            fontSize: 14,
                                            color: Colors.grey[700])),
                                    Text(" *",
                                        style: GoogleFonts.roboto(
                                            fontSize: 14, color: Colors.red)),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                InputWidget(
                                  controller: textNameController,
                                  placeholder: 'Họ và tên',
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        AppDimens.normalInputBorderRadius),
                                    borderSide: const BorderSide(
                                        color: colorApp, width: 1),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Vui lòng nhập họ và tên';
                                    }
                                    return null;
                                  },
                                  // enabledBorder: OutlineInputBorder(
                                  //   borderRadius: BorderRadius.circular(
                                  //       AppDimens.normalInputBorderRadius),
                                  //   borderSide:
                                  //       const BorderSide(color: Colors.grey, width: 1),
                                  // ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        AppDimens.normalInputBorderRadius),
                                    borderSide: const BorderSide(
                                        color: colorRed, width: 1),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text("Số điện thoại",
                                        style: GoogleFonts.roboto(
                                            fontSize: 14,
                                            color: Colors.grey[700])),
                                    Text(" *",
                                        style: GoogleFonts.roboto(
                                            fontSize: 14, color: colorRed)),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                InputWidget(
                                  controller: textNumberPhoneController,
                                  placeholder: 'Số điện thoại',
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        AppDimens.normalInputBorderRadius),
                                    borderSide: const BorderSide(
                                        color: colorApp, width: 1),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Vui lòng nhập số điện thoại';
                                    }
                                    // Kiểm tra định dạng số điện thoại
                                    final phoneRegex = RegExp(r'^\d{10,15}$');
                                    if (!phoneRegex.hasMatch(value)) {
                                      return 'Số điện thoại không hợp lệ';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text("Địa chỉ đi",
                                        style: GoogleFonts.roboto(
                                            fontSize: 14,
                                            color: Colors.grey[700])),
                                    Text(" *",
                                        style: GoogleFonts.roboto(
                                            fontSize: 14, color: colorRed)),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                InputWidget(
                                  controller: diaChiKhachDi,
                                  placeholder: 'Địa chỉ đi',
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        AppDimens.normalInputBorderRadius),
                                    borderSide: const BorderSide(
                                        color: colorApp, width: 1),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Vui lòng nhập địa chỉ đi';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text("Địa chỉ đến",
                                        style: GoogleFonts.roboto(
                                            fontSize: 14,
                                            color: Colors.grey[700])),
                                    Text(" *",
                                        style: GoogleFonts.roboto(
                                            fontSize: 14, color: colorRed)),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                InputWidget(
                                  controller: diaChiKhachDen,
                                  placeholder: 'Địa chỉ đến',
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        AppDimens.normalInputBorderRadius),
                                    borderSide: const BorderSide(
                                        color: colorApp, width: 1),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Vui lòng nhập địa chỉ đến';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            );
          }),
        ),
        bottomNavigationBar: BlocBuilder<TicketDetailNowBloc, TicketDetailState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              child: SizedBox(
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorApp,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState?.validate() ?? false) {

                      if(widget.isUpdate ?? false) {
                        final idDevice = "";
                        _bloc.add(
                          BookTicketUpdateEvent(
                            ticketDetailModel: widget.ticketDetail,
                            nameCustomer: textNameController.text.trim(),
                            phoneCustomer: textNumberPhoneController.text.trim(),
                            idDevice: idDevice ?? "",
                            chiTietGhe: widget.chiTietGheUpdate ?? {},
                            diaChiDi: diaChiKhachDi.text.trim(),
                            diaChiDen: diaChiKhachDen.text.trim(),
                            idLichXe: widget.coachPaneTripItem.id,
                            idChang: ((widget.detailCoachPaneTrip?.danhSachChangDuong ?? []).isNotEmpty ? widget.detailCoachPaneTrip?.danhSachChangDuong.first.id : 0) ?? 0,
                            idLichChayXe: widget.detailCoachPaneTrip?.idLichChayXe ?? 0,
                            idNhaXe: widget.coachPaneTripItem.idNhaXe,
                            maDatCho: widget.danhSachGhe?.maDatCho.toInt() ?? 0,
                          ),
                        );
                      } else {
                        final idDevice = "";
                        _bloc.add(
                          BookTicketEvent(
                            ticketDetailModel: widget.ticketDetail,
                            nameCustomer: textNameController.text.trim(),
                            phoneCustomer: textNumberPhoneController.text.trim(),
                            idDevice: idDevice ?? "",
                            chiTietGhe: widget.chiTietGhe ?? {},
                            diaChiDi: diaChiKhachDi.text.trim(),
                            diaChiDen: diaChiKhachDen.text.trim(),
                            idLichXe: widget.coachPaneTripItem.id,
                            idChang: ((widget.detailCoachPaneTrip?.danhSachChangDuong ?? []).isNotEmpty ? widget.detailCoachPaneTrip?.danhSachChangDuong.first.id : 0) ?? 0,
                            idLichChayXe: widget.detailCoachPaneTrip?.idLichChayXe ?? 0,
                            idNhaXe: widget.coachPaneTripItem.idNhaXe,
                          ),
                        );
                      }

                    } else {
                      log("Vui lòng điền đầy đủ thông tin.");
                      if (!mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Vui lòng điền đầy đủ thông tin.')),
                      );
                    }
                  },
                  child: state.isLoading ? CircularProgressIndicator(): UtilsWidget.buildText(
                      text: "Đặt vé",
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      textColor: whiteColor),
                ),
              ),
            );
          }
        ),
      ),
    );
  }

  // Future<String?> getDeviceId() async {
  //   final deviceInfo = DeviceInfoPlugin();
  //
  //   try {
  //     if (GetPlatform.isAndroid) {
  //       print("GetPlatform.isAndroid");
  //       // Android
  //       final androidInfo = await deviceInfo.androidInfo;
  //       return androidInfo.id; // Android ID (không unique tuyệt đối)
  //       // Hoặc dùng: androidInfo.serialNumber (API 29 trở xuống)
  //     } else if (GetPlatform.isIOS) {
  //       // iOS
  //       print("GetPlatform.isIOS");
  //       final iosInfo = await deviceInfo.iosInfo;
  //       return iosInfo.identifierForVendor; // UUID unique cho mỗi app vendor
  //     }
  //   } catch (e) {
  //     print("Lỗi lấy device id: $e");
  //   }
  //
  //   return null;
  // }

  Widget _buildTripCard(TicketDetailModel ticketDetail) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UtilsWidget.buildText(
                    text: "Thông tin vé",
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text("Một chiều",
                      style: GoogleFonts.roboto(
                          fontSize: 12, color: Colors.green[700])),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const SizedBox(height: 4),
            _buildInfoRow("Tuyến đường:", ticketDetail.pickup ?? ""),
            const SizedBox(height: 4),
            _buildInfoRow("Giờ xuất phát:",
                widget.detailCoachPaneTrip?.gioDi ?? ""),
            _buildInfoRow("Ngày xuất phát:",
                convertDateToString(widget.detailCoachPaneTrip?.ngayChay, pattern1)),
            Visibility(
              visible: ticketDetail.isRoundTrip ?? false,
              child: _buildInfoRow("Giờ về:",
                  convertDateToString(ticketDetail.returnDate, pattern13)),
            ),
            Visibility(
              visible: ticketDetail.isRoundTrip ?? false,
              child: _buildInfoRow("Ngày về:",
                  convertDateToString(ticketDetail.returnDate, pattern1)),
            ),
            if(widget.isUpdate ?? false) ... [
              ... (widget.chiTietGheUpdate ?? {} ).toList().map((e) => _buildInfoRow(
                  "Tên ghế:", "${(e.tenGhe ?? "").toUpperCase()} Hàng ${e.hang} Dãy ${(e.day ?? 0) + 1}")),
            ],

            if(!(widget.isUpdate ?? false)) ... [
              ... (widget.chiTietGhe ?? {} ).toList().map((e) => _buildInfoRow(
                  "Tên ghế:", "${(e.tenGhe ?? "").toUpperCase()} Hàng ${e.hang} Dãy ${(e.day ?? 0) + 1}")),
            ]

            // _buildInfoRow(
            //     "Tên ghế", "${ticketDetail.typeCar?.tenLoai} ngồi"),
            // _buildInfoRow("Email:", ""),
            // const SizedBox(height: 4),
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Row(
            //       children: [
            //         Text("Họ và tên",
            //             style: GoogleFonts.roboto(
            //                 fontSize: 14, color: Colors.grey[700])),
            //         Text(" *",
            //             style: GoogleFonts.roboto(
            //                 fontSize: 14, color: colorRed)),
            //       ],
            //     ),
            //     const SizedBox(height: 4),
            //     InputWidget(
            //       // controller: textEditingController,
            //       placeholder: 'Họ và tên',
            //       focusedBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(
            //             AppDimens.normalInputBorderRadius),
            //         borderSide: const BorderSide(color: colorApp, width: 1),
            //       ),
            //       validator: (value) {
            //         if (value == null || value.isEmpty) {
            //           return 'Vui lòng nhập họ và tên';
            //         }
            //         return null;
            //       },
            //       // enabledBorder: OutlineInputBorder(
            //       //   borderRadius: BorderRadius.circular(
            //       //       AppDimens.normalInputBorderRadius),
            //       //   borderSide:
            //       //       const BorderSide(color: Colors.grey, width: 1),
            //       // ),
            //       errorBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(
            //             AppDimens.normalInputBorderRadius),
            //         borderSide: const BorderSide(color: colorRed, width: 1),
            //       ),
            //     ),
            //   ],
            // ),
            // const SizedBox(height: 4),
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Row(
            //       children: [
            //         Text("Số điện thoại",
            //             style: GoogleFonts.roboto(
            //                 fontSize: 14, color: Colors.grey[700])),
            //         Text(" *",
            //             style: GoogleFonts.roboto(
            //                 fontSize: 14, color: colorRed)),
            //       ],
            //     ),
            //     const SizedBox(height: 4),
            //     InputWidget(
            //       // controller: textEditingController,
            //       placeholder: 'Số điện thoại',
            //       focusedBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(
            //             AppDimens.normalInputBorderRadius),
            //         borderSide: const BorderSide(color: colorApp, width: 1),
            //       ),
            //       validator: (value) {
            //         if (value == null || value.isEmpty) {
            //           return 'Vui lòng nhập số điện thoại';
            //         }
            //         // Kiểm tra định dạng số điện thoại
            //         final phoneRegex = RegExp(r'^\d{10,15}$');
            //         if (!phoneRegex.hasMatch(value)) {
            //           return 'Số điện thoại không hợp lệ';
            //         }
            //         return null;
            //       },
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }

  Widget _buildQRCodeCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // QrImageView(
            //   data: "250810-5019317|TK83be06591d4a7e6931e81a651b0c54f",
            //   version: QrVersions.auto,
            //   size: 150,
            // ),
            const SizedBox(height: 8),
            Text(
              "250810-5019317|TK83be06591d4a7e6931e81a651b0c54f",
              style: GoogleFonts.roboto(fontSize: 12),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              "(QR thanh toán quản lý hệ thống)",
              style: GoogleFonts.roboto(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPickupCard() {
    return _buildInfoCard("Điểm đón", [
      _buildInfoRow("Hình thức:", "Tại bến"),
      _buildInfoRow("Điểm khởi hành:", "Bến xe Hào Hương"),
    ]);
  }

  Widget _buildMainBusCard() {
    return _buildInfoCard("Thông tin tài xế", [
      _buildInfoRow("Biển số xe:", "36F - 010.36 Cabin"),
      _buildInfoRow("Tài xế:", "toan A 0355809666"),
      _buildInfoRow("Số điện thoại:", "0355809666"),
      _buildInfoRow("Loại xe:", "Audi A6 - 5 chỗ - Màu trắng"),
      const SizedBox(
        height: 4,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SvgPicture.asset(AppIcons.iconPhone),
          const SizedBox(width: 16),
          SvgPicture.asset(AppIcons.iconMess),
        ],
      ),
    ]);
  }

  Widget _buildDropOffCard() {
    return _buildInfoCard("Điểm trả", [
      _buildInfoRow("Hình thức:", "Tại nhà (Tận nơi)"),
      _buildInfoRow("Địa chỉ:", "aaaaa"),
    ]);
  }

  Widget _buildTransferCard() {
    return _buildInfoCard("Trung chuyển trả", [
      _buildInfoRow("Biển số xe:", ""),
      _buildInfoRow("Điểm trả:", "aaaaa"),
      _buildInfoRow("Tài xế:", ""),
      _buildInfoRow("Số điện thoại:", ""),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(Icons.phone, color: Colors.green[700]),
          const SizedBox(width: 16),
          Icon(Icons.message, color: Colors.blue[700]),
        ],
      ),
    ]);
  }

  Widget _buildInfoCard(String title, List<Widget> children) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: GoogleFonts.roboto(
                    fontSize: 16, fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: GoogleFonts.roboto(fontSize: 14, color: Colors.grey[700])),
          Text(value,
              style: GoogleFonts.roboto(
                  fontSize: 14, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
