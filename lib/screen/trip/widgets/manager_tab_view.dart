import 'package:flutter/material.dart';
import 'package:timos_customer_2025/models/response/group/group_response.dart';
import 'package:timos_customer_2025/models/response/trip/trip_response.dart';
import 'package:timos_customer_2025/screen/booking_ticket/booking/booking_screen.dart';
import 'package:timos_customer_2025/themes/colors.dart';
import 'coach_pane.dart';

class ManagerTabView extends StatelessWidget {
  final List<GroupItem> internalGroups;
  final List<GroupItem> publicGroups;
  final bool isLoadingGroups;
  final List<TripItem> trips;

  const ManagerTabView({
    super.key,
    required this.internalGroups,
    required this.publicGroups,
    required this.isLoadingGroups,
    required this.trips,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 12, 16, 4),
              child: _ManagerHeader(),
            ),
            const Expanded(
              child: CoachPane(),
            ),
          ],
        ),
      ),
    );
  }
}

class _ManagerHeader extends StatelessWidget {
  const _ManagerHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            mainColor.withValues(alpha: 0.12),
            mainColor.withValues(alpha: 0.03),
          ],
        ),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Quản lý nhà xe',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Theo dõi lịch trình, doanh thu và trạng thái chuyến đi',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.black54,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
