import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timos_customer_2025/models/response/response.dart';
import 'package:timos_customer_2025/themes/colors.dart';
import 'package:timos_customer_2025/screen/utils/widget/utils_widget.dart';
import 'bloc/detail_trip_bloc.dart';
import 'bloc/detail_trip_event.dart';
import 'bloc/detail_trip_state.dart';

class TripDetailScreen extends StatefulWidget {
  final String idLichXeLimousine;
  const TripDetailScreen({super.key, required this.idLichXeLimousine});

  @override
  State<TripDetailScreen> createState() => _TripDetailScreenState();
}

class _TripDetailScreenState extends State<TripDetailScreen> {
  int selectedFloor = 1;

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chi tiết chuyến'),
      ),
      body: BlocBuilder<DetailTripBloc, DetailTripState>(
        builder: (context, state) {
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

          final data = state.detailCoachPaneTrip;
          if (data == null) {
            return const Center(child: Text('Không có dữ liệu'));
          }

          // Get current floor data
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
                // Trip Info Card
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.directions_bus,
                                    color: mainColor),
                                const SizedBox(width: 8),
                                Text(
                                  data.maLimo,
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ],
                            ),
                            UtilsWidget.buildText(
                              text: data.bienSoXe,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        _buildDetailRow('Khởi hành',
                            '${data.ngayChay ?? ''} ${data.gioDi ?? ''}'),
                        _buildDetailRow('Tài xế',
                            '${data.tenTaiXe} • ${data.soDienThoaiTaiXe}'),
                        _buildDetailRow(
                            'Số ghế', '${data.soGheDaDat}/${data.tongSoGhe}'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Revenue Statistics
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [mainColor, mainColor.withOpacity(0.8)],
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
                            text: _formatCurrency(data.tongDoanhThu),
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
                              "Đã đặt",
                              currentFloor?.soGheDaDat ?? 0,
                              Colors.green.shade100),
                          const SizedBox(width: 12),
                          _buildStatItem(
                              "Giữ chỗ",
                              currentFloor?.soGheGiuCho ?? 0,
                              Colors.orange.shade100),
                          const SizedBox(width: 12),
                          _buildStatItem("Trống", currentFloor?.soGheTrong ?? 0,
                              Colors.grey.shade100),
                        ],
                      ),
                    ],
                  ),
                ),

                // Seat Map Section
                Text('Sơ đồ ghế',
                    style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),

                // Floor Selection
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
                                "Tầng ${floor.tang} (${floor.soGheDaDat} đặt, ${floor.soGheGiuCho} giữ)"),
                            selected: isSelected,
                            onSelected: (selected) {
                              setState(() {
                                selectedFloor = floor.tang;
                              });
                            },
                            selectedColor: mainColor.withOpacity(0.2),
                            checkmarkColor: mainColor,
                          ),
                        );
                      },
                    ),
                  ),
                const SizedBox(height: 12),

                // Seat Legend
                Row(
                  children: [
                    _buildLegendBox(
                        color: Colors.white,
                        borderColor: Colors.grey,
                        label: "Trống"),
                    const SizedBox(width: 16),
                    _buildLegendBox(
                        color: mainColor,
                        borderColor: mainColor,
                        label: "Đã đặt"),
                    const SizedBox(width: 16),
                    _buildLegendBox(
                        color: Colors.orange.shade100,
                        borderColor: Colors.orange,
                        label: "Giữ chỗ"),
                  ],
                ),
                const SizedBox(height: 12),

                // Seat Grid
                if (currentFloor != null && currentFloor.danhSachGhe.isNotEmpty)
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        childAspectRatio: 1,
                      ),
                      itemCount: currentFloor.danhSachGhe.length,
                      itemBuilder: (context, index) {
                        final seat = currentFloor.danhSachGhe[index];
                        return _buildSeatItem(seat);
                      },
                    ),
                  ),
                const SizedBox(height: 16),

                // Total Price Section
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: mainColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: mainColor.withOpacity(0.3)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Tổng tiền',
                          style: Theme.of(context).textTheme.titleMedium),
                      Text(
                        _formatCurrency(data.tongDoanhThu),
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold, color: mainColor),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSeatItem(DetailGheItem seat) {
    Color seatColor;
    Color borderColor;
    Color textColor = Colors.black;

    // Map trangThaiGhe: 1 = Trống, 2 = Đã đặt, 3 = Giữ chỗ
    switch (seat.trangThaiGhe) {
      case 2: // Đã đặt
        seatColor = mainColor;
        borderColor = mainColor;
        textColor = Colors.white;
        break;
      case 3: // Giữ chỗ
        seatColor = Colors.orange.shade100;
        borderColor = Colors.orange;
        break;
      case 1: // Trống
      default:
        seatColor = Colors.white;
        borderColor = Colors.grey.shade300;
        break;
    }

    return GestureDetector(
      onTap: () => _showSeatDetail(seat),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: borderColor, width: 2),
          color: seatColor,
          boxShadow: seat.trangThaiGhe == 2
              ? [
                  BoxShadow(
                    color: mainColor.withOpacity(0.3),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                seat.tenGhe,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              if (seat.trangThaiGhe != 1 && seat.giaVe > 0)
                Text(
                  "${(seat.giaVe / 1000).toStringAsFixed(0)}K",
                  style: TextStyle(
                    fontSize: 10,
                    color: textColor.withOpacity(0.8),
                  ),
                ),
            ],
          ),
        ),
      ),
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

  void _showSeatDetail(DetailGheItem seat) {
    if (seat.trangThaiGhe == 1) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Ghế ${seat.tenGhe} - Trống'),
          backgroundColor: Colors.grey,
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('Thông tin ghế ${seat.tenGhe}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailRow('Ghế', seat.tenGhe),
            _buildDetailRow('Tầng', 'Tầng ${seat.tang}'),
            _buildDetailRow('Giá vé', _formatCurrency(seat.giaVe)),
            _buildDetailRow('Trạng thái', seat.tenTrangThaiGhe),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Đóng'),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
