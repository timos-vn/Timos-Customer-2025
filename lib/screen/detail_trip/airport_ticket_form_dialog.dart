import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:timos_customer_2025/utils/date_utils.dart';
import 'package:timos_customer_2025/utils/utils.dart';

enum AirportTicketFormMode { add, edit }

class AirportTicketFormResult {
  final String tenKhachHang;
  final String soDienThoai;
  final DateTime thoiGianDon;
  final String diaChiDi;
  final String diaChiDen;
  final int giaVe;
  final bool daThanhToan;
  final String ghiChu;

  AirportTicketFormResult({
    required this.tenKhachHang,
    required this.soDienThoai,
    required this.thoiGianDon,
    required this.diaChiDi,
    required this.diaChiDen,
    required this.giaVe,
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
    final priceCtrl = TextEditingController(text: Utils.formatTotalMoney(initialGiaVe));
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
                            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                            decoration: const InputDecoration(
                              labelText: "Giá vé (VND)",
                              hintText: "Nhập giá vé",
                            ),
                            onChanged: (v) {
                              final raw = v.replaceAll('.', '').replaceAll(',', '');
                              final numVal = int.tryParse(raw) ?? 0;
                              final formatted = Utils.formatTotalMoney(numVal);
                              priceCtrl.value = TextEditingValue(
                                text: formatted,
                                selection: TextSelection.collapsed(offset: formatted.length),
                              );
                            },
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
                    final raw = priceCtrl.text.replaceAll('.', '').replaceAll(',', '');
                    final giaVe = int.tryParse(raw) ?? 0;
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

