import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timos_customer_2025/models/response/response.dart';
import 'package:timos_customer_2025/themes/colors.dart';
import 'package:timos_customer_2025/screen/utils/widget/utils_widget.dart';
import 'package:timos_customer_2025/utils/utils.dart';
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

  // Set<SoDoGheLoaiX> soDuocChon = {};

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
                                "Tầng ${floor.tang + 1} (${floor.soGheDaDat} đặt, ${floor.soGheGiuCho} giữ)"),
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
                    const SizedBox(width: 16),
                    _buildLegendBox(
                        color: Colors.green.shade100,
                        borderColor: Colors.green,
                        label: "Vé trung chuyển"),
                  ],
                ),
                const SizedBox(height: 12),

                // // Seat Grid
                // if (currentFloor != null && currentFloor.danhSachGhe.isNotEmpty)
                //   Container(
                //     padding: const EdgeInsets.all(12),
                //     decoration: BoxDecoration(
                //       color: Colors.grey.shade50,
                //       borderRadius: BorderRadius.circular(8),
                //       border: Border.all(color: Colors.grey.shade200),
                //     ),
                //     child: GridView.builder(
                //       shrinkWrap: true,
                //       physics: const NeverScrollableScrollPhysics(),
                //       gridDelegate:
                //           const SliverGridDelegateWithFixedCrossAxisCount(
                //         crossAxisCount: 4,
                //         mainAxisSpacing: 8,
                //         crossAxisSpacing: 8,
                //         childAspectRatio: 1,
                //       ),
                //       itemCount: currentFloor.danhSachGhe.length,
                //       itemBuilder: (context, index) {
                //         final seat = currentFloor.danhSachGhe[index];
                //         return _buildSeatItem(seat);
                //       },
                //     ),
                //   ),
                const SizedBox(height: 16),

                Column(
                  children: [
                    // Chú thích trạng thái ghế
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(
                    //       horizontal: 16, vertical: 8),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     crossAxisAlignment: CrossAxisAlignment.center,
                    //     children: [
                    //       _buildLegendBox(
                    //           color: Colors.white,
                    //           borderColor: Colors.grey,
                    //           label: "Chỗ trống"),
                    //       const SizedBox(width: 16),
                    //       _buildLegendBox(
                    //           color: Colors.green.shade50,
                    //           label: "Chỗ đang chọn",
                    //           borderColor: Colors.green),
                    //       const SizedBox(width: 16),
                    //       _buildLegendBox(
                    //           color: Colors.grey.shade300,
                    //           label: "Đã bán",
                    //           hasBorder: false),
                    //     ],
                    //   ),
                    // ),

                    BlocBuilder<DetailTripBloc, DetailTripState>(
                      builder: (context, state) {
                        if (state.isLoadingTrips) {
                          return const Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.red,
                            ),
                          );
                        } else {
                          // for(var seat in state.listSeating) {
                          //   if(seat.tang == 0) {
                          //     for(var s in listTang1) {
                          //       if(s.day == seat.day && s.hang == seat.hang && s.tenGhe == seat.tenGhe) {
                          //         s.isDatGhe = true;
                          //       }
                          //     }
                          //   } else if(seat.tang == 1) {
                          //     for(var s in listTang2) {
                          //       if(s.day == seat.day && s.hang == seat.hang && s.tenGhe == seat.tenGhe) {
                          //         s.isDatGhe = true;
                          //       }
                          //     }
                          //   }
                          // }
                          return SizedBox(
                            height: 800,
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(right: 6),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            ...List.generate(
                                              (currentFloor?.danhSachGhe ?? [] ).toList().length,
                                                  (index) {
                                                final list = (currentFloor?.danhSachGhe ?? [] )
                                                    .where((e) => e.hang == index)
                                                    .toList();
                                                return Row(
                                                  children: [
                                                    if (index == 0)
                                                      const Padding(
                                                        padding: EdgeInsets.all(4.0),
                                                        child: SizedBox(
                                                          width: 90,
                                                          height: 90,
                                                          child: Center(child: Text("Lái xe")),
                                                        ),
                                                      ),
                                                    ...List.generate(list.length, (index) {
                                                      final seat = list[index];
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

                                                      if(!seat.isGheAo) {
                                                        return const SizedBox(
                                                        );
                                                      }

                                                      return Padding(
                                                        padding: const EdgeInsets.all(4.0),
                                                        child: InkWell(
                                                          onTap: () {},
                                                          child: Container(
                                                            width: 90,
                                                            height: 90,
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(8),
                                                              border: Border.all(
                                                                color: seat.isTrungChuyen ? Colors.green : borderColor,
                                                                width: 2,
                                                              ),
                                                              color: seat.isTrungChuyen ? Colors.green.shade50 : seatColor ,
                                                            ),
                                                            child: Center(
                                                              child: Column(
                                                                mainAxisSize: MainAxisSize.min,
                                                                children: [
                                                                  Text(
                                                                    seat.tenGhe.toUpperCase(),
                                                                    style: TextStyle(
                                                                      color: seat.isTrungChuyen ? Colors.green : textColor,
                                                                      fontWeight: FontWeight.bold,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    Utils.formatTotalMoney(seat.giaVe),
                                                                    style: TextStyle(
                                                                      fontSize: 10,
                                                                      color: seat.isTrungChuyen ? Colors.green : textColor,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }),
                                                  ],
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),

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
                        _formatCurrency(data.tongDoanhThu.toDouble()),
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
