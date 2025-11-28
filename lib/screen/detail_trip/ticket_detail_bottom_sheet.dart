import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:timos_customer_2025/models/response/detail_coach_pane_trip/detail_coach_pane_trip_response.dart';
import 'package:timos_customer_2025/themes/colors.dart';
import 'package:timos_customer_2025/utils/utils.dart';

class TicketDetailBottomSheet extends StatefulWidget {
  final DanhSachGhe danhSachGhe;

  const TicketDetailBottomSheet(this.danhSachGhe, {super.key});

  @override
  State<TicketDetailBottomSheet> createState() => _TicketDetailBottomSheetState();

  static Future<String?> show(BuildContext context, DanhSachGhe danhSachGhe) {
    return showDialog<String>(
      context: context,
      barrierColor: Colors.black54,
      barrierDismissible: false, // Không cho phép đóng bằng cách click ra ngoài
      builder: (context) => TicketDetailBottomSheet(danhSachGhe),
    );
  }
}

class _TicketDetailBottomSheetState extends State<TicketDetailBottomSheet>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _scaleAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutBack,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Container(
            constraints: const BoxConstraints(maxHeight: 600),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Ticket Header
                _buildTicketHeader(context),
                
                // Ticket Content
                Flexible(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Thông tin khách hàng
                        _buildTicketSection(
                          icon: Icons.person,
                          title: "Thông tin khách hàng",
                          children: [
                            _buildTicketItem("Tên", widget.danhSachGhe.tenKhachHang),
                            const SizedBox(height: 12),
                            _buildPhoneItem(
                              "Số điện thoại",
                              widget.danhSachGhe.soDienThoaiKhachHang,
                              onTap: () => _showCallDialog(
                                context,
                                widget.danhSachGhe.soDienThoaiKhachHang,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        // Thông tin vé
                        _buildTicketSection(
                          icon: Icons.confirmation_number,
                          title: "Thông tin vé",
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Loại vé",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: widget.danhSachGhe.isTrungChuyen
                                        ? Colors.green.withOpacity(0.1)
                                        : Colors.blue.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: widget.danhSachGhe.isTrungChuyen
                                          ? Colors.green
                                          : Colors.blue,
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Text(
                                    widget.danhSachGhe.isTrungChuyen ? "Trung chuyển" : "Thường",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: widget.danhSachGhe.isTrungChuyen
                                          ? Colors.green
                                          : Colors.blue,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Giá tiền",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  Utils.formatTotalMoney(widget.danhSachGhe.giaVe),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: colorApp,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        // Thông tin ghế
                        _buildTicketSection(
                          icon: Icons.event_seat,
                          title: "Thông tin ghế",
                          children: [
                            _buildTicketItem("Tên ghế", widget.danhSachGhe.tenGhe.toUpperCase()),
                            const SizedBox(height: 12),
                            _buildTicketItem(
                              "Vị trí",
                              "Hàng ${widget.danhSachGhe.hang} - Dãy ${widget.danhSachGhe.day}",
                            ),
                          ],
                        ),

                        // Thông tin trung chuyển
                        if (widget.danhSachGhe.isTrungChuyen) ...[
                          const SizedBox(height: 20),
                          _buildTicketSection(
                            icon: Icons.swap_horiz,
                            title: "Thông tin trung chuyển",
                            children: [
                              _buildTicketItem("Tài xế", widget.danhSachGhe.tenTaiXeTrungChuyen),
                              if (widget.danhSachGhe.soDienThoaiTaiXeTrungChuyen.isNotEmpty) ...[
                                const SizedBox(height: 12),
                                _buildPhoneItem(
                                  "Số điện thoại",
                                  widget.danhSachGhe.soDienThoaiTaiXeTrungChuyen,
                                  onTap: () => _showCallDialog(
                                    context,
                                    widget.danhSachGhe.soDienThoaiTaiXeTrungChuyen,
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ],

                        // Ghi chú
                        if (widget.danhSachGhe.ghiChu.isNotEmpty) ...[
                          const SizedBox(height: 20),
                          _buildTicketSection(
                            icon: Icons.note,
                            title: "Ghi chú",
                            children: [
              Text(
                widget.danhSachGhe.ghiChu,
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.black87,
                  height: 1.5,
                ),
              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                ),

                // Ticket Footer với buttons
                _buildTicketFooter(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTicketHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [colorApp, colorApp.withOpacity(0.8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.confirmation_number,
              color: Colors.white,
              size: 28,
            ),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Chi tiết vé",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Thông tin đặt vé",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => Navigator.pop(context),
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTicketSection({
    required IconData icon,
    required String title,
    required List<Widget> children,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 18, color: colorApp),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...children,
        ],
      ),
    );
  }

  Widget _buildTicketItem(String label, String value) {
    if (value.isEmpty) value = "--";
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            color: Colors.grey,
          ),
        ),
        Flexible(
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPhoneItem(String label, String phone, {required VoidCallback onTap}) {
    final isEmpty = phone.isEmpty;
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            color: Colors.grey,
          ),
        ),
        isEmpty
            ? const Text(
                "--",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              )
            : Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: onTap,
                  borderRadius: BorderRadius.circular(8),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          phone,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.green,
                          ),
                        ),
                        const SizedBox(width: 6),
                        const Icon(
                          Icons.phone,
                          size: 16,
                          color: Colors.green,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ],
    );
  }

  Widget _buildTicketFooter(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.grey[200]!, width: 1),
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Row(
        children: [
            Expanded(
              child: _buildActionButton(
                label: "Huỷ vé",
                backgroundColor: Colors.grey[100]!,
                textColor: Colors.grey[800]!,
                onPressed: () => _showCancelConfirmationDialog(context),
              ),
            ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildActionButton(
              label: "Chỉnh sửa vé",
              backgroundColor: colorApp,
              textColor: Colors.white,
              onPressed: () => Navigator.pop(context, 'edit_ticket'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required String label,
    required Color backgroundColor,
    required Color textColor,
    required VoidCallback onPressed,
  }) {
    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          height: 50,
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }

  void _showCancelConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Row(
          children: [
            Icon(Icons.warning_amber_rounded, color: Colors.orange, size: 28),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                "Xác nhận hủy vé",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Bạn có chắc chắn muốn hủy vé này không?",
              style: TextStyle(
                fontSize: 15,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.orange.withOpacity(0.3)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.info_outline, color: Colors.orange, size: 20),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Hành động này không thể hoàn tác",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.orange[800],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
            child: Text(
              "Không",
              style: TextStyle(
                color: Colors.grey[600],
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context); // Đóng dialog xác nhận
              Navigator.pop(context, 'cancel_ticket'); // Trả về kết quả cho dialog chính
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 0,
            ),
            child: const Text(
              "Xác nhận hủy",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showCallDialog(BuildContext context, String phoneNumber) {
    if (phoneNumber.isEmpty) return;

    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 0.0, end: 1.0),
                duration: const Duration(milliseconds: 300),
                curve: Curves.elasticOut,
                builder: (context, value, child) {
                  return Transform.scale(
                    scale: value,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.phone, color: Colors.green, size: 36),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              const Text(
                "Gọi điện",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                phoneNumber,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 28),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        "Huỷ",
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        Navigator.pop(context);
                        final uri = Uri.parse('tel:$phoneNumber');
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(uri);
                        } else {
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Không thể thực hiện cuộc gọi'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        "Gọi ngay",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
