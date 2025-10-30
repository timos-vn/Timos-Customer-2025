import 'package:flutter/material.dart';
import 'package:timos_customer_2025/themes/colors.dart';
import 'package:timos_customer_2025/screen/routers/router_generator.dart';

class DriverView extends StatefulWidget {
  final List<String> vehicleTypes;
  final List<String> timeSlots;
  final String vehicleType;
  final String selectedSlot;
  final int selectedDateOffset;
  final Set<int> daysWithCustomers;
  final VoidCallback? onVehicleTypeChanged;
  final VoidCallback? onDateChanged;

  const DriverView({
    super.key,
    required this.vehicleTypes,
    required this.timeSlots,
    required this.vehicleType,
    required this.selectedSlot,
    required this.selectedDateOffset,
    required this.daysWithCustomers,
    this.onVehicleTypeChanged,
    this.onDateChanged,
  });

  @override
  State<DriverView> createState() => _DriverViewState();
}

class _DriverViewState extends State<DriverView> {
  late String vehicleType;
  late int selectedDateOffset;

  @override
  void initState() {
    super.initState();
    vehicleType = widget.vehicleType;
    selectedDateOffset = widget.selectedDateOffset;
  }

  List<TripSummary> buildTrips() {
    return List<TripSummary>.generate(
      8,
      (int i) => TripSummary(
        tripId: 't$i',
        routeName: '$vehicleType ${widget.selectedSlot.replaceAll(':00', '')}',
        departureTime: DateTime.now().add(Duration(hours: i)),
        bookedSeats: 10 + (i % 10),
        totalSeats: 28,
        licensePlate: '29B-12${i.toString().padLeft(3, '0')}',
        driverName: 'Tài xế ${i + 1}',
        driverPhone: '0900${i.toString().padLeft(6, '0')}',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tài xế nhà xe'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 56,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: 14,
              itemBuilder: (BuildContext _, int i) {
                final DateTime d = DateTime.now().add(Duration(days: i));
                final bool selected = i == selectedDateOffset;
                final bool hasCustomers = widget.daysWithCustomers.contains(i);
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (hasCustomers)
                          Container(
                            width: 6,
                            height: 6,
                            margin: const EdgeInsets.only(right: 6),
                            decoration: BoxDecoration(
                              color: mainColor,
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                        Text('${d.day}/${d.month}')
                      ],
                    ),
                    selected: selected,
                    onSelected: (_) {
                      setState(() => selectedDateOffset = i);
                      widget.onDateChanged?.call();
                    },
                    selectedColor: mainColor.withOpacity(0.2),
                    side: hasCustomers
                        ? BorderSide(color: mainColor)
                        : BorderSide(color: Colors.grey.shade300),
                  ),
                );
              },
            ),
          ),
          // Trip list
          Expanded(
            child: _buildTripList(),
          ),
        ],
      ),
    );
  }

  Widget _buildTripList() {
    final List<TripSummary> trips = buildTrips();

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        ...trips.map((TripSummary t) {
          final double progress = t.bookedSeats / t.totalSeats;
          return Card(
            margin: const EdgeInsets.only(bottom: 8),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              title: Text(
                '${t.routeName} • ${t.licensePlate}',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.person,
                        size: 16,
                        color: Colors.grey.shade600,
                      ),
                      const SizedBox(width: 4),
                      Text('${t.bookedSeats}/${t.totalSeats} khách'),
                      const SizedBox(width: 16),
                      Icon(
                        Icons.drive_eta,
                        size: 16,
                        color: Colors.grey.shade600,
                      ),
                      const SizedBox(width: 4),
                      Text(t.driverName),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: LinearProgressIndicator(
                          value: progress,
                          color: progress > 0.8
                              ? Colors.green
                              : progress > 0.5
                                  ? Colors.orange
                                  : mainColor,
                          backgroundColor: Colors.grey.shade200,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '${(progress * 100).toInt()}%',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.of(context).pushNamed(
                RouterGenerator.routeTripDetail,
                arguments: t,
              ),
            ),
          );
        }),
      ],
    );
  }
}

// Mock TripSummary class - should match the one in your models
class TripSummary {
  final String tripId;
  final String routeName;
  final DateTime departureTime;
  final int bookedSeats;
  final int totalSeats;
  final String licensePlate;
  final String driverName;
  final String driverPhone;

  TripSummary({
    required this.tripId,
    required this.routeName,
    required this.departureTime,
    required this.bookedSeats,
    required this.totalSeats,
    required this.licensePlate,
    required this.driverName,
    required this.driverPhone,
  });
}
