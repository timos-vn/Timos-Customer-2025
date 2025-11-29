import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' as intl;
import 'package:timos_customer_2025/main.dart';
import 'package:timos_customer_2025/models/response/response.dart';
import 'package:timos_customer_2025/screen/detail_trip/bloc/detail_trip_bloc.dart';
import 'package:timos_customer_2025/screen/detail_trip/detail_trip_screen.dart';
import 'package:timos_customer_2025/themes/colors.dart';
import 'package:timos_customer_2025/services/services.dart';

class CoachPane extends StatefulWidget {
  const CoachPane({super.key});

  @override
  State<CoachPane> createState() => _CoachPaneState();
}

class _CoachPaneState extends State<CoachPane> {
  final TripService _coachTripService = TripService();
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;
  List<CoachPaneTripItem> _trips = [];
  DateTime _selectedDate = DateTime.now();
  String _statusFilter = 'Tất cả';
  bool _showScrollToTop = false;

  @override
  void initState() {
    super.initState();
    _loadTrips();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    // Hiển thị FAB khi scroll xuống hơn 200px
    final shouldShow = _scrollController.offset > 200;
    if (shouldShow != _showScrollToTop) {
      setState(() {
        _showScrollToTop = shouldShow;
      });
    }
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  Future<void> _loadTrips() async {
    final user = AuthService.currentUser;
    if (user == null) return;

    setState(() => _isLoading = true);
    try {
      final response = await _coachTripService.getCoachTripList(
        idNhaXe: user.idNhaXe,
        idLoaiNhaXe: 2,
        idNhanVien: user.id,
        ngayBatDau: intl.DateFormat('yyyy-MM-dd').format(_selectedDate),
        ngayKetThuc: intl.DateFormat('yyyy-MM-dd').format(_selectedDate),
        pageIndex: 1,
        pageSize: 50,
      );
      if (response.statusCode == 200) {
        setState(() {
          _trips = response.data;
        });
      } else {
        if (!mounted) return;
        if(response.statusCode == 401) {
          navigatorKey.currentState?.pushNamedAndRemoveUntil(
            '/login',
                (route) => false,
          );
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Không thể tải chuyến: ${response.message}')),
        );

      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Không thể tải chuyến: $e')),
      );
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _openFilterBottomSheet() async {
    final result = await showModalBottomSheet<_FilterResult>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _FilterBottomSheet(
        initialDate: _selectedDate,
        initialStatus: _statusFilter,
      ),
    );

    if (result != null && mounted) {
      final dateChanged = !result.selectedDate.isAtSameMomentAs(_selectedDate);
      final statusChanged = result.status != _statusFilter;
      
      setState(() {
        _selectedDate = result.selectedDate;
        _statusFilter = result.status;
      });
      
      // Reload nếu thay đổi ngày, filter chỉ áp dụng trên client-side
      if (dateChanged) {
        _loadTrips();
      }
    }
  }

  List<CoachPaneTripItem> get _filteredTrips {
    if (_statusFilter == 'Tất cả') {
      return _trips;
    }
    
    return _trips.where((trip) {
      switch (_statusFilter) {
        case 'Chưa có tài xế':
          // Kiểm tra cả idTaiXe và tenTaiXe
          final hasNoDriver = (trip.idTaiXe == null || 
                              trip.idTaiXe?.isEmpty == true) && 
                             trip.tenTaiXe.isEmpty;
          return hasNoDriver;
        case 'Đã full':
          // Chỉ tính khi có tổng số ghế > 0 và số ghế đã đặt >= tổng số ghế
          return trip.tongSoGhe > 0 && trip.soGheDaDat >= trip.tongSoGhe;
        case 'Còn trống':
          // Phải có tổng số ghế > 0 và số ghế đã đặt < tổng số ghế
          // Nếu tongSoGhe == 0 thì không tính là còn trống (chưa có thông tin)
          return trip.tongSoGhe > 0 && trip.soGheDaDat < trip.tongSoGhe;
        default:
          return true;
      }
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final dateLabel = intl.DateFormat('dd/MM/yyyy').format(_selectedDate);

    return Stack(
      children: [
        RefreshIndicator(
          onRefresh: _loadTrips,
          color: mainColor,
          child: ListView(
            controller: _scrollController,
            padding: EdgeInsets.zero,
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              const SizedBox(height: 16),
              _TripSection(
                dateLabel: dateLabel,
                isLoading: _isLoading,
                trips: _filteredTrips,
                onOpenFilter: _openFilterBottomSheet,
                onTripTap: (trip) async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BlocProvider(
                        create: (_) => DetailTripBloc(),
                        child: TripDetailScreen(
                          idLichXeLimousine: trip.id,
                          coachPaneTripItem: trip,
                        ),
                      ),
                      settings: RouteSettings(name: "TRIP_DETAIL"),
                    ),
                  );
                  // Reload dữ liệu khi quay lại từ màn chi tiết chuyến
                  if (mounted) {
                    _loadTrips();
                  }
                },
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
        // Floating button scroll to top
        AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          bottom: _showScrollToTop ? 20 : -80,
          right: 20,
          child: FloatingActionButton(
            onPressed: _scrollToTop,
            backgroundColor: mainColor,
            child: const Icon(Icons.arrow_upward, color: Colors.white),
          ),
        ),
      ],
    );
  }
}

class _TripSection extends StatelessWidget {
  final String dateLabel;
  final bool isLoading;
  final List<CoachPaneTripItem> trips;
  final ValueChanged<CoachPaneTripItem> onTripTap;
  final VoidCallback onOpenFilter;

  const _TripSection({
    required this.dateLabel,
    required this.isLoading,
    required this.trips,
    required this.onTripTap,
    required this.onOpenFilter,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.fromLTRB(8, 20, 8, 24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 18,
              offset: const Offset(0, 12),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Danh sách chuyến',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        dateLabel,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: onOpenFilter,
                  icon: const Icon(Icons.tune, color: mainColor),
                ),
              ],
            ),
            const SizedBox(height: 20),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              child: isLoading
                  ? const _TripLoadingPlaceholder()
                  : trips.isEmpty
                      ? _TripEmptyState(onAction: onOpenFilter)
                      : ListView.separated(
                          key: const ValueKey('trip-list'),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (_, index) => _TripCard(
                            trip: trips[index],
                            onTap: () => onTripTap(trips[index]),
                          ),
                          separatorBuilder: (_, __) => const SizedBox(height: 12),
                          itemCount: trips.length,
                        ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TripLoadingPlaceholder extends StatelessWidget {
  const _TripLoadingPlaceholder();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      key: ValueKey('trip-loading'),
      height: 200,
      child: Center(child: CircularProgressIndicator()),
    );
  }
}

class _TripEmptyState extends StatelessWidget {
  final VoidCallback onAction;

  const _TripEmptyState({required this.onAction});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const ValueKey('trip-empty'),
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 28, 20, 32),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: mainColor.withValues(alpha: 0.2)),
        gradient: LinearGradient(
          colors: [
            Colors.white,
            mainColor.withValues(alpha: 0.04),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 64,
            width: 64,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 18,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: const Icon(Icons.inbox_outlined, color: mainColor, size: 28),
          ),
          const SizedBox(height: 16),
          Text(
            'Không có chuyến trong khoảng thời gian này',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Điều chỉnh bộ lọc ngày hoặc trạng thái để tìm thêm chuyến phù hợp.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey.shade600,
                ),
          ),
          const SizedBox(height: 20),
          OutlinedButton.icon(
            onPressed: onAction,
            style: OutlinedButton.styleFrom(
              foregroundColor: mainColor,
              side: BorderSide(color: mainColor.withValues(alpha: 0.4)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
            icon: const Icon(Icons.tune),
            label: const Text(
              'Điều chỉnh bộ lọc',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
class _TripCard extends StatelessWidget {
  final CoachPaneTripItem trip;
  final VoidCallback onTap;

  const _TripCard({required this.trip, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final bool isFull =
        trip.tongSoGhe > 0 && trip.soGheDaDat >= trip.tongSoGhe;
    final bool noDriver = trip.tenTaiXe.isEmpty;
    final double progress =
        trip.tongSoGhe > 0 ? trip.soGheDaDat / trip.tongSoGhe : 0;
    final String driverLabel =
        trip.tenTaiXe.isNotEmpty ? trip.tenTaiXe : 'Chưa có tài xế';

    Color progressColor;
    if (progress >= 0.9) {
      progressColor = Colors.green;
    } else if (progress >= 0.5) {
      progressColor = Colors.orange;
    } else {
      progressColor = mainColor;
    }

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        padding: const EdgeInsets.fromLTRB(14, 14, 14, 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: Colors.black.withValues(alpha: 0.09),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 18,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    trip.tenTuyenDuong,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ),
                _PlateChip(plate: trip.bienSoXe),
              ],
            ),
            const SizedBox(height: 6),
            Wrap(
              spacing: 10,
              runSpacing: 6,
              children: [
                _InfoChip(
                  icon: Icons.calendar_month,
                  value: _formatTripDate(trip.ngayChay.toString()),
                ),
                _InfoChip(
                  icon: Icons.schedule,
                  value: _formatTripTime(trip.gioDi),
                ),
                // _InfoChip(
                //   icon: Icons.event_seat,
                //   value: '${trip.soGheDaDat}/${trip.tongSoGhe} ghế',
                //   warning: isFull,
                // ),
              ],
            ),
            const SizedBox(height: 8),
            _DriverRow(
              driverLabel: driverLabel,
              warning: noDriver,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  isFull ? 'Đã đầy' : 'Tiến độ đặt vé',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: Colors.grey.shade700,
                      ),
                ),
                Text(
                  '${trip.soGheDaDat}/${trip.tongSoGhe} ghế',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 5,
                color: progressColor,
                backgroundColor: Colors.grey.shade200,
              ),
            ),
            // const SizedBox(height: 4),
            // Text(
            //   isFull ? 'Đã đầy' : 'Còn vé',
            //   style: Theme.of(context).textTheme.bodySmall?.copyWith(
            //         fontWeight: FontWeight.w600,
            //         color: isFull ? Colors.green : mainColor,
            //       ),
            // ),
          ],
        ),
      ),
    );
  }
}

String _formatTripDate(String? raw) {
  if (raw == null || raw.isEmpty) return '--/--/----';
  try {
    final parsed = DateTime.parse(raw);
    return intl.DateFormat('dd-MM-yyyy').format(parsed);
  } catch (_) {
    return raw;
  }
}

String _formatTripTime(String? raw) {
  if (raw == null || raw.isEmpty) return '--:--';
  try {
    final parsed = DateTime.parse('1970-01-01T$raw');
    return intl.DateFormat('HH:mm').format(parsed);
  } catch (_) {
    return raw;
  }
}

class _PlateChip extends StatelessWidget {
  final String plate;

  const _PlateChip({required this.plate});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: mainColor.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.directions_bus, size: 16, color: mainColor),
          const SizedBox(width: 4),
          Text(
            plate.isNotEmpty ? plate : '---',
            style: const TextStyle(
              color: mainColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String value;
  final bool warning;

  const _InfoChip({
    required this.icon,
    required this.value,
    this.warning = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = warning ? Colors.orange : Colors.grey.shade800;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: warning
            ? Colors.orange.withValues(alpha: 0.08)
            : const Color(0xFFF7F7F7),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 4),
          Text(
            value,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class _DriverRow extends StatelessWidget {
  final String driverLabel;
  final bool warning;

  const _DriverRow({
    required this.driverLabel,
    required this.warning,
  });

  @override
  Widget build(BuildContext context) {
    final color = warning ? Colors.orange : Colors.grey.shade800;
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: warning
                ? Colors.orange.withValues(alpha: 0.1)
                : Colors.grey.shade100,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            warning ? Icons.warning_amber : Icons.person_pin_circle,
            size: 16,
            color: color,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            driverLabel,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

class _FilterBottomSheet extends StatefulWidget {
  final DateTime initialDate;
  final String initialStatus;

  const _FilterBottomSheet({
    required this.initialDate,
    required this.initialStatus,
  });

  @override
  State<_FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<_FilterBottomSheet> {
  static const List<String> _statuses = [
    'Tất cả',
    'Chưa có tài xế',
    'Đã full',
    'Còn trống',
  ];

  late DateTime _tempDate = widget.initialDate;
  late String _tempStatus = widget.initialStatus;

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _tempDate,
      firstDate: DateTime.now().subtract(const Duration(days: 0)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: mainColor,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _tempDate = picked;
      });
    }
  }

  void _apply() {
    Navigator.of(context).pop(
      _FilterResult(
        selectedDate: _tempDate,
        status: _tempStatus,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Bộ lọc chuyến',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: _pickDate,
                child: Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ngày',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: Colors.grey.shade600,
                                ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            intl.DateFormat('dd/MM/yyyy').format(_tempDate),
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      const Icon(Icons.calendar_month, color: mainColor),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Trạng thái chuyến',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey.shade600,
                    ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 10,
                runSpacing: 8,
                children: _statuses
                    .map(
                      (status) => _StatusFilterChip(
                        label: status,
                        isSelected: _tempStatus == status,
                        onTap: () => setState(() {
                          _tempStatus = status;
                        }),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Đóng'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: mainColor,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: _apply,
                      child: const Text('Áp dụng'),
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

class _StatusFilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _StatusFilterChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? mainColor.withValues(alpha: 0.1) : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? mainColor : Colors.transparent,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: isSelected ? mainColor : Colors.grey.shade700,
          ),
        ),
      ),
    );
  }
}

class _FilterResult {
  final DateTime selectedDate;
  final String status;

  const _FilterResult({
    required this.selectedDate,
    required this.status,
  });
}
class _StatusPill extends StatelessWidget {
  final String label;
  final Color color;

  const _StatusPill({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ),
    );
  }
}

class _DateRangePickerSheet extends StatefulWidget {
  final DateTimeRange initialRange;

  const _DateRangePickerSheet({required this.initialRange});

  @override
  State<_DateRangePickerSheet> createState() => _DateRangePickerSheetState();
}

class _DateRangePickerSheetState extends State<_DateRangePickerSheet> {
  late final DateTime _initialStart = widget.initialRange.start;
  late final DateTime _initialEnd = widget.initialRange.end;
  DateTime? _tempStart;
  DateTime? _tempEnd;

  @override
  void initState() {
    super.initState();
    _tempStart = _initialStart;
    _tempEnd = _initialEnd;
  }

  void _onDaySelected(DateTime date) {
    setState(() {
      if (_tempStart == null || (_tempStart != null && _tempEnd != null)) {
        _tempStart = date;
        _tempEnd = null;
      } else {
        if (date.isBefore(_tempStart!)) {
          _tempEnd = _tempStart;
          _tempStart = date;
        } else {
          _tempEnd = date;
        }
      }
    });
  }

  void _applyQuickRange(int days) {
    setState(() {
      _tempStart = DateTime.now();
      _tempEnd = DateTime.now().add(Duration(days: days - 1));
    });
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return Padding(
      padding: EdgeInsets.only(bottom: bottom),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Chọn khoảng thời gian',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _RangeSummaryChip(
                    title: 'Ngày bắt đầu',
                    date: _tempStart,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _RangeSummaryChip(
                    title: 'Ngày kết thúc',
                    date: _tempEnd,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Theme(
              data: Theme.of(context).copyWith(
                colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary: Colors.black,          // màu của ngày được chọn
                  onPrimary: Colors.red,      // màu chữ của ngày được chọn
                ),
              ),
              child: CalendarDatePicker(
                initialDate: _tempStart ?? DateTime.now(),
                firstDate: DateTime.now().subtract(const Duration(days: 0)),
                lastDate: DateTime.now().add(const Duration(days: 365)),
                onDateChanged: _onDaySelected,
              ),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerLeft,
              child: Wrap(
                spacing: 8,
                children: [
                  _QuickRangeChip(label: '7 ngày', onTap: () => _applyQuickRange(7)),
                  _QuickRangeChip(label: '14 ngày', onTap: () => _applyQuickRange(14)),
                  _QuickRangeChip(label: '30 ngày', onTap: () => _applyQuickRange(30)),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Hủy'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: mainColor,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: _tempStart == null
                        ? null
                        : () {
                            final start = _tempStart!;
                            final end = _tempEnd ?? _tempStart!;
                            Navigator.pop(
                              context,
                              DateTimeRange(start: start, end: end),
                            );
                          },
                    child: const Text('Áp dụng'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _RangeSummaryChip extends StatelessWidget {
  final String title;
  final DateTime? date;

  const _RangeSummaryChip({required this.title, required this.date});

  @override
  Widget build(BuildContext context) {
    final text = date != null
        ? intl.DateFormat('dd/MM/yyyy').format(date!)
        : '--/--/----';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(height: 4),
          Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

class _QuickRangeChip extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _QuickRangeChip({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(label),
      selected: false,
      onSelected: (_) => onTap(),
      backgroundColor: Colors.grey.shade100,
      shape: StadiumBorder(
        side: BorderSide(color: Colors.grey.shade300),
      ),
    );
  }
}
