import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
import 'package:timos_customer_2025/models/response/transfer_station/transfer_station_response.dart';
import 'package:timos_customer_2025/screen/ticket_detail_confirm/bloc/ticket_detail_now_bloc.dart';
import 'package:timos_customer_2025/screen/ticket_detail_confirm/bloc/ticket_detail_now_event.dart';
import 'package:timos_customer_2025/screen/ticket_detail_confirm/bloc/ticket_detail_now_state.dart';
import 'package:timos_customer_2025/screen/ticket_detail_confirm/transfer_station_bottom_sheet.dart';
import 'package:timos_customer_2025/screen/utils/widget/utils_widget.dart';
import 'package:timos_customer_2025/screen/utils/widget/diem_warning_dialog.dart';
import 'package:timos_customer_2025/themes/colors.dart';
import 'package:timos_customer_2025/utils/date_utils.dart';
import 'package:timos_customer_2025/utils/input_widget.dart';
import 'package:timos_customer_2025/utils/utils.dart';
import 'package:timos_customer_2025/bloc_base/service/app_service.dart';
import 'package:timos_customer_2025/services/auth_service.dart';
import 'package:timos_customer_2025/themes/colors.dart' show disableColor, borderColor;

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
      // Trim khoảng trắng khi fill dữ liệu trong mode sửa vé
      textNameController.text = (widget.danhSachGhe?.tenKhachHang ?? "").trim();
      textNumberPhoneController.text = (widget.danhSachGhe?.soDienThoaiKhachHang ?? "").trim();
      diaChiKhachDi.text = (widget.danhSachGhe?.diaChiKhachDi ?? "").trim();
      diaChiKhachDen.text = (widget.danhSachGhe?.diaChiKhachDen ?? "").trim();
    }

    List<GhesDatCho> ghesDatCho = [];
    widget.chiTietGhe?.forEach((ghe) {
      ghesDatCho.add(GhesDatCho(
        tenGhe: ghe.tenGhe,
        hang: ghe.hang,
        day: ghe.day,
        tang: ghe.tang,
      ));
    });

    // _bloc.add(GiuChoEvent(
    //   idLich: widget.detailCoachPaneTrip?.idLichXeLimousine ?? "",
    //   listGhe: ghesDatCho,
    //   idTuyenDuong: widget.coachPaneTripItem.idTuyenDuong,
    //   idNhaXe: widget.coachPaneTripItem.idNhaXe,
    //   idLichChayXe: widget.detailCoachPaneTrip?.idLichChayXe ?? 0,
    //   ngayChay: widget.detailCoachPaneTrip?.ngayChay ?? DateTime.now(),
    // ));
    super.initState();
  }

  TextEditingController textNameController = TextEditingController();
  TextEditingController textNumberPhoneController = TextEditingController();

  final diaChiKhachDi = TextEditingController();
  final diaChiKhachDen = TextEditingController();

  Future<bool> _checkDiemChuyen() async {
    final idNhaXe = AuthService.currentUser?.idNhaXe ?? 0;
    if (idNhaXe == 0) return false;
    
    final appService = AppService();
    final tongDiemResponse = await appService.getTongDiem(idNhaXe);
    
    if (tongDiemResponse == null) return false;
    
    final diemThuong = tongDiemResponse.diemThuong ?? 0;
    final diemChuyen = tongDiemResponse.diemChuyen ?? 0;
    
    if (diemChuyen > 0 && diemThuong < diemChuyen) {
      if (mounted) {
        await DiemWarningDialog.show(
          context,
          title: 'Không đủ điểm để đặt vé',
          message: 'Bạn cần tối thiểu $diemChuyen điểm để đặt vé. '
              'Hiện tại bạn có $diemThuong điểm. Vui lòng mua thêm điểm.',
        );
      }
      return false;
    }
    
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            "Chi tiết vé",
            style: GoogleFonts.roboto(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.black87),
        ),
        body: BlocListener<TicketDetailNowBloc, TicketDetailState>(
          listener: (context, state) {
            if (state.bookTicketResponse?.statusCode == 200) {
              // Quay về màn chi tiết chuyến và reload dữ liệu (cho cả đặt vé mới và sửa vé)
              Navigator.pop(context, true); // Trả về true để báo hiệu cần reload
              if(state.codeScreen == 1) {
                Utils.showMyToast(context, 'Thành công! Đặt vé thành công.');
              } else if(state.codeScreen == 2) {
                Utils.showMyToast(context, 'Thành công! Cập nhật vé thành công.');
              }
            }
            if (state.bookTicketResponse?.statusCode != 200 &&  state.bookTicketResponse != null && !state.isLoading) {
              if(state.codeScreen == 1) {
                Utils.showMyToast(context, 'Thất bại! Đặt vé không thành công.');
              } else {
                Utils.showMyToast(context, 'Thất bại! Cập nhật không thành công.');
              }

            }
          },
          child: BlocBuilder<TicketDetailNowBloc, TicketDetailState>(
              builder: (context, state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              child: Column(
                children: [
                  _buildTripCard(state.ticketDetailModel),
                  const SizedBox(height: 8),
                  Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(color: Colors.grey[200]!, width: 1)),
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.person_outline, 
                                    size: 18, 
                                    color: colorApp),
                                const SizedBox(width: 6),
                                UtilsWidget.buildText(
                                    text: "Thông tin khách hàng",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: _buildFormField(
                                    label: "Họ và tên",
                                    isRequired: true,
                                    child: InputWidget(
                                      controller: textNameController,
                                      placeholder: 'Nhập họ và tên',
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: colorApp, width: 1.5),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: Colors.grey[300]!, width: 1),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Vui lòng nhập họ và tên';
                                        }
                                        return null;
                                      },
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: colorRed, width: 1.5),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: _buildFormField(
                                    label: "Số điện thoại",
                                    isRequired: true,
                                    child: TextFormField(
                                      controller: textNumberPhoneController,
                                      keyboardType: TextInputType.phone,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                      ],
                                      autovalidateMode: AutovalidateMode.onUserInteraction,
                                      style: GoogleFonts.roboto(fontSize: 15),
                                      decoration: InputDecoration(
                                        hintText: 'Nhập số điện thoại',
                                        hintStyle: GoogleFonts.roboto(
                                          color: disableColor, fontSize: 14),
                                        isDense: false,
                                        contentPadding: const EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 14),
                                        filled: true,
                                        fillColor: Colors.grey[50],
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                              color: colorApp, width: 1.5),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                              color: colorRed, width: 1.5),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                              color: colorRed, width: 1.5),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color: Colors.grey[300]!, width: 1),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Vui lòng nhập số điện thoại';
                                        }
                                        final phoneRegex = RegExp(r'^\d{10,15}$');
                                        if (!phoneRegex.hasMatch(value)) {
                                          return 'Số điện thoại không hợp lệ';
                                        }
                                        return null;
                                      },
                                      onTapOutside: (event) {
                                        FocusManager.instance.primaryFocus?.unfocus();
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            _buildAddressWithTransfer(
                              context: context,
                              label: "Địa chỉ đi",
                              controller: diaChiKhachDi,
                              placeholder: "Nhập địa chỉ đi",
                              isEnabled: state.isTransferPickupEnabled,
                              selectedItem: state.selectedTransferPickup,
                              transferStations: state.transferStations,
                              isLoading: state.isLoadingTransferStations,
                              onToggle: (enabled) {
                                _bloc.add(ToggleTransferPickupEvent(enabled: enabled));
                                if (enabled && state.transferStations.isEmpty) {
                                  _bloc.add(LoadTransferStationsEvent());
                                }
                              },
                              onSelect: (item) {
                                _bloc.add(SelectTransferPickupEvent(item: item));
                              },
                            ),
                            const SizedBox(height: 8),
                            _buildAddressWithTransfer(
                              context: context,
                              label: "Địa chỉ đến",
                              controller: diaChiKhachDen,
                              placeholder: "Nhập địa chỉ đến",
                              isEnabled: state.isTransferDropoffEnabled,
                              selectedItem: state.selectedTransferDropoff,
                              transferStations: state.transferStations,
                              isLoading: state.isLoadingTransferStations,
                              onToggle: (enabled) {
                                _bloc.add(ToggleTransferDropoffEvent(enabled: enabled));
                                if (enabled && state.transferStations.isEmpty) {
                                  _bloc.add(LoadTransferStationsEvent());
                                }
                              },
                              onSelect: (item) {
                                _bloc.add(SelectTransferDropoffEvent(item: item));
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            );
          }),
        ),
        bottomNavigationBar: BlocBuilder<TicketDetailNowBloc, TicketDetailState>(
          builder: (context, state) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: SizedBox(
                    height: 52,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colorApp,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        minimumSize: const Size(double.infinity, 52),
                      ),
                  onPressed: state.isLoading ? null : () async {
                    if (_formKey.currentState?.validate() ?? false) {
                      // Kiểm tra điểm trước khi đặt vé
                      final hasEnoughDiem = await _checkDiemChuyen();
                      if (!hasEnoughDiem) return;

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
                            isTransferPickupEnabled: state.isTransferPickupEnabled,
                            isTransferDropoffEnabled: state.isTransferDropoffEnabled,
                            idNhaTcDon: state.selectedTransferPickup?.value,
                            idNhaTcTra: state.selectedTransferDropoff?.value,
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
                            idLichXe: widget.detailCoachPaneTrip!.idLichXeLimousine.toString(),
                            idChang: ((widget.detailCoachPaneTrip?.danhSachChangDuong ?? []).isNotEmpty ? widget.detailCoachPaneTrip?.danhSachChangDuong.first.id : 0) ?? 0,
                            idLichChayXe: widget.detailCoachPaneTrip?.idLichChayXe ?? 0,
                            idNhaXe: widget.coachPaneTripItem.idNhaXe,
                            isTransferPickupEnabled: state.isTransferPickupEnabled,
                            isTransferDropoffEnabled: state.isTransferDropoffEnabled,
                            idNhaTcDon: state.selectedTransferPickup?.value,
                            idNhaTcTra: state.selectedTransferDropoff?.value,
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
                  child: state.isLoading
                      ? SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.5,
                            valueColor: AlwaysStoppedAnimation<Color>(whiteColor),
                          ),
                        )
                      : Text(
                          widget.isUpdate == true ? "Sửa vé" : "Đặt vé",
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: whiteColor,
                          ),
                        ),
                    ),
                  ),
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
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey[200]!, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: colorApp.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Icon(Icons.confirmation_number,
                          size: 18,
                          color: colorApp),
                    ),
                    const SizedBox(width: 8),
                    UtilsWidget.buildText(
                        text: "Thông tin vé",
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green[50],
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Colors.green[200]!),
                  ),
                  child: Text("Một chiều",
                      style: GoogleFonts.roboto(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: Colors.green[700])),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _buildInfoRow("Tuyến đường:", ticketDetail.pickup ?? ""),
            const SizedBox(height: 8),
            _buildInfoRow("Giờ xuất phát:",
                widget.detailCoachPaneTrip?.gioDi ?? ""),
            const SizedBox(height: 8),
            _buildInfoRow("Ngày xuất phát:", convertDateToString(widget.detailCoachPaneTrip?.ngayChay, pattern1)),
            if(widget.isUpdate ?? false) ...[
              const SizedBox(height: 8),
              for (var e in widget.chiTietGheUpdate ?? {})
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: _buildInfoRow(
                      "Tên ghế:",
                      "${(e.tenGhe ?? "").toUpperCase()} - Hàng ${e.hang}, Dãy ${(e.day ?? 0) + 1}"),
                ),
            ],

            if(!(widget.isUpdate ?? false)) ...[
              const SizedBox(height: 8),
              for (var e in widget.chiTietGhe ?? {})
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: _buildInfoRow(
                      "Tên ghế:", 
                      "${(e.tenGhe ?? "").toUpperCase()} - Hàng ${e.hang}, Dãy ${(e.day ?? 0) + 1}"),
                ),
            ],

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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 90,
          child: Text(label,
              style: GoogleFonts.roboto(
                  fontSize: 13, 
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w400)),
        ),
        Expanded(
          child: Text(value,
              textAlign: TextAlign.right,
              style: GoogleFonts.roboto(
                  fontSize: 13, 
                  fontWeight: FontWeight.w500,
                  color: Colors.black87)),
        ),
      ],
    );
  }

  Widget _buildFormField({
    required String label,
    required Widget child,
    bool isRequired = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: GoogleFonts.roboto(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.grey[700],
              ),
            ),
            if (isRequired) ...[
              const SizedBox(width: 4),
              Text(
                "*",
                style: GoogleFonts.roboto(
                  fontSize: 13,
                  color: colorRed,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ],
        ),
        const SizedBox(height: 6),
        child,
      ],
    );
  }

  Widget _buildTransferCheckbox({
    required BuildContext context,
    required String title,
    required bool isEnabled,
    required TransferStationItem? selectedItem,
    required List<TransferStationItem> transferStations,
    required bool isLoading,
    required Function(bool) onToggle,
    required Function(TransferStationItem?) onSelect,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            final newValue = !isEnabled;
            onToggle(newValue);
            if (newValue) {
              Future.delayed(const Duration(milliseconds: 100), () {
                _showTransferStationBottomSheet(
                  context: context,
                  title: "Chọn thông tin Trung chuyển",
                  transferStations: transferStations,
                  isLoading: isLoading,
                  selectedItem: selectedItem,
                  onSelect: onSelect,
                );
              });
            }
          },
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isEnabled ? colorApp.withOpacity(0.05) : Colors.grey[50],
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: isEnabled ? colorApp.withOpacity(0.3) : Colors.grey[300]!,
                width: 1.5,
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isEnabled ? colorApp : Colors.grey[400]!,
                      width: 2,
                    ),
                    color: isEnabled ? colorApp : Colors.transparent,
                  ),
                  child: isEnabled
                      ? const Icon(Icons.check, 
                          size: 14, 
                          color: Colors.white)
                      : null,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: GoogleFonts.roboto(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: isEnabled ? colorApp : Colors.grey[700],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (isEnabled && selectedItem != null) ...[
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: colorApp.withOpacity(0.2)),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: colorApp.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(Icons.location_on, 
                      size: 16, 
                      color: colorApp),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        selectedItem.text,
                        style: GoogleFonts.roboto(
                          fontSize: 13.5,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      if (selectedItem.value.isNotEmpty) ...[
                        const SizedBox(height: 3),
                        Text(
                          "Mã: ${selectedItem.value}",
                          style: GoogleFonts.roboto(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.edit, size: 16, color: colorApp),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () {
                    _showTransferStationBottomSheet(
                      context: context,
                      title: "Chọn thông tin Trung chuyển",
                      transferStations: transferStations,
                      isLoading: isLoading,
                      selectedItem: selectedItem,
                      onSelect: onSelect,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
        if (isEnabled && selectedItem == null) ...[
          const SizedBox(height: 8),
          InkWell(
            onTap: () {
              _showTransferStationBottomSheet(
                context: context,
                title: "Chọn thông tin Trung chuyển",
                transferStations: transferStations,
                isLoading: isLoading,
                selectedItem: selectedItem,
                onSelect: onSelect,
              );
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.grey[300]!,
                  style: BorderStyle.solid,
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.add_circle_outline, 
                      color: colorApp, 
                      size: 18),
                  const SizedBox(width: 10),
                  Text(
                    "Chọn thông tin trung chuyển",
                    style: GoogleFonts.roboto(
                      fontSize: 13.5,
                      color: colorApp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildAddressWithTransfer({
    required BuildContext context,
    required String label,
    required TextEditingController controller,
    required String placeholder,
    required bool isEnabled,
    required TransferStationItem? selectedItem,
    required List<TransferStationItem> transferStations,
    required bool isLoading,
    required Function(bool) onToggle,
    required Function(TransferStationItem?) onSelect,
  }) {
    final transferTitle = (selectedItem?.text.isNotEmpty == true)
        ? selectedItem!.text
        : "Trung chuyển";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                label,
                style: GoogleFonts.roboto(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[700],
                ),
              ),
            ),
            const SizedBox(width: 6),
            InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () async {
                final enableNext = !isEnabled;
                if (!enableNext) {
                  onToggle(false);
                  onSelect(null);
                  return;
                }
                onToggle(true);
                final result = await _showTransferStationBottomSheet(
                  context: context,
                  title: "Chọn thông tin Trung chuyển",
                  transferStations: transferStations,
                  isLoading: isLoading,
                  selectedItem: selectedItem,
                  onSelect: onSelect,
                );
                if (result != null) {
                  onSelect(result);
                } else {
                  onToggle(false);
                  onSelect(null);
                }
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    transferTitle,
                    style: GoogleFonts.roboto(
                      fontSize: 12.5,
                      color: isEnabled ? colorApp : Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Transform.scale(
                    scale: 0.9,
                    child: Checkbox(
                      visualDensity: const VisualDensity(horizontal: -3, vertical: -3),
                      value: isEnabled,
                      onChanged: (value) async {
                        final enabled = value ?? false;
                        if (!enabled) {
                          onToggle(false);
                          onSelect(null);
                          return;
                        }
                        onToggle(true);
                        final result = await _showTransferStationBottomSheet(
                          context: context,
                          title: "Chọn thông tin Trung chuyển",
                          transferStations: transferStations,
                          isLoading: isLoading,
                          selectedItem: selectedItem,
                          onSelect: onSelect,
                        );
                        if (result != null) {
                          onSelect(result);
                        } else {
                          onToggle(false);
                          onSelect(null);
                        }
                      },
                      activeColor: colorApp,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 4),
        InputWidget(
          controller: controller,
          placeholder: placeholder,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: colorApp, width: 1.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Vui lòng nhập $label'.toLowerCase();
            }
            return null;
          },
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: colorRed, width: 1.5),
          ),
        ),
        if (isEnabled && selectedItem != null) ...[
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: colorApp.withOpacity(0.2)),
            ),
            child: Row(
              children: [
                Container( 
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: colorApp.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(Icons.location_on, size: 16, color: colorApp),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        selectedItem.text,
                        style: GoogleFonts.roboto(
                          fontSize: 13.5,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      if (selectedItem.value.isNotEmpty) ...[
                        const SizedBox(height: 3),
                        Text(
                          "Mã: ${selectedItem.value}",
                          style: GoogleFonts.roboto(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.edit, size: 16, color: colorApp),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () {
                    _showTransferStationBottomSheet(
                      context: context,
                      title: "Chọn thông tin Trung chuyển",
                      transferStations: transferStations,
                      isLoading: isLoading,
                      selectedItem: selectedItem,
                      onSelect: onSelect,
                    );
                  },
                ),
              ],
            ),
          ),
        ] else if (isEnabled && selectedItem == null) ...[
          const SizedBox(height: 8),
          InkWell(
            onTap: () async {
              final result = await _showTransferStationBottomSheet(
                context: context,
                title: "Chọn thông tin Trung chuyển",
                transferStations: transferStations,
                isLoading: isLoading,
                selectedItem: selectedItem,
                onSelect: onSelect,
              );
              if (result != null) {
                onSelect(result);
              } else {
                onToggle(false);
                onSelect(null);
              }
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.grey[300]!,
                  style: BorderStyle.solid,
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.add_circle_outline, color: colorApp, size: 18),
                  const SizedBox(width: 10),
                  Text(
                    "Chọn thông tin trung chuyển",
                    style: GoogleFonts.roboto(
                      fontSize: 13.5,
                      color: colorApp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }

  Future<TransferStationItem?> _showTransferStationBottomSheet({
    required BuildContext context,
    required String title,
    required List<TransferStationItem> transferStations,
    required bool isLoading,
    required TransferStationItem? selectedItem,
    required Function(TransferStationItem?) onSelect,
  }) async {
    if (isLoading || transferStations.isEmpty) {
      // Nếu đang load hoặc chưa có dữ liệu, load lại
      _bloc.add(LoadTransferStationsEvent());
      // Đợi một chút để load xong
      await Future.delayed(const Duration(milliseconds: 500));
      // Lấy state mới nhất
      if (!mounted) return null;
      final currentState = _bloc.state;
      if (currentState.transferStations.isEmpty) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Không thể tải danh sách trung chuyển'),
            ),
          );
        }
        return null;
      }
      // Hiển thị bottom sheet với dữ liệu mới
      final result = await TransferStationBottomSheet.show(
        context,
        title: title,
        items: currentState.transferStations,
        selectedItem: selectedItem,
      );
      if (result != null) {
        onSelect(result);
      }
      return result;
    } else {
      final result = await TransferStationBottomSheet.show(
        context,
        title: title,
        items: transferStations,
        selectedItem: selectedItem,
      );
      if (result != null) {
        onSelect(result);
      }
      return result;
    }
  }
}
