import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:timos_customer_2025/const/const.dart';
import 'package:timos_customer_2025/models/response/response.dart';
import 'package:timos_customer_2025/screen/booking_ticket/booking/model/ticket_detail_model.dart';
import 'package:timos_customer_2025/screen/booking_ticket/ticket_price/model/book_ticket_update_rquest.dart' show ChiTietGheUpdate;
import 'package:timos_customer_2025/screen/booking_ticket/ticket_price/model/cancel_ticket_request.dart';
import 'package:timos_customer_2025/screen/booking_ticket/ticket_price/model/tao_lich_nha_xe_request.dart';
import 'package:timos_customer_2025/screen/booking_ticket/ticket_price/service/signalr_service.dart';
import 'package:timos_customer_2025/screen/detail_trip/ticket_detail_bottom_sheet.dart';
import 'package:timos_customer_2025/screen/ticket_detail_confirm/ticket_detail_now_screen.dart';
import 'package:timos_customer_2025/themes/colors.dart';
import 'package:timos_customer_2025/screen/utils/widget/utils_widget.dart';
import 'package:timos_customer_2025/utils/date_utils.dart';
import 'package:timos_customer_2025/utils/utils.dart';
import 'package:timos_customer_2025/base_api/base_repository.dart';
import 'package:timos_customer_2025/screen/detail_trip/airport_ticket_screen.dart';
import 'airport_ticket_form_dialog.dart';
import '../booking_ticket/ticket_price/model/book_ticket_request.dart';
import 'bloc/detail_trip_bloc.dart';
import 'bloc/detail_trip_event.dart';
import 'bloc/detail_trip_state.dart';

class TripDetailScreen extends StatefulWidget {
  final String idLichXeLimousine;

  final CoachPaneTripItem coachPaneTripItem;

  const TripDetailScreen(
      {super.key,
      required this.idLichXeLimousine,
      required this.coachPaneTripItem});

  @override
  State<TripDetailScreen> createState() => _TripDetailScreenState();
}

class _TripDetailScreenState extends State<TripDetailScreen> {
  int selectedFloor = 0; // Default tầng 1 (index 0)

  Set<DanhSachGhe> soDuocChon = {};

  final signalRService = SignalRService();
  final BaseRepository _baseRepo = BaseRepository();

  List<AirportTicket> airportTickets = [];
  int airportTotal = 0;
  bool loadingAirport = false;
  String? airportError;
  bool _airportInitialized = false;

  Future<void> _showAirportBookingDialog(DanhSachGhe seat) async {
    final formResult = await AirportTicketFormDialog.show(
      context,
      mode: AirportTicketFormMode.add,
      initialTenKhach: seat.tenKhachHang,
      initialSdt: seat.soDienThoaiKhachHang,
      initialThoiGianDon: widget.coachPaneTripItem.ngayChay ?? DateTime.now(),
      initialDiaChiDi: seat.diaChiKhachDi,
      initialDiaChiDen: seat.diaChiKhachDen,
      initialGiaVe: seat.giaVe.toInt(),
      initialDaThanhToan: false,
      initialGhiChu: seat.ghiChu,
    );

    if (formResult == null) return;

    final success = await _bookAirportTicket(
      idVeNguon: seat.idDatVe,
      tenKhach: formResult.tenKhachHang,
      sdtKhach: formResult.soDienThoai,
      thoiGianDon: formResult.thoiGianDon,
      diaChiDi: formResult.diaChiDi,
      diaChiDen: formResult.diaChiDen,
      giaVe: formResult.giaVe,
      daThanhToan: formResult.daThanhToan,
      ghiChu: formResult.ghiChu,
    );
    if (success && mounted) {
      // Mở màn danh sách vé sân bay để xem dữ liệu mới
      await _onOpenAirportTicketScreen();
      await _fetchAirportTickets();
      final currentState = context.read<DetailTripBloc>().state;
      final idToLoad = currentState.idLichXeLimousineMoi?.isNotEmpty == true
          ? currentState.idLichXeLimousineMoi!
          : widget.idLichXeLimousine;
      context.read<DetailTripBloc>().add(
        LoadDetailCoachPaneTripEvent(
          idLichXeLimousine: idToLoad,
          tang: selectedFloor,
        ),
      );
    }
  }

  Future<bool> _bookAirportTicket({
    required String idVeNguon,
    required String tenKhach,
    required String sdtKhach,
    required DateTime thoiGianDon,
    required String diaChiDi,
    required String diaChiDen,
    required int giaVe,
    required bool daThanhToan,
    required String ghiChu,
  }) async {
    try {
      final box = GetStorage();
      final userId = box.read(Const.USER_ID) ?? "";
      final idNhaXe = widget.coachPaneTripItem.idNhaXe;
      final body = {
        "idVeNguon": idVeNguon,
        "thoiGianDon": thoiGianDon.toIso8601String(),
        "diaChiDi": diaChiDi,
        "diaChiDen": diaChiDen,
        "giaVe": giaVe,
        "isKhachDiSanBay": true,
        "daThanhToan": daThanhToan,
        "tenKhachHang": tenKhach,
        "soDienThoai": sdtKhach,
        "idVanPhongDi": 0,
        "idVanPhongDen": 0,
        "ghiChu": ghiChu,
        "nguoiTao": userId,
        "idNhaXe": idNhaXe,
      };
      await _baseRepo.baseCallApi(
        "/api/v1/manage/chuyen-di/di-san-bay",
        "POST",
        jsonMap: body,
      );
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Lưu vé sân bay thành công")),
        );
      }
      return true;
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Lưu vé sân bay thất bại: $e")),
        );
      }
      return false;
    }
  }

  @override
  void initState() {
    super.initState();

    if(widget.idLichXeLimousine.isEmpty || widget.idLichXeLimousine == ""){
      context.read<DetailTripBloc>().add(
        IdTripEvent(
         taoLichNhaXeRequest: TaoLichNhaXeRequest(
           idNhaXe: widget.coachPaneTripItem.idNhaXe,
           ngayChay: widget.coachPaneTripItem.ngayChay,
           idTuyenDuong: widget.coachPaneTripItem.idTuyenDuong,
           idLoaiXe: widget.coachPaneTripItem.idLoaiXe,
           ghiChu: "Lịch xe limousine mới",
           gioDi: widget.coachPaneTripItem.gioDi ?? "",
           idLichChayXe: widget.coachPaneTripItem.idLichChayXe,
          ),
        ),
      );
    } else {
      context.read<DetailTripBloc>().add(
        LoadDetailCoachPaneTripEvent(
          idLichXeLimousine: widget.idLichXeLimousine,
          tang: selectedFloor,
        ),
      );
    }


    signalRService.startConnection();

  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DetailTripBloc, DetailTripState>(
      listenWhen: (prev, next) =>
          prev.isLoadingTrips != next.isLoadingTrips ||
          prev.tripError != next.tripError ||
              prev.statusApp != next.statusApp,
      listener: (context, state) {
        if (state.statusApp == 1) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Huỷ vé thành công'),
              backgroundColor: Colors.green,
            ),
          );
          // Reload lại chi tiết chuyến
          context.read<DetailTripBloc>().add(
            LoadDetailCoachPaneTripEvent(
              idLichXeLimousine: widget.idLichXeLimousine,
              tang: selectedFloor,
            ),
          );
        }
        // Xử lý lỗi - hiển thị toast và giữ nguyên dialog
        if (state.tripError != null && !state.isLoadingTrips) {
          // Hiển thị toast thông báo lỗi
          Utils.showMyToast(context, state.tripError!);

          // Clear error state sau khi hiển thị toast (không reload để giữ dialog mở)
          // Chỉ clear error, không reload data
          Future.delayed(const Duration(milliseconds: 300), () {
            if (mounted) {
              // Không dùng emit trực tiếp; trigger reload để clear error
              context.read<DetailTripBloc>().add(
                    LoadDetailCoachPaneTripEvent(
                      idLichXeLimousine: widget.idLichXeLimousine,
                      tang: selectedFloor,
                    ),
                  );
            }
          });
        }

        if(state.statusApp == 2) {
          context.read<DetailTripBloc>().add(
            LoadDetailCoachPaneTripEvent(
              idLichXeLimousine: state.idLichXeLimousineMoi ?? "",
              tang: selectedFloor,
            ),
          );
        }

        // Khi load xong chi tiết chuyến, fetch vé sân bay (1 lần)
        if (!_airportInitialized &&
            state.detailCoachPaneTrip != null &&
            !state.isLoadingTrips) {
          _airportInitialized = true;
          _fetchAirportTickets();
        }
      },
      child: BlocBuilder<DetailTripBloc, DetailTripState>(
        builder: (context, state) {
          final data = state.detailCoachPaneTrip;

          // Hiển thị loading overlay khi đang xử lý
          final isLoading = state.isLoadingTrips;

          return Stack(
            children: [
              Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              iconTheme: const IconThemeData(color: Colors.black87),
              title: data != null
                  ? Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                data.maLimo,
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black87,
                                  letterSpacing: -0.5,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                      color: mainColor.withValues(alpha: 0.15),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Icon(
                                      Icons.directions_bus,
                                      size: 12,
                                      color: mainColor,
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Flexible(
                                    child: Text(
                                      data.bienSoXe,
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey.shade700,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                mainColor.withValues(alpha: 0.15),
                                mainColor.withValues(alpha: 0.08),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: mainColor.withValues(alpha: 0.25),
                              width: 1.5,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.event_seat,
                                size: 16,
                                color: mainColor,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                '${data.soGheDaDat}/${data.tongSoGhe}',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: mainColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : const Text(
                      'Chi tiết chuyến',
                      style: TextStyle(color: Colors.black87),
                    ),
            ),
            body: _buildBody(context, state, data),
            bottomNavigationBar: data != null
                ? AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                      return SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(0.0, 1.0),
                          end: Offset.zero,
                        ).animate(
                          CurvedAnimation(
                            parent: animation,
                            curve: Curves.easeOutCubic,
                          ),
                        ),
                        child: FadeTransition(
                          opacity: animation,
                          child: child,
                        ),
                      );
                    },
                    child: soDuocChon.isNotEmpty
                        ? _buildBottom(key: const ValueKey('bottom-nav'))
                        : const SizedBox.shrink(key: ValueKey('empty')),
                  )
                : null,
              ),
              // Loading overlay khi đang xử lý (hủy vé hoặc reload)
              if (isLoading && data != null)
                Container(
                  color: Colors.black.withOpacity(0.3),
                  child: const Center(
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircularProgressIndicator(),
                            SizedBox(height: 16),
                            Text(
                              'Đang xử lý...',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
    DetailTripState state,
    DetailCoachPaneTripData? data,
  ) {
    // Nếu đang loading và chưa có data, hiển thị loading
    if (state.isLoadingTrips && data == null) {
      return const Center(child: CircularProgressIndicator());
    }

    // Nếu có lỗi nhưng đã có data trước đó, vẫn hiển thị data cũ (không hiển thị màn hình trắng)
    // Lỗi sẽ được hiển thị qua toast trong listener
    if (state.tripError != null && data == null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text(state.tripError!),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.read<DetailTripBloc>().add(
                  LoadDetailCoachPaneTripEvent(
                        idLichXeLimousine:
                            widget.idLichXeLimousine.toString(),
                    tang: selectedFloor,
                      ),
                    );
              },
              child: const Text('Thử lại'),
            ),
          ],
        ),
      );
    }

    if (data == null) {
      return const Center(child: Text('Không có dữ liệu'));
    }

    if (data.danhSachTang.isNotEmpty &&
        !data.danhSachTang.any((t) => t.tang == selectedFloor)) {
      selectedFloor = data.danhSachTang.first.tang;
    }

    final currentFloor = data.danhSachTang.isNotEmpty
        ? data.danhSachTang.firstWhere(
            (t) => t.tang == selectedFloor,
            orElse: () => data.danhSachTang.first,
          )
        : null;

    return RefreshIndicator(
      onRefresh: () async {
        // Lấy idLichXeLimousine hiện tại từ state hoặc widget
        final currentState = context.read<DetailTripBloc>().state;
        final idToLoad = currentState.idLichXeLimousineMoi?.isNotEmpty == true
            ? currentState.idLichXeLimousineMoi!
            : (widget.idLichXeLimousine.isNotEmpty
                ? widget.idLichXeLimousine
                : null);
        
        if (idToLoad != null) {
          // Reload chi tiết chuyến đi
          context.read<DetailTripBloc>().add(
            LoadDetailCoachPaneTripEvent(
              idLichXeLimousine: idToLoad,
              tang: selectedFloor,
            ),
          );
          // Đợi một chút để đảm bảo bloc xử lý xong
          await Future.delayed(const Duration(milliseconds: 500));
        }
      },
      color: mainColor,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(), // Cho phép scroll ngay cả khi nội dung ngắn
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTripInfoCard(data, currentFloor),
            const SizedBox(height: 16),
            _buildRevenueStats(currentFloor, data, state.gheTrong),
            const SizedBox(height: 16),
            _buildAirportTicketRow(),
            const SizedBox(height: 16),
            Text('Sơ đồ ghế', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            if (data.danhSachTang.isNotEmpty)
              _buildTang(data),
            const SizedBox(height: 12),  
            Row(
              children: [
                _buildLegendBox(
                    color: Colors.white,
                    borderColor: Colors.grey,
                    label: "Trống"),
                const SizedBox(width: 16),
                _buildLegendBox(
                    color: mainColor, borderColor: mainColor, label: "Đã đặt"),
                const SizedBox(width: 16),
                _buildLegendBox(
                    color: Colors.orange.shade100,
                    borderColor: Colors.orange,
                    label: "Giữ chỗ"),
                const SizedBox(width: 16),
                _buildLegendBox(
                    color: Colors.green.shade100,
                    borderColor: Colors.green,
                    label: "Vé trung chuyển"),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              "* Chọn ghế để xem chi tiết hành khách",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(fontStyle: FontStyle.italic),
            ),
            Text(
              "* Chọn ghế trống để đặt thêm vé",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 1000,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSeat(currentFloor, state),
                ],
              ),
            ),
            // const SizedBox(height: 16),
            // Container(
            //   padding: const EdgeInsets.all(16),
            //   decoration: BoxDecoration(
            //     color: mainColor.withValues(alpha: 0.1),
            //     borderRadius: BorderRadius.circular(12),
            //     border: Border.all(color: mainColor.withValues(alpha: 0.3)),
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text('Tổng tiền', style: Theme.of(context).textTheme.titleMedium),
            //       Text(
            //         _formatCurrency(data.tongDoanhThu.toDouble()),
            //         style: Theme.of(context)
            //             .textTheme
            //             .titleLarge
            //             ?.copyWith(fontWeight: FontWeight.bold, color: mainColor),
            //       ),
            //     ],
            //   ),
            // ),
            // const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }


  Widget _buildTang(DetailCoachPaneTripData data) {
    return  SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.danhSachTang.length,
        itemBuilder: (context, index) {
          final floor = data.danhSachTang[index];
          final bool isSelected = selectedFloor == floor.tang;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ChoiceChip(
              label: Text(
                  "Tầng ${floor.tang + 1} (${floor.soGheDaDat} đặt, ${floor.soGheGiuCho} giữ)"),
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  selectedFloor = floor.tang;
                });
                context.read<DetailTripBloc>().add(
                  TinhSoGheTrong(
                    tang: selectedFloor,
                  ),
                );
              },
              selectedColor: mainColor.withValues(alpha: 0.2),
              checkmarkColor: mainColor,
            ),
          );
        },
      ),
    );
  }

  Widget _buildTripInfoCard(
    DetailCoachPaneTripData data,
    TangHienTai? currentFloor,
  ) {
    final String ngayDi = data.ngayChay != null
        ? convertDateToString(data.ngayChay, pattern1)
        : '--/--/----';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            mainColor.withValues(alpha: 0.08),
            mainColor.withValues(alpha: 0.03),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: mainColor.withValues(alpha: 0.2),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: mainColor.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildModernInfoItem(
              icon: Icons.calendar_today,
              value: ngayDi,
            ),
          ),
          _buildVerticalDivider(),
          Expanded(
            child: _buildModernInfoItem(
              icon: Icons.access_time,
              value: _formatTime(data.gioDi),
            ),
          ),
          _buildVerticalDivider(),
          Expanded(
            child: _buildModernInfoItem(
              icon: Icons.person,
              value: data.tenTaiXe.isNotEmpty ? data.tenTaiXe : 'Chưa có',
              subtitle: data.soDienThoaiTaiXe,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRevenueStats(
      TangHienTai? currentFloor, DetailCoachPaneTripData data, int gheTrong) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [mainColor, mainColor.withValues(alpha: 0.8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              UtilsWidget.buildText(
                text: "Tổng doanh thu",
                fontSize: 14,
                fontWeight: FontWeight.w600,
                textColor: Colors.white,
              ),
              UtilsWidget.buildText(
                text: _formatCurrency(data.tongDoanhThu.toDouble()),
                fontSize: 16,
                fontWeight: FontWeight.bold,
                textColor: Colors.white,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              _buildStatItem(
                  "Đã đặt", currentFloor?.soGheDaDat ?? 0, Colors.green.shade100),
              const SizedBox(width: 12),
              _buildStatItem(
                  "Giữ chỗ", currentFloor?.soGheGiuCho ?? 0, Colors.orange.shade100),
              const SizedBox(width: 12),
              _buildStatItem(
                  "Trống", gheTrong, Colors.grey.shade100),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAirportTicketRow() {
    return InkWell(
      onTap: _onOpenAirportTicketScreen,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.08),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.flight_takeoff, color: Colors.blue, size: 18),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Vé đi sân bay",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    loadingAirport
                        ? "Đang tải..."
                        : airportError != null
                            ? airportError!
                            : "Số lượng: $airportTotal",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.grey.shade700,
                        ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.grey)
          ],
        ),
      ),
    );
  }

  Future<void> _fetchAirportTickets() async {
    setState(() {
      loadingAirport = true;
      airportError = null;
    });
    try {
      final response = await _baseRepo.baseCallApi(
        "/api/v1/manage/chuyen-di/danh-sach-ve-san-bay",
        "GET",
        isQueryParametersPost: true,
        jsonMap: {
          "idChuyenDi": widget.idLichXeLimousine,
          "pageIndex": 1,
          "pageSize": 50,
        },
      );
      final List<dynamic> data = response["data"] ?? [];
      airportTickets = data.map((e) => AirportTicket.fromJson(e)).toList().cast<AirportTicket>();
      airportTotal = response["totalRecords"] ?? airportTickets.length;
    } catch (e) {
      airportError = "Tải danh sách vé sân bay thất bại";
    } finally {
      if (mounted) {
        setState(() {
          loadingAirport = false;
        });
      }
    }
  }

  Future<void> _onOpenAirportTicketScreen() async {
    if (airportTickets.isEmpty && !loadingAirport) {
      await _fetchAirportTickets();
    }
    if (!mounted) return;
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AirportTicketScreen(
          idChuyenDi: widget.idLichXeLimousine,
        ),
      ),
    );
    if (!mounted) return;
    // Reload lại danh sách vé sân bay và chi tiết chuyến sau khi quay lại
    _fetchAirportTickets();
    final currentState = context.read<DetailTripBloc>().state;
    final idToLoad = currentState.idLichXeLimousineMoi?.isNotEmpty == true
        ? currentState.idLichXeLimousineMoi!
        : widget.idLichXeLimousine;
    context.read<DetailTripBloc>().add(
      LoadDetailCoachPaneTripEvent(
        idLichXeLimousine: idToLoad,
        tang: selectedFloor,
      ),
    );
  }

  Future<void> _showAirportTicketsBottomSheet() async {
    final TextEditingController searchCtrl = TextEditingController();
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setStateBS) {
            List<AirportTicket> filtered = airportTickets;
            final keyword = searchCtrl.text.trim().toLowerCase();
            if (keyword.isNotEmpty) {
              filtered = airportTickets
                  .where((t) =>
                      t.tenKhachHang.toLowerCase().contains(keyword) ||
                      t.soDienThoai.toLowerCase().contains(keyword) ||
                      t.diaChiDi.toLowerCase().contains(keyword) ||
                      t.diaChiDen.toLowerCase().contains(keyword))
                  .toList();
            }

            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 12,
                bottom: MediaQuery.of(context).viewInsets.bottom + 16,
              ),
              child: SafeArea(
                top: false,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        const Icon(Icons.flight_takeoff, color: Colors.blue),
                        const SizedBox(width: 8),
                        Text(
                          "Vé đi sân bay",
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                        const Spacer(),
                        Text(
                          "Số lượng: $airportTotal",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: searchCtrl,
                      onChanged: (_) => setStateBS(() {}),
                      decoration: InputDecoration(
                        hintText: "Tìm tên / SĐT / địa chỉ...",
                        prefixIcon: const Icon(Icons.search),
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    if (loadingAirport)
                      const Padding(
                        padding: EdgeInsets.all(16),
                        child: CircularProgressIndicator(),
                      )
                    else if (airportError != null)
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          airportError!,
                          style: TextStyle(color: Colors.red.shade600),
                        ),
                      )
                    else if (filtered.isEmpty)
                      const Padding(
                        padding: EdgeInsets.all(16),
                        child: Text("Không có dữ liệu"),
                      )
                    else
                      Flexible(
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemCount: filtered.length,
                          separatorBuilder: (_, __) => Divider(color: Colors.grey.shade200),
                          itemBuilder: (context, index) {
                            final item = filtered[index];
                            return ListTile(
                              dense: true,
                              contentPadding: EdgeInsets.zero,
                              leading: CircleAvatar(
                                radius: 18,
                                backgroundColor: Colors.blue.withOpacity(0.1),
                                child: const Icon(Icons.flight, color: Colors.blue, size: 18),
                              ),
                              title: Text(
                                item.tenKhachHang,
                                style: const TextStyle(fontWeight: FontWeight.w600),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 2),
                                  Text(item.soDienThoai, style: const TextStyle(fontSize: 12.5)),
                                  const SizedBox(height: 2),
                                  Text(
                                    "${item.diaChiDi} → ${item.diaChiDen}",
                                    style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 2),
                                  Row(
                                    children: [
                                      const Icon(Icons.access_time, size: 14, color: Colors.grey),
                                      const SizedBox(width: 4),
                                      Text(
                                        convertDateToString(item.thoiGianDon, pattern13),
                                        style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              trailing: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    Utils.formatTotalMoney(item.giaVe.toInt()),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w700, color: Colors.black87),
                                  ),
                                  const SizedBox(height: 2),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: item.daThanhToan
                                          ? Colors.green.withOpacity(0.1)
                                          : Colors.orange.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Text(
                                      item.daThanhToan ? "Đã thanh toán" : "Chưa thanh toán",
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: item.daThanhToan ? Colors.green : Colors.orange,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildModernInfoItem({
    required IconData icon,
    required String value,
    String? subtitle,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 16,
          color: mainColor,
        ),
        const SizedBox(width: 8),
        Flexible(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                  height: 1.2,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
              if (subtitle != null && subtitle.isNotEmpty) ...[
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w400,
                    height: 1.1,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildVerticalDivider() {
    return Container(
      width: 1.5,
      height: 28,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      color: Colors.grey.shade400,
    );
  }

  Widget _buildSeat(TangHienTai? currentFloor, DetailTripState state,) {
    final rows = (currentFloor?.danhSachGhe ?? [])
        .map((e) => e.hang)
        .toSet()
        .toList()
      ..sort();

    return LayoutBuilder(
      builder: (context, constraints) {
        const double gap = 8;
        final double maxWidth = constraints.maxWidth;

        Widget buildSeatTile(DanhSachGhe seat, double width) {
          Color seatColor;
          Color borderColor;
          Color textColor = Colors.black;

          switch (seat.trangThaiGhe) {
            case 2:
              seatColor = mainColor;
              borderColor = mainColor;
              textColor = Colors.white;
              break;
            case 3:
              seatColor = Colors.orange.shade100;
              borderColor = Colors.orange;
              break;
            case 1:
            default:
              seatColor = Colors.white;
              borderColor = Colors.grey.shade300;
              break;
          }

          if ((seat.day == 0 && seat.tang == 0 && seat.hang == 0) || seat.isGheAo) {
            return const SizedBox();
          }

          return Builder(
            builder: (context) {
              return InkWell(
                onTap: () async {
                  if (seat.trangThaiGhe == 1) {
                    if (soDuocChon.contains(seat)) {
                      soDuocChon.remove(seat);
                    } else {
                      soDuocChon.add(seat);
                    }
                    setState(() {});
                  } else {
                    final value = await TicketDetailBottomSheet.show(
                      context,
                      seat,
                      ngayChay: state.detailCoachPaneTrip?.ngayChay,
                      gioDi: state.detailCoachPaneTrip?.gioDi,
                    );

                    if(value != null) {
                      if (value == 'cancel_ticket') {
                        // Hiển thị loading và gọi API hủy vé
                        final box = GetStorage();
                        String userId = box.read(Const.USER_ID);
                        context.read<DetailTripBloc>().add(
                          CancelTripEvent(
                            cancelTicketRequest: CancelTicketRequest(
                              idLichXe: widget.idLichXeLimousine,
                              // idKhachHang: "",
                              maDatCho: seat.maDatCho.toInt(),
                              ngayChay: state.detailCoachPaneTrip?.ngayChay,
                              nguoiHuy: userId,
                              lyDoHuy: "Hành khách yêu cầu hủy vé",
                              thoiGianHuy: DateTime.now(),
                            ),
                          ),
                        );
                      } else if (value == 'edit_ticket') {
                        Set<ChiTietGheUpdate> chiTietGhes = {};
                        chiTietGhes.add(
                          ChiTietGheUpdate(
                            tang: seat.tang,
                            hang: seat.hang,
                            day: seat.day,
                            giaVe: seat.giaVe.toInt(),
                            diemBan: 1,
                            tenGhe: seat.tenGhe,
                          ),
                        );

                          TicketDetailModel ticket = TicketDetailModel(
                            dropoff: seat.diaChiKhachDen,
                            pickup: widget.coachPaneTripItem.tenTuyenDuong,
                            departureDate: state.detailCoachPaneTrip?.ngayChay,
                            numCustomers: 1,
                            price: seat.giaVe.toInt(),
                          );
                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  TicketDetailNowScreen(
                                    ticketDetail: ticket,
                                    // chiTietGhe: chiTietGhes,
                                    chiTietGheUpdate: chiTietGhes,
                                    coachPaneTripItem: widget.coachPaneTripItem,
                                    detailCoachPaneTrip: state
                                        .detailCoachPaneTrip,
                                    isUpdate: true,
                                    danhSachGhe: seat,
                                  ),
                              settings: RouteSettings(
                                  name: "TICKET_DETAIL_BOOK"),
                            ),
                          );
                          // Reload dữ liệu nếu đặt vé thành công
                          if (result == true && mounted) {
                            soDuocChon.clear();
                            context.read<DetailTripBloc>().add(
                              LoadDetailCoachPaneTripEvent(
                                idLichXeLimousine: widget.idLichXeLimousine,
                                tang: selectedFloor,
                              ),
                            );
                          }
                        }
                    }
                  }
                },
                child: Container(
                  width: width,
                  height: width + 12,
                  margin: EdgeInsets.only(right: gap),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: seat.isTrungChuyen
                          ? Colors.green
                          : (soDuocChon.contains(seat)
                              ? Colors.orange
                              : borderColor),
                      width: 2,
                    ),
                    color: seat.isTrungChuyen ? Colors.green.shade50 : seatColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              seat.tenGhe.toUpperCase(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: seat.isTrungChuyen ? Colors.green : textColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 13,
                              ),
                            ),
                          ),
                          if (seat.isTrungChuyen)
                            const Icon(Icons.swap_horiz, size: 14, color: Colors.green),
                          if (seat.tenKhachHang.isNotEmpty)
                            InkWell(
                              onTap: () => _showAirportBookingDialog(seat),
                              child: Container(
                                margin: const EdgeInsets.only(left: 6),
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: Colors.blue.withOpacity(0.12),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.flight_takeoff,
                                  size: 16,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 3),
                      Text(
                        Utils.formatTotalMoney(seat.giaVe),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: seat.isTrungChuyen ? Colors.green : textColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 11,
                        ),
                      ),
                      if (seat.tenKhachHang.isNotEmpty) ...[
                        const SizedBox(height: 3),
                        Text(
                          seat.tenKhachHang,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: seat.isTrungChuyen ? Colors.green : textColor,
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                      if (seat.soDienThoaiKhachHang.isNotEmpty) ...[
                        const SizedBox(height: 2),
                        Text(
                          seat.soDienThoaiKhachHang,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: seat.isTrungChuyen ? Colors.green : textColor,
                            fontSize: 11,
                          ),
                        ),
                      ],
                      const Spacer(),
                      if (seat.ghiChu.isNotEmpty)
                        Container(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: (seat.isTrungChuyen ? Colors.green : textColor)
                                .withValues(alpha: 0.08),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            seat.ghiChu,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: seat.isTrungChuyen ? Colors.green : textColor,
                              fontSize: 10,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            }
          );
        }

        final firstRow = rows.isNotEmpty ? rows.first : null;
        final rowWidgets = <Widget>[];

        for (final row in rows) {
          final rowSeats = (currentFloor?.danhSachGhe ?? [])
              .where((seat) => seat.hang == row)
              .toList();
          final int seatCount =
              rowSeats.length + (row == firstRow && firstRow != null ? 1 : 0);
          final double seatWidth = seatCount == 0
              ? maxWidth
              : ((maxWidth - ((seatCount + 1) * gap)) / seatCount)
                  .clamp(80, 140);

          final children = <Widget>[];
          if (row == firstRow && firstRow != null) {
            children.add(
              Container(
                width: 120,
                height: seatWidth + 5,
                margin: EdgeInsets.only(right: gap),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.grey.shade300,
                    width: 1.5,
                  ),
                  color: Colors.grey.shade100,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    UtilsWidget.buildText(text: "Tài xế"),
                    const Icon(
                      Icons.drive_eta,
                      size: 36,
                      color: Colors.black54,
                    ),
                  ],
                ),
              ),
            );
          }

          children.addAll(rowSeats.map((seat) => buildSeatTile(seat, seatWidth)));

          rowWidgets.add(
            Padding(
              padding: const EdgeInsets.only(bottom: gap),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: children,
              ),
            ),
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: rowWidgets,
        );
      },
    );
  }
  Widget _buildBottom({Key? key}) {
    return Container(
      key: key,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(22),
          topRight: Radius.circular(22),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 12,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: BlocBuilder<DetailTripBloc, DetailTripState>(
          builder: (context, state) {
        return SizedBox(
          height: 55,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () async {
              Set<ChiTietGhe> chiTietGhes = {};
              for (var seat in soDuocChon) {
                chiTietGhes.add(
                  ChiTietGhe(
                    tang: seat.tang,
                    hang: seat.hang,
                    day: seat.day,
                    giaVe: seat.giaVe.toInt(),
                    diemBan: 1,
                    tenGhe: seat.tenGhe,
                  ),
                );
              }

              if (soDuocChon.isNotEmpty) {
                TicketDetailModel ticket = TicketDetailModel(
                  dropoff: soDuocChon.first.diaChiKhachDen,
                  pickup: widget.coachPaneTripItem.tenTuyenDuong,
                  departureDate: state.detailCoachPaneTrip?.ngayChay,
                  numCustomers: 1,
                  price: soDuocChon.first.giaVe.toInt(),
                );
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TicketDetailNowScreen(
                      ticketDetail: ticket,
                      chiTietGhe: chiTietGhes,
                      coachPaneTripItem: widget.coachPaneTripItem,
                      detailCoachPaneTrip: state.detailCoachPaneTrip,
                    ),
                    settings: RouteSettings(name: "TICKET_DETAIL_BOOK"),
                  ),
                );
                // Reload dữ liệu nếu đặt vé thành công
                if (result == true && mounted) {
                  soDuocChon.clear();
                  context.read<DetailTripBloc>().add(
                    LoadDetailCoachPaneTripEvent(
                      idLichXeLimousine: widget.idLichXeLimousine,
                      tang: selectedFloor,
                    ),
                  );
                }
              } else {
                Utils.showMyToast(context, "Vui lòng chọn ghế để đặt vé");
              }
            },
            style: ElevatedButton.styleFrom(
              elevation: 0,
              // Trick: dùng foregroundPainter để apply gradient như background
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ).copyWith(
              backgroundColor: WidgetStateProperty.all(Colors.transparent),
            ),
            child: Ink(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    mainColor, mainColor.withValues(alpha: 0.8)
                  ],
                ),
                borderRadius: BorderRadius.all(Radius.circular(14)),
              ),
              child: Center(
                child: UtilsWidget.buildText(
                    text: "Đặt vé",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    textColor: Colors.white),
              ),
            ),
          ),
        );
      }),
    );
  }

  String _formatCurrency(double amount) {
    return "${amount.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')} VNĐ";
  }

  Widget _buildStatItem(String label, int count, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          children: [
            Text(
              '$count',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              label,
              style: const TextStyle(
                fontSize: 11,
                color: Colors.black54,
              ),
            ),
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

  String _formatTime(String? raw) {
    if (raw == null || raw.trim().isEmpty) return '--:--';
    final value = raw.trim();
    final match = RegExp(r'^(\d{1,2}):(\d{1,2})(?::\d{1,2})?$').firstMatch(value);
    if (match != null) {
      final hour = match.group(1)!.padLeft(2, '0');
      final minute = match.group(2)!.padLeft(2, '0');
      return '$hour:$minute';
    }
    return value;
  }
}
