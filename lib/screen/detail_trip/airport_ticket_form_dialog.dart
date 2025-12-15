import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:timos_customer_2025/utils/date_utils.dart';
import 'package:timos_customer_2025/utils/utils.dart';

enum AirportTicketFormMode { add, edit }

class NumberInputFormatter extends TextInputFormatter {
  final NumberFormat formatter = NumberFormat("#,###", "vi_VN");

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Nếu nhập rỗng thì trả về luôn
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // Xoá hết ký tự không phải số
    String numericString = newValue.text.replaceAll(RegExp(r'[^\d]'), '');
    
    if (numericString.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // Parse ra số
    int number = int.parse(numericString);

    // Format theo phần nghìn
    String newText = formatter.format(number);

    // Đặt cursor ở cuối để tránh lỗi
    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}

class AirportTicketFormResult {
  final String tenKhachHang;
  final String soDienThoai;
  final DateTime thoiGianDon;
  final String diaChiDi;
  final String diaChiDen;
  final int giaVe;
  final int diemBanVe;
  final bool daThanhToan;
  final String ghiChu;

  AirportTicketFormResult({
    required this.tenKhachHang,
    required this.soDienThoai,
    required this.thoiGianDon,
    required this.diaChiDi,
    required this.diaChiDen,
    required this.giaVe,
    required this.diemBanVe,
    required this.daThanhToan,
    required this.ghiChu,
  });
}

class AirportTicketFormDialog {
  static Future<AirportTicketFormResult?> show(
    BuildContext context, {
    required AirportTicketFormMode mode,
    required String initialTenKhach,
    required String initialSdt,
    required DateTime initialThoiGianDon,
    required String initialDiaChiDi,
    required String initialDiaChiDen,
    required int initialGiaVe,
    required bool initialDaThanhToan,
    required String initialGhiChu,
  }) async {
    final nameCtrl = TextEditingController(text: initialTenKhach);
    final phoneCtrl = TextEditingController(text: initialSdt);
    // Tính ngược lại diemBanVe từ giaVe (giaVe / 1000)
    final initialDiemBanVe = (initialGiaVe / 1000).round();
    final numberFormat = NumberFormat("#,###", "vi_VN");
    final priceCtrl = TextEditingController(
      text: initialDiemBanVe > 0 ? numberFormat.format(initialDiemBanVe) : '',
    );
    final pickupCtrl = TextEditingController(text: initialDiaChiDi);
    final dropCtrl = TextEditingController(text: initialDiaChiDen);
    final noteCtrl = TextEditingController(text: initialGhiChu);
    bool paid = initialDaThanhToan;
    DateTime pickTime = initialThoiGianDon;

    final result = await showDialog<AirportTicketFormResult>(
      context: context,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (ctx, setStateDialog) {
            return AlertDialog(
              title: Text(mode == AirportTicketFormMode.add ? "Đặt vé sân bay" : "Sửa vé sân bay"),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: nameCtrl,
                      decoration: const InputDecoration(labelText: "Tên khách"),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: phoneCtrl,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(labelText: "Số điện thoại"),
                    ),
                    const SizedBox(height: 12), 
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: priceCtrl,
                            keyboardType: TextInputType.number,
                            inputFormatters: [NumberInputFormatter()],
                            decoration: const InputDecoration(
                              labelText: "Điểm vé",
                              hintText: "Nhập điểm vé",
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: OutlinedButton.icon(
                            icon: const Icon(Icons.calendar_today, size: 16),
                            label: Text(
                              convertDateToString(pickTime, pattern6),
                              style: const TextStyle(fontSize: 13),
                            ),
                            onPressed: () async {
                              final date = await showDatePicker(
                                context: context,
                                initialDate: pickTime,
                                firstDate: DateTime.now().subtract(const Duration(days: 1)),
                                lastDate: DateTime.now().add(const Duration(days: 365)),
                              );
                              if (date != null) {
                                final time = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.fromDateTime(pickTime),
                                );
                                if (time != null) {
                                  setStateDialog(() {
                                    pickTime = DateTime(
                                      date.year,
                                      date.month,
                                      date.day,
                                      time.hour,
                                      time.minute,
                                    );
                                  });
                                }
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        "Thời gian đón: ${convertDateToString(pickTime, pattern6)}",
                        style: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.w500),
                      ),
                    ),
                    TextField(
                      controller: pickupCtrl,
                      decoration: const InputDecoration(labelText: "Địa chỉ đón"),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: dropCtrl,
                      decoration: const InputDecoration(labelText: "Địa chỉ trả"),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: noteCtrl,
                      decoration: const InputDecoration(labelText: "Ghi chú"),
                    ),
                    const SizedBox(height: 8),
                    CheckboxListTile(
                      value: paid,
                      onChanged: (v) {
                        setStateDialog(() {
                          paid = v ?? false;
                        });
                      },
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      title: const Text("Đã thanh toán"),
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(ctx, null),
                  child: const Text("Đóng"),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Loại bỏ dấu phẩy/chấm để parse số
                    final rawText = priceCtrl.text.replaceAll(RegExp(r'[^\d]'), '');
                    final diemBanVe = int.tryParse(rawText) ?? 0;
                    final giaVe = diemBanVe * 1000; // 1 điểm = 1000 đ
                    final name = nameCtrl.text.trim();
                    final phone = phoneCtrl.text.trim();
                    if (name.isEmpty || phone.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Tên và SĐT không được để trống")),
                      );
                      return;
                    }
                    Navigator.pop(
                      ctx,
                      AirportTicketFormResult(
                        tenKhachHang: name,
                        soDienThoai: phone,
                        thoiGianDon: pickTime,
                        diaChiDi: pickupCtrl.text.trim(),
                        diaChiDen: dropCtrl.text.trim(),
                        giaVe: giaVe,
                        diemBanVe: diemBanVe,
                        daThanhToan: paid,
                        ghiChu: noteCtrl.text.trim(),
                      ),
                    );
                  },
                  child: Text(mode == AirportTicketFormMode.add ? "Lưu vé sân bay" : "Lưu chỉnh sửa"),
                ),
              ],
            );
          },
        );
      },
    );

    return result;
  }
}

