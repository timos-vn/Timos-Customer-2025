import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:timos_customer_2025/enum/enum_request_method.dart';
import 'package:timos_customer_2025/themes/colors.dart';
import 'package:timos_customer_2025/screen/routers/router_generator.dart';
import 'package:timos_customer_2025/services/auth_service.dart';
import 'package:timos_customer_2025/models/response/auth/auth_response.dart';

class TripScreen extends StatefulWidget {
  const TripScreen({super.key});

  @override
  State<TripScreen> createState() => _TripScreenState();
}

class _TripScreenState extends State<TripScreen> {
  bool isManager = true;
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

  int selectedDateOffset = 0;
  String dispatcherTripType = 'Tất cả';
  String dispatcherStatus = 'Chưa xử lý';
  final Set<String> selectedCustomers = <String>{};
  final Set<int> daysWithCustomers = <int>{0, 1, 3, 5, 7, 9, 11, 13};

  String shareStatus = 'Chưa xử lý';
  String shareGroup = 'Nhóm nội bộ';

  String transferStatus = 'Chưa xử lý';
  String transferType = 'Tất cả'; 

  @override
  void initState() {
    super.initState();
    final user = AuthService.currentUser;
    isManager = user?.isAdmin() ?? true;
  }

  List<TripSummary> buildTrips() {
    return List<TripSummary>.generate(
      8,
      (int i) => TripSummary(
        tripId: 't$i',
        routeName: '$vehicleType ${selectedSlot.replaceAll(':00', '')}',
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
    if (isManager) {
      return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Quản lý nhà xe'),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(48),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  tabs: const <Tab>[
                    Tab(text: 'Xe ghép/Sân bay'),
                    Tab(text: 'Trung chuyển'),
                    Tab(text: 'Limo/Xe khách/Giường nằm'),
                  ],
                ),
              ),
            ),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            ],
          ),
          body: const TabBarView(
            children: <Widget>[
              _ShareAirportPane(),
              _TransferManagerPane(),
              _CoachPane(),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tài xế nhà xe'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
      body: _buildDriverPane(),
    );
  }

  Widget _buildDriverPane() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Wrap(
            spacing: 8,
            children: vehicleTypes.map((String type) {
              final bool selected = vehicleType == type;
              return ChoiceChip(
                label: Text(type),
                selected: selected,
                onSelected: (_) => setState(() => vehicleType = type),
              );
            }).toList(),
          ),
        ),
        SizedBox(
          height: 56,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: 14,
            itemBuilder: (BuildContext _, int i) {
              final DateTime d = DateTime.now().add(Duration(days: i));
              final bool selected = i == selectedDateOffset;
              final bool hasCustomers = daysWithCustomers.contains(i);
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
                  onSelected: (_) => setState(() => selectedDateOffset = i),
                  selectedColor: mainColor.withOpacity(0.2),
                  side: hasCustomers
                      ? BorderSide(color: mainColor)
                      : BorderSide(color: Colors.grey.shade300),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        // Trip list
        Expanded(
          child: _buildDriverTripList(),
        ),
      ],
    );
  }

  Widget _buildDriverTripList() {
    final List<TripSummary> trips = buildTrips();
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        ...trips.map((TripSummary t) {
          final double progress = t.bookedSeats / t.totalSeats;
          return Card(
            child: ListTile(
              title: Text('${t.routeName} • ${t.licensePlate}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${t.bookedSeats}/${t.totalSeats} • ${t.driverName}'),
                  const SizedBox(height: 6),
                  LinearProgressIndicator(
                      value: progress,
                      color: mainColor,
                      backgroundColor: mainColor.withOpacity(.2)),
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

class _CoachPane extends StatefulWidget {
  const _CoachPane();

  @override
  State<_CoachPane> createState() => _CoachPaneState();
}

class _CoachPaneState extends State<_CoachPane> {
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

  List<TripSummary> buildTrips() {
    return List<TripSummary>.generate(
      8,
      (int i) => TripSummary(
        tripId: 't$i',
        routeName: '$vehicleType ${selectedSlot.replaceAll(':00', '')}',
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
    final List<TripSummary> trips = buildTrips();
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Wrap(
          spacing: 8,
          children: vehicleTypes.map((String t) {
            final bool selected = t == vehicleType;
            return ChoiceChip(
              label: Text(t),
              selected: selected,
              onSelected: (_) => setState(() => vehicleType = t),
            );
          }).toList(),
        ),
        const SizedBox(height: 12),
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
              );
            },
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemCount: timeSlots.length,
          ),
        ),
        const SizedBox(height: 12),
        ...trips.map((TripSummary t) {
          final double progress = t.bookedSeats / t.totalSeats;
          return Card(
            child: ListTile(
              title: Text('${t.routeName} • ${t.licensePlate}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${t.bookedSeats}/${t.totalSeats} • ${t.driverName}'),
                  const SizedBox(height: 6),
                  LinearProgressIndicator(
                      value: progress,
                      color: mainColor,
                      backgroundColor: mainColor.withOpacity(.2)),
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

class _ShareAirportPane extends StatefulWidget {
  const _ShareAirportPane();

  @override
  State<_ShareAirportPane> createState() => _ShareAirportPaneState();
}

class _ShareAirportPaneState extends State<_ShareAirportPane> {
  String shareStatus = 'Chưa xử lý';
  String shareGroup = 'Nhóm nội bộ';
  String? selectedGroup;
  final List<String> internalGroups = <String>['Đội A', 'Đội B', 'Đội C'];
  final List<String> publicGroups = <String>['Cộng đồng 1', 'Cộng đồng 2'];
  final Set<String> selectedIds = <String>{};
  int selectedDateIndex = 0;
  final Set<int> daysWithCustomers = <int>{0, 1, 3, 5};

  List<Map<String, String>> buildCustomers() {
    return List<Map<String, String>>.generate(
        10,
        (int i) => <String, String>{
              'id': 's$i',
              'name': 'Khách ${i + 1}',
              'phone': '098${i.toString().padLeft(7, '0')}',
              'ticketType': i % 5 == 0 ? 'vip' : 'thường',
            });
  }

  bool _canGroup(List<Map<String, String>> customers) {
    if (selectedIds.length < 2) return false;
    final Iterable<Map<String, String>> selected = customers
        .where((Map<String, String> c) => selectedIds.contains(c['id']));
    return selected
        .every((Map<String, String> c) => c['ticketType'] == 'thường');
  }

  void _onGroupPressed(List<Map<String, String>> customers) {
    if (!_canGroup(customers)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Chỉ được gộp vé thường trong Xe ghép/Sân bay.'),
        ),
      );
      return;
    }
    showDialog<void>(
      context: context,
      builder: (BuildContext ctx) => AlertDialog(
        title: const Text('Gộp vé'),
        content: Text(
            'Đã gộp ${selectedIds.length} khách vào 1 vé thường (nhóm: ${selectedGroup ?? '-'}).'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              setState(selectedIds.clear);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    selectedGroup = internalGroups.first;
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> customers = buildCustomers();

    final List<String> groupOptions =
        shareGroup == 'Nhóm nội bộ' ? internalGroups : publicGroups;

    return Stack(
      children: [
        ListView(
          padding: const EdgeInsets.all(16),
          children: [
            SizedBox(
              height: 56,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 14,
                itemBuilder: (BuildContext _, int i) {
                  final DateTime d = DateTime.now().add(Duration(days: i));
                  final bool selected = i == selectedDateIndex;
                  final bool hasCustomers = daysWithCustomers.contains(i);
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
                      onSelected: (_) => setState(() => selectedDateIndex = i),
                      selectedColor: mainColor.withOpacity(0.2),
                      side: hasCustomers
                          ? BorderSide(color: mainColor)
                          : BorderSide(color: Colors.grey.shade300),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                ChoiceChip(
                  label: const Text('Chưa xử lý'),
                  selected: shareStatus == 'Chưa xử lý',
                  onSelected: (_) => setState(() => shareStatus = 'Chưa xử lý'),
                ),
                ChoiceChip(
                  label: const Text('Đã xử lý'),
                  selected: shareStatus == 'Đã xử lý',
                  onSelected: (_) => setState(() => shareStatus = 'Đã xử lý'),
                ),
                const Gap(12),
                ChoiceChip(
                  label: const Text('Nhóm nội bộ'),
                  selected: shareGroup == 'Nhóm nội bộ',
                  onSelected: (_) {
                    setState(() {
                      shareGroup = 'Nhóm nội bộ';
                      selectedGroup = internalGroups.first;
                    });
                  },
                ),
                ChoiceChip(
                  label: const Text('Nhóm công cộng'),
                  selected: shareGroup == 'Nhóm công cộng',
                  onSelected: (_) {
                    setState(() {
                      shareGroup = 'Nhóm công cộng';
                      selectedGroup = publicGroups.first;
                    });
                  },
                ),
                const Gap(8),
                DropdownButton<String>(
                  value: selectedGroup,
                  items: groupOptions
                      .map((String g) => DropdownMenuItem<String>(
                            value: g,
                            child: Text(g),
                          ))
                      .toList(),
                  onChanged: (String? v) => setState(() => selectedGroup = v),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ...customers.map((Map<String, String> c) {
              final bool checked = selectedIds.contains(c['id']);
              final String ticketType = c['ticketType'] ?? 'thường';
              return CheckboxListTile(
                value: checked,
                onChanged: (bool? v) {
                  setState(() {
                    if (v == true) {
                      selectedIds.add(c['id']!);
                    } else {
                      selectedIds.remove(c['id']);
                    }
                  });
                },
                title: Text(c['name'] ?? ''),
                subtitle: Text(
                    'Nhóm: ${selectedGroup ?? '-'} • Loại vé: $ticketType • ${c['phone']}'),
              );
            }),
            const SizedBox(height: 80),
          ],
        ),
        if (selectedIds.length >= 2)
          Positioned(
            left: 16,
            right: 16,
            bottom: 16,
            child: SafeArea(
              top: false,
              child: FilledButton(
                onPressed: () => _onGroupPressed(customers),
                child:
                    Text('Gộp ${selectedIds.length} khách vào 1 vé (thường)'),
              ),
            ),
          ),
      ],
    );
  }
}

class _TransferManagerPane extends StatefulWidget {
  const _TransferManagerPane();

  @override
  State<_TransferManagerPane> createState() => _TransferManagerPaneState();
}

class _TransferManagerPaneState extends State<_TransferManagerPane> {
  String transferType = 'Tất cả';
  String transferStatus = 'Chưa xử lý';
  final Set<String> selectedIds = <String>{};
  int selectedDateIndex = 0;
  final Set<int> daysWithCustomers = <int>{0, 2, 4, 6};

  List<Map<String, String>> buildCustomers() {
    return List<Map<String, String>>.generate(12, (int i) {
      return <String, String>{
        'id': 't$i',
        'name': 'Khách ${i + 1}',
        'phone': '090${i.toString().padLeft(7, '0')}',
        'ticketType': i % 4 == 0 ? 'vip' : 'thường',
      };
    });
  }

  bool _canGroup(List<Map<String, String>> customers) {
    if (selectedIds.length < 2) return false;
    final Iterable<Map<String, String>> selected = customers
        .where((Map<String, String> c) => selectedIds.contains(c['id']));
    return selected
        .every((Map<String, String> c) => c['ticketType'] == 'thường');
  }

  void _onGroupPressed(List<Map<String, String>> customers) {
    if (!_canGroup(customers)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Chỉ được gộp vé thường. Vui lòng bỏ chọn vé VIP.'),
        ),
      );
      return;
    }
    showDialog<void>(
      context: context,
      builder: (BuildContext ctx) => AlertDialog(
        title: const Text('Gộp vé'),
        content: Text('Đã gộp ${selectedIds.length} khách vào 1 vé thường.'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              setState(selectedIds.clear);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> customers = buildCustomers();

    return Stack(
      children: [
        ListView(
          padding: const EdgeInsets.all(16),
          children: [
            SizedBox(
              height: 56,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 14,
                itemBuilder: (BuildContext _, int i) {
                  final DateTime d = DateTime.now().add(Duration(days: i));
                  final bool selected = i == selectedDateIndex;
                  final bool hasCustomers = daysWithCustomers.contains(i);
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
                      onSelected: (_) => setState(() => selectedDateIndex = i),
                      selectedColor: mainColor.withOpacity(0.2),
                      side: hasCustomers
                          ? BorderSide(color: mainColor)
                          : BorderSide(color: Colors.grey.shade300),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                ChoiceChip(
                  label: const Text('Tất cả'),
                  selected: transferType == 'Tất cả',
                  onSelected: (_) => setState(() => transferType = 'Tất cả'),
                ),
                ChoiceChip(
                  label: const Text('Đón'),
                  selected: transferType == 'Đón',
                  onSelected: (_) => setState(() => transferType = 'Đón'),
                ),
                ChoiceChip(
                  label: const Text('Trả'),
                  selected: transferType == 'Trả',
                  onSelected: (_) => setState(() => transferType = 'Trả'),
                ),
                const Gap(8),
                ChoiceChip(
                  label: const Text('Chưa xử lý'),
                  selected: transferStatus == 'Chưa xử lý',
                  onSelected: (_) =>
                      setState(() => transferStatus = 'Chưa xử lý'),
                ),
                ChoiceChip(
                  label: const Text('Đã xử lý'),
                  selected: transferStatus == 'Đã xử lý',
                  onSelected: (_) =>
                      setState(() => transferStatus = 'Đã xử lý'),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ...customers.map((Map<String, String> c) {
              final bool checked = selectedIds.contains(c['id']);
              final String ticketType = c['ticketType'] ?? 'thường';
              return CheckboxListTile(
                value: checked,
                onChanged: (bool? v) {
                  setState(() {
                    if (v == true) {
                      selectedIds.add(c['id']!);
                    } else {
                      selectedIds.remove(c['id']);
                    }
                  });
                },
                title: Text(c['name'] ?? ''),
                subtitle: Text('Loại vé: $ticketType • SĐT: ${c['phone']}'),
              );
            }),
            const SizedBox(height: 80),
          ],
        ),
        if (selectedIds.length >= 2)
          Positioned(
            left: 16,
            right: 16,
            bottom: 16,
            child: SafeArea(
              top: false,
              child: FilledButton(
                onPressed: () => _onGroupPressed(customers),
                child:
                    Text('Gộp ${selectedIds.length} khách vào 1 vé (thường)'),
              ),
            ),
          ),
      ],
    );
  }
}

