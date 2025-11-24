import 'package:flutter/material.dart';
import 'package:timos_customer_2025/models/response/detail_coach_pane_trip/detail_coach_pane_trip_response.dart';
import 'package:timos_customer_2025/utils/utils.dart';

class TicketDetailBottomSheet extends StatelessWidget {

  final DanhSachGhe danhSachGhe;

  const TicketDetailBottomSheet(this.danhSachGhe, {super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.55,
      minChildSize: 0.40,
      maxChildSize: 0.85,
      builder: (_, controller) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(22),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 10,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: ListView(
            controller: controller,
            children: [
              // Indicator
              Center(
                child: Container(
                  width: 45,
                  height: 5,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              Text(
                "Chi tiết vé",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 16),

              _infoRow("Tên khách", danhSachGhe.tenKhachHang),
              _infoRow("Số điện thoại", danhSachGhe.soDienThoaiKhachHang),
              _infoRow("Loại vé", danhSachGhe.isTrungChuyen ? "Vé trung chuyển" : "Vé thường"),
              _infoRow("Giá tiền", Utils.formatTotalMoney(danhSachGhe.giaVe)),

              const SizedBox(height: 12),

              Divider(color: Colors.grey.shade300),

              const SizedBox(height: 12),

              _infoRow("Tên ghế", danhSachGhe.tenGhe),
              _infoRow("Vị trí ghế", "Hàng ${danhSachGhe.hang} Dãy ${danhSachGhe.day}"),
              _infoRow("Tài xế chung chuyển", danhSachGhe.tenTaiXeTrungChuyen),
              _infoRow("SDT chung chuyển", danhSachGhe.soDienThoaiTaiXeTrungChuyen),
              _infoRow("Ghi chú", danhSachGhe.ghiChu),

              const SizedBox(height: 30),

              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  Widget _infoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey[700],
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
