import 'package:flutter/material.dart';
import 'package:timos_customer_2025/enum/enum_request_method.dart';
import 'package:timos_customer_2025/themes/colors.dart';
import 'package:timos_customer_2025/screen/utils/widget/utils_widget.dart';

class TripDetailScreen extends StatefulWidget {
  final TripSummary trip;
  const TripDetailScreen({super.key, required this.trip});

  @override
  State<TripDetailScreen> createState() => _TripDetailScreenState();
}

class _TripDetailScreenState extends State<TripDetailScreen> {
  int selectedCoach = 1;

  final List<Map<String, dynamic>> coaches = [
    {"id": 1, "name": "Tầng 1", "total": 16, "booked": 8, "reserved": 2},
    {"id": 2, "name": "Tầng 2", "total": 12, "booked": 4, "reserved": 1},
  ];

  final List<Map<String, dynamic>> allSeats = [
    {
      "id": 1,
      "status": "booked",
      "customer": "Nguyễn Văn A",
      "phone": "0900000001",
      "price": 150000
    },
    {
      "id": 2,
      "status": "booked",
      "customer": "Trần Thị B",
      "phone": "0900000002",
      "price": 150000
    },
    {
      "id": 3,
      "status": "reserved",
      "customer": "Lê Văn C",
      "phone": "0900000003",
      "price": 150000
    },
    {
      "id": 4,
      "status": "booked",
      "customer": "Phạm Thị D",
      "phone": "0900000004",
      "price": 150000
    },
    {"id": 5, "status": "empty", "customer": null, "phone": null, "price": 0},
    {
      "id": 6,
      "status": "booked",
      "customer": "Hoàng Văn E",
      "phone": "0900000005",
      "price": 150000
    },
    {"id": 7, "status": "empty", "customer": null, "phone": null, "price": 0},
    {
      "id": 8,
      "status": "booked",
      "customer": "Vũ Thị F",
      "phone": "0900000006",
      "price": 150000
    },
    {
      "id": 9,
      "status": "reserved",
      "customer": "Đặng Văn G",
      "phone": "0900000007",
      "price": 150000
    },
    {
      "id": 10,
      "status": "booked",
      "customer": "Bùi Thị H",
      "phone": "0900000008",
      "price": 150000
    },
    {"id": 11, "status": "empty", "customer": null, "phone": null, "price": 0},
    {
      "id": 12,
      "status": "booked",
      "customer": "Ngô Văn I",
      "phone": "0900000009",
      "price": 150000
    },
    {"id": 13, "status": "empty", "customer": null, "phone": null, "price": 0},
    {
      "id": 14,
      "status": "booked",
      "customer": "Dương Thị K",
      "phone": "0900000010",
      "price": 150000
    },
    {
      "id": 15,
      "status": "booked",
      "customer": "Tôn Văn L",
      "phone": "0900000011",
      "price": 150000
    },
    {"id": 16, "status": "empty", "customer": null, "phone": null, "price": 0},
  ];

  @override
  Widget build(BuildContext context) {
    final currentCoach = coaches.firstWhere((c) => c["id"] == selectedCoach);
    final totalRevenue = allSeats
        .where((seat) => seat["status"] == "booked")
        .fold(0, (sum, seat) => sum + (seat["price"] as int));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chi tiết chuyến'),
      ),
      body: SingleChildScrollView(
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
                            const Icon(Icons.directions_bus, color: mainColor),
                            const SizedBox(width: 8),
                            Text(
                              widget.trip.routeName,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ],
                        ),
                        UtilsWidget.buildText(
                          text: widget.trip.licensePlate,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    _buildDetailRow('Khởi hành',
                        '${widget.trip.departureTime.day}/${widget.trip.departureTime.month}/${widget.trip.departureTime.year} ${widget.trip.departureTime.hour}:${widget.trip.departureTime.minute.toString().padLeft(2, '0')}'),
                    _buildDetailRow('Tài xế',
                        '${widget.trip.driverName} • ${widget.trip.driverPhone}'),
                    _buildDetailRow('Số ghế',
                        '${widget.trip.bookedSeats}/${widget.trip.totalSeats}'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Revenue Statistics
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                        text:
                            "${totalRevenue.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')} VNĐ",
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        textColor: Colors.white,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      _buildStatItem("Đã đặt", currentCoach["booked"],
                          Colors.green.shade100),
                      const SizedBox(width: 12),
                      _buildStatItem("Giữ chỗ", currentCoach["reserved"],
                          Colors.orange.shade100),
                      const SizedBox(width: 12),
                      _buildStatItem(
                          "Trống",
                          currentCoach["total"] -
                              currentCoach["booked"] -
                              currentCoach["reserved"],
                          Colors.grey.shade100),
                    ],
                  ),
                ],
              ),
            ),

            // Seat Map Section
            Text('Sơ đồ ghế', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),

            // Coach Selection
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: coaches.length,
                itemBuilder: (context, index) {
                  final coach = coaches[index];
                  final bool isSelected = selectedCoach == coach["id"];
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      label: Text(
                          "${coach["name"]} (${coach["booked"]} đặt, ${coach["reserved"]} giữ)"),
                      selected: isSelected,
                      onSelected: (selected) {
                        setState(() {
                          selectedCoach = coach["id"];
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
                    color: mainColor, borderColor: mainColor, label: "Đã đặt"),
                const SizedBox(width: 16),
                _buildLegendBox(
                    color: Colors.orange.shade100,
                    borderColor: Colors.orange,
                    label: "Giữ chỗ"),
              ],
            ),
            const SizedBox(height: 12),

            // Seat Grid
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
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 1,
                ),
                itemCount: allSeats.length,
                itemBuilder: (context, index) {
                  final seat = allSeats[index];
                  final String status = seat["status"];
                  final int price = seat["price"];

                  Color seatColor;
                  Color borderColor;
                  Color textColor = Colors.black;

                  switch (status) {
                    case "booked":
                      seatColor = mainColor;
                      borderColor = mainColor;
                      textColor = Colors.white;
                      break;
                    case "reserved":
                      seatColor = Colors.orange.shade100;
                      borderColor = Colors.orange;
                      break;
                    case "empty":
                    default:
                      seatColor = Colors.white;
                      borderColor = Colors.grey.shade300;
                      break;
                  }

                  return GestureDetector(
                    onTap: () => _showCustomerDetail(context, seat),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: borderColor, width: 2),
                        color: seatColor,
                        boxShadow: status == "booked"
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
                              "${seat["id"]}",
                              style: TextStyle(
                                color: textColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            if (status != "empty" && price > 0)
                              Text(
                                "${(price / 1000).toStringAsFixed(0)}K",
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
                    "${totalRevenue.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')} VNĐ",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold, color: mainColor),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Management Actions
            // Row(
            //   children: [
            //     Expanded(
            //       child: OutlinedButton.icon(
            //         onPressed: () {},
            //         icon: const Icon(Icons.download, size: 16),
            //         label: const Text('Xuất báo cáo'),
            //         style: OutlinedButton.styleFrom(
            //           foregroundColor: mainColor,
            //           side: BorderSide(color: mainColor),
            //         ),
            //       ),
            //     ),
            //     const SizedBox(width: 12),
            //     Expanded(
            //       child: FilledButton.icon(
            //         onPressed: () {},
            //         icon: const Icon(Icons.phone, size: 16),
            //         label: const Text('Gọi tài xế'),
            //         style: FilledButton.styleFrom(backgroundColor: mainColor),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
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

  void _showCustomerDetail(BuildContext context, Map<String, dynamic> seat) {
    final String status = seat["status"];
    final String? customer = seat["customer"];
    final String? phone = seat["phone"];
    final int price = seat["price"];
    final int seatId = seat["id"];

    if (status == "empty") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Ghế $seatId - Trống'),
          backgroundColor: Colors.grey,
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('Thông tin khách hàng - Ghế $seatId'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailRow('Tên khách', customer ?? 'N/A'),
            _buildDetailRow('Số điện thoại', phone ?? 'N/A'),
            _buildDetailRow('Giá vé',
                '${price.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')} VNĐ'),
            _buildDetailRow('Trạng thái', _getStatusText(status)),
            _buildDetailRow('Thời gian đặt', '15/01/2025 14:30'),
            _buildDetailRow('Phương thức thanh toán', 'Chuyển khoản'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Đóng'),
          ),
          if (status == "booked" || status == "reserved")
            FilledButton.icon(
              onPressed: () {
                Navigator.of(context).pop();
                _showCallOptions(context, customer, phone);
              },
              icon: const Icon(Icons.phone, size: 16),
              label: const Text('Gọi điện'),
              style: FilledButton.styleFrom(backgroundColor: mainColor),
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

  String _getStatusText(String status) {
    switch (status) {
      case "booked":
        return "Đã đặt";
      case "reserved":
        return "Giữ chỗ";
      case "empty":
        return "Trống";
      default:
        return "Không xác định";
    }
  }

  void _showCallOptions(BuildContext context, String? customer, String? phone) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Liên hệ $customer',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.phone, color: Colors.green),
              title: const Text('Gọi điện'),
              subtitle: Text(phone ?? 'Không có số điện thoại'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.message, color: Colors.blue),
              title: const Text('Nhắn tin SMS'),
              subtitle: Text(phone ?? 'Không có số điện thoại'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.email, color: Colors.orange),
              title: const Text('Gửi email'),
              subtitle: const Text('Gửi thông báo qua email'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
