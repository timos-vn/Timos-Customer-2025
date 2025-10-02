import 'package:flutter/material.dart';
import 'package:timos_customer_2025/ui/utils/widget/utils_widget.dart';
import 'package:timos_customer_2025/themes/colors.dart';

class SeatSelectionScreen extends StatefulWidget {
  const SeatSelectionScreen({super.key});

  @override
  State<SeatSelectionScreen> createState() => _SeatSelectionScreenState();
}

class _SeatSelectionScreenState extends State<SeatSelectionScreen> {
  int selectedCoach = 1;

  final List<Map<String, dynamic>> coaches = [
    {"id": 1, "name": "Tầng 1", "total": 16, "booked": 8, "reserved": 2},
    {"id": 2, "name": "Tầng 2", "total": 20, "booked": 12, "reserved": 1},
  ];

  // fake danh sách ghế với trạng thái
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
        title: UtilsWidget.buildText(
            text: "Quản lý ghế ngồi",
            fontSize: 18,
            fontWeight: FontWeight.w600),
        leading: const BackButton(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [mainColor, mainColor.withOpacity(0.8)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    UtilsWidget.buildText(
                      text: "Tổng doanh thu",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      textColor: Colors.white,
                    ),
                    UtilsWidget.buildText(
                      text:
                          "${totalRevenue.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')} VNĐ",
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      textColor: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    _buildStatItem("Đã đặt", currentCoach["booked"],
                        Colors.green.shade100),
                    const SizedBox(width: 16),
                    _buildStatItem("Giữ chỗ", currentCoach["reserved"],
                        Colors.orange.shade100),
                    const SizedBox(width: 16),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildLegendBox(
                    color: Colors.white,
                    borderColor: Colors.grey,
                    label: "Trống"),
                const SizedBox(width: 16),
                _buildLegendBox(
                    color: mainColor, label: "Đã đặt", borderColor: mainColor),
                const SizedBox(width: 16),
                _buildLegendBox(
                    color: Colors.orange.shade100,
                    label: "Giữ chỗ",
                    borderColor: Colors.orange),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                UtilsWidget.buildText(text: "Đầu xe"),
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        color: Colors.grey.shade100,
                        child: ListView(
                          children: coaches.map((c) {
                            final bool isSelected = selectedCoach == c["id"];
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
                                        ? mainColor
                                        : Colors.grey.shade300,
                                    width: 2,
                                  ),
                                  color: isSelected
                                      ? mainColor.withOpacity(0.1)
                                      : Colors.white,
                                ),
                                child: Column(
                                  children: [
                                    Text(c["name"],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: isSelected
                                                ? mainColor
                                                : Colors.black)),
                                    Text(
                                        "${c["booked"]} đặt, ${c["reserved"]} giữ",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: isSelected
                                                ? mainColor
                                                : Colors.black54)),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      Expanded(
                        child: GridView.builder(
                          padding: const EdgeInsets.all(16),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            childAspectRatio: 1,
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 12,
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
                                  border: Border.all(
                                    color: borderColor,
                                    width: 2,
                                  ),
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
                                      Text("${seat["id"]}",
                                          style: TextStyle(
                                              color: textColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14)),
                                      if (status != "empty" && price > 0)
                                        Text(
                                            "${(price / 1000).toStringAsFixed(0)}K",
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: textColor
                                                    .withOpacity(0.8))),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey.shade300)),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    UtilsWidget.buildText(
                      text: "Tổng ghế: ${currentCoach["total"]}",
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    UtilsWidget.buildText(
                      text:
                          "Tỷ lệ lấp đầy: ${((currentCoach["booked"] / currentCoach["total"]) * 100).toStringAsFixed(1)}%",
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      textColor: mainColor,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.download, size: 16),
                        label: const Text("Xuất báo cáo"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: mainColor,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.refresh, size: 16),
                        label: const Text("Làm mới"),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: mainColor,
                          side: BorderSide(color: mainColor),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, int count, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Text(
              '$count',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
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
                // TODO: Implement phone call
              },
            ),
            ListTile(
              leading: const Icon(Icons.message, color: Colors.blue),
              title: const Text('Nhắn tin SMS'),
              subtitle: Text(phone ?? 'Không có số điện thoại'),
              onTap: () {
                Navigator.of(context).pop();
                // TODO: Implement SMS
              },
            ),
            ListTile(
              leading: const Icon(Icons.email, color: Colors.orange),
              title: const Text('Gửi email'),
              subtitle: const Text('Gửi thông báo qua email'),
              onTap: () {
                Navigator.of(context).pop();
                // TODO: Implement email
              },
            ),
          ],
        ),
      ),
    );
  }
}
