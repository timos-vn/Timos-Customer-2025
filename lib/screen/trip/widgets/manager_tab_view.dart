import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timos_customer_2025/models/response/group/group_response.dart';
import 'package:timos_customer_2025/models/response/trip/trip_response.dart';
import 'package:timos_customer_2025/screen/booking_ticket/booking/booking_screen.dart';
import '../bloc/trip_bloc.dart';
import '../bloc/trip_state.dart';
import 'share_airport_pane.dart';
import 'transfer_manager_pane.dart';
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
      appBar: AppBar(
        title: const Text('Quản lý nhà xe'),
      ),
      body: CoachPane(),
      floatingActionButton: BlocBuilder<TripBloc, TripState>(
        builder: (context, state) {
          return FloatingActionButton(
            onPressed: () {
              // Handle FAB action
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookingScreen(),
                  settings: RouteSettings(name: "BOOKING_SCREEN"),
                ),
              );
            },
            child: const Icon(Icons.add),
          );
        },
      ),
    );
  }
}
