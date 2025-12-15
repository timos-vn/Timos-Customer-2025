import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:timos_customer_2025/models/response/detail_coach_pane_trip/detail_coach_pane_trip_response.dart';
import 'package:timos_customer_2025/themes/colors.dart';
import 'package:timos_customer_2025/utils/utils.dart';

class TicketDetailBottomSheet extends StatefulWidget {
  final DanhSachGhe danhSachGhe;
  final DateTime? ngayChay;
  final String? gioDi;

  const TicketDetailBottomSheet(
    this.danhSachGhe, {
    super.key,
    this.ngayChay,
    this.gioDi, 
  }); 

  @override
  State<TicketDetailBottomSheet> createState() => _TicketDetailBottomSheetState();

  static Future<String?> show(
    BuildContext context,
    DanhSachGhe danhSachGhe, {
    DateTime? ngayChay,
    String? gioDi,
  }) {
    return showDialog<String>(
      context: context,
      barrierColor: Colors.black54,
      barrierDismissible: false, // Không cho phép đóng bằng cách click ra ngoài
      builder: (context) => TicketDetailBottomSheet(
        danhSachGhe,
        ngayChay: ngayChay,
        gioDi: gioDi,
      ),
    );
  }
}

class _TicketDetailBottomSheetState extends State<TicketDetailBottomSheet>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  // Kiểm tra xem vé có quá giờ không
  bool get _isTicketExpired {
    if (widget.ngayChay == null || widget.gioDi == null || widget.gioDi!.isEmpty) {
      return false; // Không có thông tin thời gian thì cho phép sửa
    }

    try {
      // Parse giờ đi (format: "HH:mm" hoặc "HH:mm:ss")
      final timeParts = widget.gioDi!.split(':');
      if (timeParts.length < 2) return false;

      final hour = int.tryParse(timeParts[0]);
      final minute = int.tryParse(timeParts[1]);
      if (hour == null || minute == null) return false;

      // Tạo DateTime từ ngày chạy và giờ đi
      final departureDateTime = DateTime(
        widget.ngayChay!.year,
        widget.ngayChay!.month,
        widget.ngayChay!.day,
        hour,
        minute,
      );

      // So sánh với thời gian hiện tại
      return DateTime.now().isAfter(departureDateTime) || 
             DateTime.now().isAtSameMomentAs(departureDateTime);
    } catch (e) {
      return false; // Lỗi parse thì cho phép sửa
    }
  }

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
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.75,
            ),
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
                // Ticket Header - Compact
                _buildTicketHeader(context),
                
                // Ticket Content - Scrollable với tất cả thông tin
                Flexible(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Thông tin khách hàng
                        _buildInfoRow(
                          icon: Icons.person_outline,
                          label: "Khách hàng",
                          value: widget.danhSachGhe.tenKhachHang.isEmpty
                              ? "--"
                              : widget.danhSachGhe.tenKhachHang,
                        ),
                        const SizedBox(height: 12),

                        // Số điện thoại
                        _buildInfoRow(
                          icon: Icons.phone_outlined,
                          label: "Số điện thoại",
                          value: widget.danhSachGhe.soDienThoaiKhachHang.isEmpty 
                              ? "--" 
                              : widget.danhSachGhe.soDienThoaiKhachHang,
                          isPhone: true,
                          phoneNumber: widget.danhSachGhe.soDienThoaiKhachHang,
                        ),
                        const SizedBox(height: 12),
                        
                        // Thông tin ghế
                        _buildInfoRow(
                          icon: Icons.event_seat,
                          label: "Ghế",
                          value: "${widget.danhSachGhe.tenGhe.toUpperCase()} - Hàng ${widget.danhSachGhe.hang}, Dãy ${widget.danhSachGhe.day + 1}",
                        ),
                        const SizedBox(height: 12),
                        
                        // Loại vé
                        _buildInfoRow(
                          icon: Icons.confirmation_number,
                          label: "Loại vé",
                          value: widget.danhSachGhe.isTrungChuyen ? "Trung chuyển" : "Thường",
                          badgeColor: widget.danhSachGhe.isTrungChuyen ? Colors.green : Colors.blue,
                        ),
                        const SizedBox(height: 12),
                        
                        // Giá tiền
                        _buildInfoRow(
                          icon: Icons.attach_money,
                          label: "Điểm vé",
                          value: '${Utils.formatTotalMoney(widget.danhSachGhe.giaVe)} Điểm',
                          valueStyle: TextStyle(
                            // fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: colorApp,
                          ),
                        ),
                        const SizedBox(height: 12),
                        
                        // Địa chỉ đi
                        if (widget.danhSachGhe.diaChiKhachDi.isNotEmpty) ...[
                          _buildInfoRow(
                            icon: Icons.location_on_outlined,
                            label: "Địa chỉ đi",
                            value: widget.danhSachGhe.diaChiKhachDi,
                          ),
                          const SizedBox(height: 12),
                        ],
                        
                        // Địa chỉ đến
                        if (widget.danhSachGhe.diaChiKhachDen.isNotEmpty) ...[
                          _buildInfoRow(
                            icon: Icons.location_on_outlined,
                            label: "Địa chỉ đến",
                            value: widget.danhSachGhe.diaChiKhachDen,
                          ),
                        ],
                        
                        // Thông tin trung chuyển - Hiển thị luôn
                        if (widget.danhSachGhe.isTrungChuyen) ...[
                          const SizedBox(height: 16),
                          const Divider(),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Icon(Icons.swap_horiz, size: 18, color: colorApp),
                              const SizedBox(width: 8),
                              const Text(
                                "Thông tin trung chuyển",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          _buildInfoRow(
                            icon: Icons.person_outline,
                            label: "Tài xế",
                            value: widget.danhSachGhe.tenTaiXeTrungChuyen.isEmpty
                                ? "--"
                                : widget.danhSachGhe.tenTaiXeTrungChuyen,
                          ),
                          if (widget.danhSachGhe.soDienThoaiTaiXeTrungChuyen.isNotEmpty) ...[
                            const SizedBox(height: 12),
                            _buildInfoRow(
                              icon: Icons.phone_outlined,
                              label: "Số điện thoại",
                              value: widget.danhSachGhe.soDienThoaiTaiXeTrungChuyen,
                              isPhone: true,
                              phoneNumber: widget.danhSachGhe.soDienThoaiTaiXeTrungChuyen,
                            ),
                          ],
                          if (widget.danhSachGhe.bienSoXeTrungChuyen.isNotEmpty) ...[
                             const SizedBox(height: 12),
                             _buildInfoRow(
                               icon: Icons.directions_car_outlined,
                               label: "Biển số xe",
                               value: widget.danhSachGhe.bienSoXeTrungChuyen,
                             ),
                           ],
                        ],
                        
                        // Ghi chú - Luôn hiển thị
                        const SizedBox(height: 16),
                        const Divider(),
                        const SizedBox(height: 16),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.note_outlined, size: 18, color: colorApp),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Ghi chú",
                                    style: TextStyle(
                                      // fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    widget.danhSachGhe.ghiChu.isEmpty
                                        ? "--"
                                        : widget.danhSachGhe.ghiChu,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: Colors.black87,
                                      height: 1.4,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
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
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
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
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.confirmation_number,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              "Chi tiết vé",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => Navigator.pop(context),
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget hiển thị thông tin dạng row căn trái/phải
  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
    bool isPhone = false,
    String? phoneNumber,
    Color? badgeColor,
    TextStyle? valueStyle,
    bool indent = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Icon và Label bên trái
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (indent) const SizedBox(width: 24),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: colorApp.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, size: 18, color: colorApp),
            ),
            const SizedBox(width: 12),
            SizedBox(
              width: 100,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[700],
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 12),
        // Value bên phải - sát nề phải
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: isPhone && phoneNumber != null && phoneNumber.isNotEmpty
                ? Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => Utils.showCallDialog(context, phoneNumber),
                      borderRadius: BorderRadius.circular(6),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Text(
                                value,
                                style: valueStyle ??
                                    const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.green,
                                    ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(width: 6),
                            const Icon(Icons.phone, size: 16, color: Colors.green),
                          ],
                        ),
                      ),
                    ),
                  )
                : badgeColor != null
                    ? Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: badgeColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(6),
                          // Bỏ border
                        ),
                        child: Text(
                          value,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: badgeColor == Colors.green 
                                ? Colors.green[700] 
                                : Colors.blue[700],
                          ),
                        ),
                      )
                    : Text(
                        value,
                        style: valueStyle ??
                            const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                        textAlign: TextAlign.right,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
          ),
        ),
      ],
    );
  }


  Widget _buildTicketFooter(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Cảnh báo nếu vé quá giờ - Compact
          if (_isTicketExpired) ...[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.1),
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: Colors.orange.withOpacity(0.3)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.warning_amber_rounded, color: Colors.orange, size: 16),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      "Vé đã quá giờ khởi hành, không thể chỉnh sửa",
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.orange[800],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          Row(
            children: [
              Expanded(
                child: _buildActionButton(
                  label: "Huỷ vé",
                  backgroundColor: Colors.grey[100]!,
                  textColor: Colors.grey[800]!,
                  onPressed: () => _showCancelConfirmationDialog(context),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _buildActionButton(
                  label: "Chỉnh sửa vé",
                  backgroundColor: _isTicketExpired ? Colors.grey[300]! : colorApp,
                  textColor: _isTicketExpired ? Colors.grey[600]! : Colors.white,
                  onPressed: _isTicketExpired
                      ? null
                      : () => Navigator.pop(context, 'edit_ticket'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required String label,
    required Color backgroundColor,
    required Color textColor,
    VoidCallback? onPressed,
  }) {
    final isDisabled = onPressed == null;
    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: isDisabled ? null : onPressed,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 44,
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
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

}
