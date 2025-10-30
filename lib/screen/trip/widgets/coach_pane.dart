import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:timos_customer_2025/enum/enum_request_method.dart';
import 'package:timos_customer_2025/screen/routers/router_generator.dart';
import 'package:timos_customer_2025/themes/colors.dart';
import 'package:timos_customer_2025/services/services.dart';
import 'package:timos_customer_2025/models/response/response.dart';
import 'package:timos_customer_2025/utils/date_utils.dart';

class CoachPane extends StatefulWidget {
  const CoachPane({super.key});

  @override
  State<CoachPane> createState() => _CoachPaneState();
}

class _CoachPaneState extends State<CoachPane> {
  String vehicleType = 'Limo';
  String selectedSlot = '06:00-09:00';
  final List<String> vehicleTypes = <String>['Limo', 'Xe Khách', 'Giường nằm'];
  final List<String> timeSlots = <String>[
    '06:00-09:00',
    '09:00-12:00',
    '12:00-15:00',
    '15:00-18:00',
    '18:00-21:00'
  ];

  // API related
  final TripService _coachTripService = TripService();
  bool _isLoading = false;
  List<CoachPaneTripItem> _trips = [];

  // Date range
  DateTime _startDate = DateTime.now().add(const Duration(days: 1));
  DateTime _endDate = DateTime.now().add(const Duration(days: 8));

  @override
  void initState() {
    super.initState();
    _loadTrips();
  }

  Future<void> _loadTrips() async {
    final user = AuthService.currentUser;
    if (user == null) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final response = await _coachTripService.getCoachTripList(
        idNhaXe: user.idNhaXe,
        idLoaiNhaXe: 2,
        idNhanVien: user.id,
        ngayBatDau: intl.DateFormat('yyyy-MM-dd').format(_startDate),
        ngayKetThuc: intl.DateFormat('yyyy-MM-dd').format(_endDate),
        pageIndex: 1,
        pageSize: 50,
      );

      if (response.isSuccess) {
        setState(() {
          _trips = response.data ?? [];
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Lỗi: $e')),
        );
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _pickDateRange() async {
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now().add(const Duration(days: 1)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      initialDateRange: DateTimeRange(
        start: _startDate,
        end: _endDate,
      ),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: mainColor,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _startDate = picked.start;
        _endDate = picked.end;
      });
      _loadTrips();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Date Range Picker & Time Slot Selector
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Date Range Picker Button
              // InkWell(
              //   onTap: _pickDateRange,
              //   child: Container(
              //     padding:
              //         const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              //     decoration: BoxDecoration(
              //       color: Colors.blue[50],
              //       borderRadius: BorderRadius.circular(8),
              //       border: Border.all(color: Colors.blue),
              //     ),
              //     child: Row(
              //       mainAxisSize: MainAxisSize.min,
              //       children: [
              //         const Icon(Icons.calendar_today,
              //             size: 18, color: Colors.blue),
              //         const SizedBox(width: 8),
              //         Text(
              //           '${intl.DateFormat('dd/MM/yyyy').format(_startDate)} - ${intl.DateFormat('dd/MM/yyyy').format(_endDate)}',
              //           style: const TextStyle(
              //             color: Colors.blue,
              //             fontWeight: FontWeight.w500,
              //             fontSize: 14,
              //           ),
              //         ),
              //         const SizedBox(width: 4),
              //         const Icon(Icons.arrow_drop_down,
              //             size: 22, color: Colors.blue),
              //       ],
              //     ),
              //   ),
              // ),
              const SizedBox(height: 12),
              // Time slot selector
              SizedBox(
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext _, int i) {
                    final String slot = timeSlots[i];
                    final bool selected = slot == selectedSlot;
                    return ChoiceChip(
                      label: Text(slot),
                      selected: selected,
                      onSelected: (_) => setState(() => selectedSlot = slot),
                      selectedColor: mainColor.withOpacity(0.2),
                      side: selected
                          ? BorderSide(color: mainColor)
                          : BorderSide(color: Colors.grey.shade300),
                    );
                  },
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemCount: timeSlots.length,
                ),
              ),
            ],
          ),
        ),
        // Trip list
        Expanded(
          child: _isLoading
              ? const Center(child: CircularProgressIndicator())
              : _trips.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.inbox_outlined,
                              size: 64, color: Colors.grey[400]),
                          const SizedBox(height: 16),
                          Text(
                            'Không có chuyến đi nào',
                            style: TextStyle(
                                color: Colors.grey[600], fontSize: 16),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: _trips.length,
                      itemBuilder: (context, index) {
                        final trip = _trips[index];
                        final double progress = trip.tongSoGhe > 0
                            ? trip.soGheDaDat / trip.tongSoGhe
                            : 0.0;

                        return Card(
                          margin: const EdgeInsets.only(bottom: 12),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(16),
                            title: Text(
                              '${trip.tenTuyenDuong} • ${trip.bienSoXe}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.w600),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.access_time,
                                      size: 16,
                                      color: Colors.grey.shade600,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(trip.gioDi ?? '--:--'),
                                    const SizedBox(width: 16),
                                    Icon(
                                      Icons.person,
                                      size: 16,
                                      color: Colors.grey.shade600,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                        '${trip.soGheDaDat}/${trip.tongSoGhe}'),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.drive_eta,
                                      size: 16,
                                      color: Colors.grey.shade600,
                                    ),
                                    const SizedBox(width: 4),
                                    Expanded(
                                      child: Text(
                                        trip.tenTaiXe.isNotEmpty
                                            ? trip.tenTaiXe
                                            : 'Chưa có tài xế',
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                LinearProgressIndicator(
                                  value: progress,
                                  color: progress > 0.8
                                      ? Colors.green
                                      : progress > 0.5
                                          ? Colors.orange
                                          : mainColor,
                                  backgroundColor: Colors.grey.shade200,
                                ),
                              ],
                            ),
                            trailing: const Icon(Icons.chevron_right),
                            onTap: () => Navigator.of(context).pushNamed(
                              RouterGenerator.routeTripDetail,
                              arguments: TripSummary(
                                tripId: 'ti',
                                routeName: trip.tenTuyenDuong,
                                departureTime: DateTime.now()
                                    .add(Duration(hours: 72 + index * 3)),
                                bookedSeats: 10,
                                totalSeats: 28,
                                licensePlate:
                                trip.bienSoXe,
                                driverName: trip.tenTaiXe,
                                driverPhone:
                                    '0900${1.toString().padLeft(6, '0')}',
                              ),
                            ),
                          ),
                        );
                      },
                    ),
        ),
      ],
    );
  }
}
