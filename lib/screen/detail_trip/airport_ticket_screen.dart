import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:timos_customer_2025/const/const.dart';
import 'package:timos_customer_2025/screen/detail_trip/airport_ticket_form_dialog.dart';
import 'package:timos_customer_2025/services/trip_service.dart';
import 'package:timos_customer_2025/utils/date_utils.dart';
import 'package:timos_customer_2025/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class AirportTicket {
  final String id;
  final String tenKhachHang;
  final String soDienThoai;
  final DateTime? thoiGianDon;
  final String diaChiDi;
  final String diaChiDen;
  final num giaVe;
  final bool daThanhToan;
  final String ghiChu;
  final String driverName;
  final String driverPhone;
  final String driverPlate;
  final String driverColor;

  AirportTicket({
    required this.id,
    required this.tenKhachHang,
    required this.soDienThoai,
    required this.thoiGianDon,
    required this.diaChiDi,
    required this.diaChiDen,
    required this.giaVe,
    required this.daThanhToan,
    required this.ghiChu,
    required this.driverName,
    required this.driverPhone,
    required this.driverPlate,
    required this.driverColor,
  });

  factory AirportTicket.fromJson(Map<String, dynamic> json) {
    return AirportTicket(
      id: json["id"] ?? "",
      tenKhachHang: json["tenKhachHang"] ?? "",
      soDienThoai: json["soDienThoai"] ?? "",
      thoiGianDon: DateTime.tryParse(json["thoiGianDon"] ?? ""),
      diaChiDi: json["diaChiDi"] ?? "",
      diaChiDen: json["diaChiDen"] ?? "",
      giaVe: json["giaVe"] ?? 0,
      daThanhToan: json["daThanhToan"] ?? false,
      ghiChu: json["ghiChu"] ?? "",
      driverName: json["tenTaiXeNhanVe"] ?? "",
      driverPhone: json["soDienThoaiTaiXeNhanVe"] ?? "",
      driverPlate: json["bienSoXeNhanVe"] ?? "",
      driverColor: json["mauXeNhanVe"] ?? "",
    );
  }
}

class AirportTicketScreen extends StatefulWidget {
  final String idChuyenDi;

  const AirportTicketScreen({
    super.key,
    required this.idChuyenDi,
  });

  @override
  State<AirportTicketScreen> createState() => _AirportTicketScreenState();
}

class _AirportTicketScreenState extends State<AirportTicketScreen> {
  final TripService _tripService = TripService();
  final TextEditingController _searchCtrl = TextEditingController();

  List<AirportTicket> tickets = [];
  int total = 0;
  int pageIndex = 1;
  final int pageSize = 20;
  bool loading = false;
  bool loadingMore = false;
  bool deleting = false;
  bool updating = false;
  String? error;

  Future<VoidCallback> _showLoading(String message) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          content: Row(
            children: [
              const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
              const SizedBox(width: 12),
              Expanded(child: Text(message)),
            ],
          ),
        ),
      ),
    );
    return () {
      if (Navigator.of(context).canPop()) {
        Navigator.of(context).pop();
      }
    };
  }

  @override
  void initState() {
    super.initState();
    _fetch(reset: true);
  }

  Future<void> _fetch({bool reset = false}) async {
    if (loading || loadingMore) return;
    if (reset) {
      pageIndex = 1;
      tickets.clear();
    }
    setState(() {
      if (reset) {
        loading = true;
      } else {
        loadingMore = true;
      }
      error = null;
    });
    try {
      final response = await _tripService.getAirportTicketList(
        idChuyenDi: widget.idChuyenDi,
        pageIndex: pageIndex,
        pageSize: pageSize,
      );
      final List<dynamic> data = response["data"] ?? [];
      final list = data.map((e) => AirportTicket.fromJson(e)).toList();
      total = response["totalRecords"] ?? (reset ? list.length : total);
      if (reset) {
        tickets = list;
      } else {
        tickets.addAll(list);
      }
      pageIndex++;
    } catch (e) {
      error = "Tải danh sách vé sân bay thất bại";
    } finally {
      if (mounted) {
        setState(() {
          loading = false;
          loadingMore = false;
        });
      }
    }
  }

  Future<void> _editTicket(AirportTicket item) async {
    if (updating) return;
    final formResult = await AirportTicketFormDialog.show(
      context,
      mode: AirportTicketFormMode.edit,
      initialTenKhach: item.tenKhachHang,
      initialSdt: item.soDienThoai,
      initialThoiGianDon: item.thoiGianDon ?? DateTime.now(),
      initialDiaChiDi: item.diaChiDi,
      initialDiaChiDen: item.diaChiDen,
      initialGiaVe: item.giaVe.toInt(),
      initialDaThanhToan: item.daThanhToan,
      initialGhiChu: item.ghiChu,
    );

    if (formResult == null) return;

    final userId = GetStorage().read(Const.USER_ID) ?? "";

    setState(() {
      updating = true;
    });
    final closeLoading = await _showLoading("Đang lưu thay đổi...");

    try {
      await _tripService.updateAirportTicket(
        idVeSanBay: item.id,
        thoiGianDon: formResult.thoiGianDon.toIso8601String(),
        diaChiDi: formResult.diaChiDi,
        diaChiDen: formResult.diaChiDen,
        giaVe: formResult.giaVe,
        diemBanVe: formResult.diemBanVe,
        daThanhToan: formResult.daThanhToan,
        ghiChu: formResult.ghiChu,
        tenKhachHang: formResult.tenKhachHang,
        soDienThoai: formResult.soDienThoai,
        nguoiSua: userId,
      );
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Sửa vé thành công"),
          backgroundColor: Colors.green,
        ),
      );
      await _fetch(reset: true);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Sửa vé thất bại: $e"),
          backgroundColor: Colors.red.shade600,
        ),
      );
    } finally {
      closeLoading();
      if (mounted) {
        setState(() {
          updating = false;
        });
      }
    }
  }

  Future<String?> _askDeleteReason() async {
    final controller = TextEditingController();
    String? errorText;
    return showDialog<String>(
      context: context,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (ctx, setStateDialog) {
            return AlertDialog(
              title: const Text("Xoá vé sân bay"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Nhập lý do xoá vé"),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: controller,
                    autofocus: true,
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: "Lý do xoá",
                      errorText: errorText,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(ctx).pop(null),
                  child: const Text("Huỷ"),
                ),
                ElevatedButton(
                  onPressed: () {
                    final reason = controller.text.trim();
                    if (reason.isEmpty) {
                      setStateDialog(() {
                        errorText = "Vui lòng nhập lý do xoá";
                      });
                      return;
                    }
                    Navigator.of(ctx).pop(reason);
                  },
                  child: const Text("Xoá vé"),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Future<void> _cancelTicket(AirportTicket item) async {
    if (deleting) return;
    final lyDo = await _askDeleteReason();
    if (lyDo == null) return;
    final box = GetStorage();
    final userId = box.read(Const.USER_ID) ?? "";

    setState(() {
      deleting = true;
    });
    final closeLoading = await _showLoading("Đang xoá vé...");

    try {
      await _tripService.deleteAirportTicket(
        idVeSanBay: item.id,
        lyDoXoa: lyDo,
        nguoiXoa: userId,
      );
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Xoá vé thành công"),
          backgroundColor: Colors.green,
        ),
      );
      await _fetch(reset: true);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Xoá vé thất bại: $e"),
          backgroundColor: Colors.red.shade600,
        ),
      );
    } finally {
      closeLoading();
      if (mounted) {
        setState(() {
          deleting = false;
        });
      }
    }
  }

  // _showActionChooser no longer used (slidable actions are inline)

  @override
  Widget build(BuildContext context) {
    final keyword = _searchCtrl.text.trim().toLowerCase();
    final filtered = keyword.isEmpty
        ? tickets
        : tickets.where((t) {
            return t.tenKhachHang.toLowerCase().contains(keyword) ||
                t.soDienThoai.toLowerCase().contains(keyword) ||
                t.diaChiDi.toLowerCase().contains(keyword) ||
                t.diaChiDen.toLowerCase().contains(keyword);
          }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Vé đi sân bay"),
      ),
      body: RefreshIndicator(
        onRefresh: () => _fetch(reset: true),
        child: Column(
          children: [
            // Driver info removed; each ticket has its own driver info
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
              child: TextField(
                controller: _searchCtrl,
                onChanged: (_) => setState(() {}),
                decoration: InputDecoration(
                  hintText: "Tìm tên / SĐT / địa chỉ...",
                  prefixIcon: const Icon(Icons.search),
                  isDense: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            if (loading)
              const Expanded(
                child: Center(child: CircularProgressIndicator()),
              )
            else if (error != null)
              Expanded(
                child: Center(
                  child: Text(
                    error!,
                    style: TextStyle(color: Colors.red.shade600),
                  ),
                ),
              )
            else if (filtered.isEmpty)
              const Expanded(
                child: Center(child: Text("Không có dữ liệu")),
              )
            else
              Expanded(
                child: ListView.separated(
                  itemCount: filtered.length + 1,
                  separatorBuilder: (_, __) => Divider(
                    color: Colors.grey.shade200,
                    height: 1,
                  ),
                  itemBuilder: (context, index) {
                    if (index == filtered.length) {
                      final hasMore = tickets.length < total;
                      if (!hasMore) return const SizedBox.shrink();
                      return Padding(
                        padding: const EdgeInsets.all(12),
                        child: ElevatedButton(
                          onPressed: loadingMore ? null : () => _fetch(reset: false),
                          child: loadingMore
                              ? const SizedBox(
                                  width: 16,
                                  height: 16,
                                  child: CircularProgressIndicator(strokeWidth: 2),
                                )
                              : const Text("Tải thêm"),
                        ),
                      );
                    }
                    final item = filtered[index];
                    return Slidable(
                      key: ValueKey(item.id),
                      endActionPane: ActionPane(
                        motion: const DrawerMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (_) => _editTicket(item),
                            backgroundColor: Colors.green.withOpacity(0.15),
                            foregroundColor: Colors.green.shade700,
                            icon: Icons.edit,
                            label: 'Sửa vé',
                          ),
                          SlidableAction(
                            onPressed: (_) => _cancelTicket(item),
                            backgroundColor: Colors.red.withOpacity(0.15),
                            foregroundColor: Colors.red.shade700,
                            icon: Icons.delete_forever,
                            label: 'Xoá vé',
                          ),
                        ],
                      ),
                      child: Card(
                        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.grey.shade200),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: 18,
                                    backgroundColor: Colors.blue.withOpacity(0.1),
                                    child: const Icon(Icons.flight, color: Colors.blue, size: 18),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item.tenKhachHang,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w700, fontSize: 14.5),
                                        ),
                                        const SizedBox(height: 2),
                                        Text(item.soDienThoai,
                                            style: const TextStyle(fontSize: 12.5)),
                                        const SizedBox(height: 4),
                                        Text(
                                          "${item.diaChiDi} → ${item.diaChiDen}",
                                          style: TextStyle(
                                              fontSize: 12, color: Colors.grey.shade700),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 4),
                                        Row(
                                          children: [
                                            const Icon(Icons.access_time,
                                                size: 14, color: Colors.grey),
                                            const SizedBox(width: 4),
                                            Text(
                                              convertDateToString(item.thoiGianDon, pattern13),
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey.shade700),
                                            ),
                                          ],
                                        ),
                                        if (item.driverName.isNotEmpty ||
                                            item.driverPhone.isNotEmpty ||
                                            item.driverPlate.isNotEmpty ||
                                            item.driverColor.isNotEmpty) ...[
                                          const SizedBox(height: 4),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const Icon(Icons.directions_car,
                                                  size: 14, color: Colors.blue),
                                              const SizedBox(width: 4),
                                              Expanded(
                                                child: Text(
                                                  "${item.driverName.isNotEmpty ? item.driverName : '--'}"
                                                  " | ${item.driverPhone.isNotEmpty ? item.driverPhone : '--'}"
                                                  " | ${item.driverPlate.isNotEmpty ? item.driverPlate : '--'}"
                                                  " | ${item.driverColor.isNotEmpty ? item.driverColor : '--'}",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey.shade700),
                                                  maxLines: 2,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ],
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        Utils.formatTotalMoney(item.giaVe.toInt()),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w700, color: Colors.black87),
                                      ),
                                      const SizedBox(height: 4),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 6, vertical: 2),
                                        decoration: BoxDecoration(
                                          color: item.daThanhToan
                                              ? Colors.green.withOpacity(0.1)
                                              : Colors.orange.withOpacity(0.1),
                                          borderRadius: BorderRadius.circular(6),
                                        ),
                                        child: Text(
                                          item.daThanhToan
                                              ? "Đã thanh toán"
                                              : "Chưa thanh toán",
                                          style: TextStyle(
                                            fontSize: 11,
                                            color: item.daThanhToan
                                                ? Colors.green
                                                : Colors.orange,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                          TextButton.icon(
                            onPressed: () => Utils.showCallDialog(context,item.soDienThoai),
                            icon: const Icon(Icons.phone, size: 16, color: Colors.green),
                            label: const Text("Gọi khách"),
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.green,
                            ),
                          ),
                          const SizedBox(width: 4),
                          TextButton.icon(
                            onPressed: () => Utils.showCallDialog(context,item.driverPhone),
                            icon: const Icon(Icons.phone_in_talk,
                                size: 16, color: Colors.blue),
                            label: const Text("Gọi tài xế"),
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.blue,
                            ),
                          ),
                          // const SizedBox(width: 4),
                          // TextButton.icon(
                          //   onPressed: () => _cancelTicket(item),
                          //   icon: const Icon(Icons.delete_forever,
                          //       size: 16, color: Colors.red),
                          //   label: const Text("Xoá vé"),
                          //   style: TextButton.styleFrom(
                          //     foregroundColor: Colors.red,
                          //   ),
                          // ),
                                ],
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
          ],
        ),
      ),
      bottomNavigationBar: null,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

}

