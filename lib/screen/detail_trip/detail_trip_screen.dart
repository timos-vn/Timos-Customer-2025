import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timos_customer_2025/models/response/response.dart';
import 'package:timos_customer_2025/screen/booking_ticket/booking/model/ticket_detail_model.dart';
import 'package:timos_customer_2025/screen/detail_trip/ticket_detail_bottom_sheet.dart';
import 'package:timos_customer_2025/screen/ticket_detail_confirm/ticket_detail_now_screen.dart';
import 'package:timos_customer_2025/themes/colors.dart';
import 'package:timos_customer_2025/screen/utils/widget/utils_widget.dart';
import 'package:timos_customer_2025/utils/date_utils.dart';
import 'package:timos_customer_2025/utils/utils.dart';
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

  @override
  void initState() {
    super.initState();
    context.read<DetailTripBloc>().add(
          DetailTripEvent.loadDetailCoachPaneTrip(
            idLichXeLimousine: widget.idLichXeLimousine,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailTripBloc, DetailTripState>(
      builder: (context, state) {
        final data = state.detailCoachPaneTrip;

        return Scaffold(
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
        );
      },
    );
  }

  Widget _buildBody(
    BuildContext context,
    DetailTripState state,
    DetailCoachPaneTripData? data,
  ) {
    if (state.isLoadingTrips) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.tripError != null) {
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
                      DetailTripEvent.loadDetailCoachPaneTrip(
                        idLichXeLimousine:
                            widget.idLichXeLimousine.toString(),
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

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTripInfoCard(data, currentFloor),
          const SizedBox(height: 16),
          _buildRevenueStats(currentFloor, data),
          const SizedBox(height: 16),
          Text('Sơ đồ ghế', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          if (data.danhSachTang.isNotEmpty)
            SizedBox(
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
                      },
                      selectedColor: mainColor.withValues(alpha: 0.2),
                      checkmarkColor: mainColor,
                    ),
                  );
                },
              ),
            ),
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
                _buildSeat(currentFloor),
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
      TangHienTai? currentFloor, DetailCoachPaneTripData data) {
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
                  "Trống", currentFloor?.soGheTrong ?? 0, Colors.grey.shade100),
            ],
          ),
        ],
      ),
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

  Widget _buildSeat(TangHienTai? currentFloor) {
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

          return InkWell(
            onTap: () {
              if (seat.trangThaiGhe == 1) {
                if (soDuocChon.contains(seat)) {
                  soDuocChon.remove(seat);
                } else {
                  soDuocChon.add(seat);
                }
                setState(() {});
              } else {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (_) => TicketDetailBottomSheet(seat),
                );
              }
            },
            child: Container(
              width: width,
              height: width + 5,
              margin: EdgeInsets.only(right: gap),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
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
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          seat.tenGhe.toUpperCase(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: seat.isTrungChuyen ? Colors.green : textColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      if (seat.isTrungChuyen)
                        const Icon(Icons.swap_horiz, size: 16, color: Colors.green),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    Utils.formatTotalMoney(seat.giaVe),
                    style: TextStyle(
                      color: seat.isTrungChuyen ? Colors.green : textColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 6),
                  if (seat.tenKhachHang.isNotEmpty)
                    Text(
                      seat.tenKhachHang,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: seat.isTrungChuyen ? Colors.green : textColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  if (seat.soDienThoaiKhachHang.isNotEmpty)
                    Text(
                      seat.soDienThoaiKhachHang,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: seat.isTrungChuyen ? Colors.green : textColor,
                        fontSize: 12,
                      ),
                    ),
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
                width: seatWidth,
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
                child: const Icon(
                  Icons.drive_eta,
                  size: 36,
                  color: Colors.black54,
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
            onPressed: () {
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TicketDetailNowScreen(
                      ticketDetail: ticket,
                      chiTietGhe: chiTietGhes,
                      coachPaneTripItem: widget.coachPaneTripItem,
                    ),
                  ),
                );
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
