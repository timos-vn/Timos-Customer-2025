import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timos_customer_2025/models/response/group/group_response.dart';
import 'package:timos_customer_2025/models/response/trip/trip_response.dart';
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
        // bottom: PreferredSize(
        //   preferredSize: const Size.fromHeight(48),
        //   child: Align(
        //     alignment: Alignment.centerLeft,
        //     child: TabBar(
        //       isScrollable: true,
        //       tabAlignment: TabAlignment.start,
        //       tabs: const <Tab>[
        //         Tab(text: 'Xe ghép/Sân bay'),
        //         Tab(text: 'Trung chuyển'),
        //         Tab(text: 'Limo/Xe khách/Giường nằm'),
        //       ],
        //     ),
        //   ),
        // ),
        // v
      ),
      body: CoachPane(),
    );
  }
}
