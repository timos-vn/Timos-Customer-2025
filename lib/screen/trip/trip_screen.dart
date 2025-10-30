import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timos_customer_2025/services/group_service.dart';
import 'package:timos_customer_2025/services/trip_service.dart';
import 'bloc/trip_bloc.dart';
import 'bloc/trip_event.dart';
import 'bloc/trip_state.dart' as state;
import 'widgets/widgets.dart';

class TripScreen extends StatelessWidget {
  const TripScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TripBloc(
        groupService: GroupService(),
        tripService: TripService(),
      )..add(const TripEvent.initialize()),
      child: const _TripScreenView(),
    );
  }
}

class _TripScreenView extends StatelessWidget {
  const _TripScreenView();

  final List<String> vehicleTypes = const <String>[
    'Limo',
    'Xe Khách',
    'Giường nằm'
  ];
  final List<String> timeSlots = const <String>[
    '06:00-09:00',
    '09:00-12:00',
    '12:00-15:00',
    '15:00-18:00',
    '18:00-21:00'
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TripBloc, state.TripState>(
      builder: (context, tripState) {
        if (tripState.isManager) {
          return _BlocManagerTabView(
            tripState: tripState,
          );
        }

        return _BlocDriverView(
          vehicleTypes: vehicleTypes,
          timeSlots: timeSlots,
          tripState: tripState,
        );
      },
    );
  }
}

class _BlocManagerTabView extends StatelessWidget {
  final state.TripState tripState;

  const _BlocManagerTabView({
    required this.tripState,
  });

  @override
  Widget build(BuildContext context) {
    return ManagerTabView(
      internalGroups: tripState.internalGroups,
      publicGroups: tripState.publicGroups,
      isLoadingGroups: tripState.isLoadingGroups,
      trips: tripState.trips,
    );
  }
}

class _BlocDriverView extends StatelessWidget {
  final List<String> vehicleTypes;
  final List<String> timeSlots;
  final state.TripState tripState;

  const _BlocDriverView({
    required this.vehicleTypes,
    required this.timeSlots,
    required this.tripState,
  });

  @override
  Widget build(BuildContext context) {
    return DriverView(
      vehicleTypes: vehicleTypes,
      timeSlots: timeSlots,
      vehicleType: tripState.vehicleType,
      selectedSlot: tripState.selectedTimeSlot,
      selectedDateOffset: tripState.selectedDateOffset,
      daysWithCustomers: tripState.daysWithCustomers,
      onVehicleTypeChanged: () {
        // DriverView sẽ tự quản lý state locally
      },
      onDateChanged: () {
        // DriverView sẽ tự quản lý state locally
      },
    );
  }
}
