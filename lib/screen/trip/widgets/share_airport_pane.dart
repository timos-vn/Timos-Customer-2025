import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timos_customer_2025/themes/colors.dart';
import 'package:timos_customer_2025/models/response/group/group_response.dart';
import 'package:timos_customer_2025/models/response/trip/trip_response.dart';
import 'package:timos_customer_2025/services/auth_service.dart';
import '../bloc/trip_bloc.dart';
import '../bloc/trip_event.dart';

class ShareAirportPane extends StatefulWidget {
  final List<GroupItem> internalGroups;
  final List<GroupItem> publicGroups;
  final bool isLoadingGroups;
  final List<TripItem> trips;
  final bool isLoadingTrips;

  const ShareAirportPane({
    super.key,
    required this.internalGroups,
    required this.publicGroups,
    required this.isLoadingGroups,
    required this.trips,
    required this.isLoadingTrips,
  });

  @override
  State<ShareAirportPane> createState() => _ShareAirportPaneState();
}

class _ShareAirportPaneState extends State<ShareAirportPane> {
  String shareStatus = 'Chưa xử lý';
  String shareGroup = 'Nhóm nội bộ';
  String? selectedGroup;
  final Set<String> selectedIds = <String>{};
  int selectedDateIndex = 0;
  final Set<int> daysWithCustomers = <int>{0, 1, 3, 5};

  @override
  void initState() {
    super.initState();
    // Auto-select first available group when data loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateSelectedGroup();
      _loadTripsData();
    });
  }

  @override
  void didUpdateWidget(ShareAirportPane oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.internalGroups != widget.internalGroups ||
        oldWidget.publicGroups != widget.publicGroups) {
      _updateSelectedGroup();
    }
  }

  void _updateSelectedGroup() {
    if (selectedGroup == null) {
      final groups =
          shareGroup == 'Nhóm nội bộ' ? internalGroups : publicGroups;
      if (groups.isNotEmpty) {
        setState(() {
          selectedGroup = groups.first.tenNhom;
        });
      }
    }
  }

  void _onStatusChanged(String newStatus) {
    setState(() {
      shareStatus = newStatus;
      selectedIds.clear();
    });
    _loadTripsData();
  }

  void _onGroupTypeChanged(String newGroupType) {
    setState(() {
      shareGroup = newGroupType;
      selectedGroup = null;
      selectedIds.clear();
    });
    _updateSelectedGroup();
    _loadTripsData();
  }

  void _onGroupSelected(String? groupName) {
    setState(() {
      selectedGroup = groupName;
      selectedIds.clear();
    });
    _loadTripsData();
  }

  void _onDateChanged(int dateIndex) {
    setState(() {
      selectedDateIndex = dateIndex;
      selectedIds.clear();
    });
    _loadTripsData();
  }

  void _loadTripsData() {
    if (selectedGroup == null) return;

    final selectedDate =
        DateTime.now().add(Duration(days: selectedDateIndex + 1));
    final ngayChay =
        "${selectedDate.year}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}";

    // Get selected group ID
    final groups = shareGroup == 'Nhóm nội bộ' ? internalGroups : publicGroups;
    final selectedGroupItem = groups.firstWhere(
      (group) => group.tenNhom == selectedGroup,
      orElse: () => const GroupItem(idNhom: 0, tenNhom: ''),
    );

    final user = AuthService.currentUser;
    final userId = user?.id ?? '';

    if (shareStatus == 'Chưa xử lý') {
      context.read<TripBloc>().add(TripEvent.loadPendingTrips(
            ngayChay: ngayChay,
            idNhanVien: userId,
            idNhom: selectedGroupItem.idNhom,
            idDoiTac: userId,
          ));
    } else {
      context.read<TripBloc>().add(TripEvent.loadProcessingTrips(
            ngayChay: ngayChay,
            idNhanVien: userId,
            idNhom: selectedGroupItem.idNhom,
            idDoiTac: userId,
          ));
    }
  }

  // Access data from widget
  List<GroupItem> get internalGroups => widget.internalGroups;
  List<GroupItem> get publicGroups => widget.publicGroups;
  bool get isLoadingGroups => widget.isLoadingGroups;
  List<TripItem> get trips => widget.trips;
  bool get isLoadingTrips => widget.isLoadingTrips;

  List<Map<String, String>> buildCustomers() {
    return trips.map((TripItem trip) {
      // Determine ticket type based on loaVe field or other criteria
      String ticketType = 'thường';
      if (trip.loaVe != null && trip.loaVe!.toLowerCase().contains('vip')) {
        ticketType = 'vip';
      } else if (trip.loaVe != null &&
          trip.loaVe!.toLowerCase().contains('thường')) {
        ticketType = 'thường';
      }

      return <String, String>{
        'id': trip.idDatVe.isNotEmpty ? trip.idDatVe : trip.idYeuCauDatVe,
        'name': trip.tenKhachHang.isNotEmpty ? trip.tenKhachHang : 'Khách hàng',
        'phone': trip.soDienThoaiKhach.isNotEmpty
            ? trip.soDienThoaiKhach
            : 'Chưa có SĐT',
        'ticketType': ticketType,
        'status': _getTripStatusText(trip.trangThaiVe),
        'departure': trip.diaChiKhachDi.isNotEmpty
            ? trip.diaChiKhachDi
            : 'Chưa có địa chỉ',
        'destination': trip.diaChiKhachDen.isNotEmpty
            ? trip.diaChiKhachDen
            : 'Chưa có điểm đến',
      };
    }).toList();
  }

  String _getTripStatusText(int status) {
    switch (status) {
      case 0:
        return 'Chưa xử lý';
      case 1:
        return 'Đã xác nhận';
      case 2:
        return 'Đang xử lý';
      default:
        return 'Khác';
    }
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Chưa xử lý':
        return Colors.orange.shade700;
      case 'Đã xác nhận':
        return Colors.green.shade700;
      case 'Đang xử lý':
        return Colors.blue.shade700;
      default:
        return Colors.grey.shade700;
    }
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

  void _showGroupSelectionBottomSheet(List<String> groupOptions) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        final TextEditingController searchController = TextEditingController();

        return StatefulBuilder(
          builder: (context, setModalState) {
            List<String> getFilteredGroups() {
              return groupOptions
                  .where((group) => group
                      .toLowerCase()
                      .contains(searchController.text.toLowerCase()))
                  .toList();
            }

            return DraggableScrollableSheet(
              initialChildSize: 0.7,
              maxChildSize: 0.9,
              minChildSize: 0.3,
              expand: false,
              builder: (context, scrollController) {
                return Column(
                  children: [
                    // Handle bar
                    Container(
                      width: 40,
                      height: 4,
                      margin: const EdgeInsets.only(top: 12, bottom: 8),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    // Title
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Row(
                        children: [
                          Icon(Icons.group, color: mainColor, size: 20),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  shareGroup,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  '${getFilteredGroups().length} nhóm khả dụng',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(Icons.close),
                          ),
                        ],
                      ),
                    ),
                    const Divider(height: 1),
                    // Search bar
                    if (groupOptions.length > 5)
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: TextField(
                          controller: searchController,
                          autofocus: false,
                          enabled: true,
                          textInputAction: TextInputAction.search,
                          onChanged: (value) {
                            setModalState(() {
                              // Trigger rebuild để update filtered groups
                            });
                          },
                          decoration: InputDecoration(
                            hintText: 'Tìm kiếm nhóm...',
                            prefixIcon: const Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade300),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade300),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: mainColor),
                            ),
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 12),
                          ),
                        ),
                      ),
                    // Group list
                    Expanded(
                      child: getFilteredGroups().isEmpty
                          ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.search_off,
                                    size: 48,
                                    color: Colors.grey.shade400,
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    'Không tìm thấy nhóm nào',
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 16,
                                    ),
                                  ),
                                  if (searchController.text.isNotEmpty)
                                    TextButton(
                                      onPressed: () {
                                        searchController.clear();
                                        setModalState(() {
                                          // Trigger rebuild after clearing
                                        });
                                      },
                                      child: const Text('Xóa bộ lọc'),
                                    ),
                                ],
                              ),
                            )
                          : ListView.builder(
                              controller: scrollController,
                              itemCount: getFilteredGroups().length,
                              itemBuilder: (context, index) {
                                final group = getFilteredGroups()[index];
                                final isSelected = selectedGroup == group;

                                return ListTile(
                                  leading: Radio<String>(
                                    value: group,
                                    groupValue: selectedGroup,
                                    onChanged: (value) {
                                      _onGroupSelected(value);
                                      Navigator.pop(context);
                                    },
                                    activeColor: mainColor,
                                  ),
                                  title: Text(group),
                                  subtitle: Row(
                                    children: [
                                      Icon(
                                        shareGroup == 'Nhóm nội bộ'
                                            ? Icons.business
                                            : Icons.public,
                                        size: 12,
                                        color: Colors.grey.shade600,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        shareGroup == 'Nhóm nội bộ'
                                            ? 'Nội bộ'
                                            : 'Công khai',
                                        style: TextStyle(
                                          color: Colors.grey.shade600,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  trailing: isSelected
                                      ? Icon(Icons.check_circle,
                                          color: mainColor)
                                      : null,
                                  onTap: () {
                                    setState(() => selectedGroup = group);
                                    Navigator.pop(context);
                                  },
                                );
                              },
                            ),
                    ),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> customers = buildCustomers();

    final List<String> groupOptions = shareGroup == 'Nhóm nội bộ'
        ? widget.internalGroups.map((group) => group.tenNhom).toList()
        : widget.publicGroups.map((group) => group.tenNhom).toList();

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
                  final DateTime d = DateTime.now().add(Duration(days: i + 1));
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
                      onSelected: (_) => _onDateChanged(i),
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
                  label: const Text('Chưa xử lý'),
                  selected: shareStatus == 'Chưa xử lý',
                  onSelected: (_) => _onStatusChanged('Chưa xử lý'),
                ),
                ChoiceChip(
                  label: const Text('Đã xử lý'),
                  selected: shareStatus == 'Đã xử lý',
                  onSelected: (_) => _onStatusChanged('Đã xử lý'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Group Selection Section
            Card(
              margin: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.group, color: mainColor, size: 20),
                        const SizedBox(width: 8),
                        const Text(
                          'Chọn nhóm',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    // Group Type Selection
                    Row(
                      children: [
                        Expanded(
                          child: ChoiceChip(
                            label: const Text('Nhóm nội bộ'),
                            selected: shareGroup == 'Nhóm nội bộ',
                            onSelected: (_) =>
                                _onGroupTypeChanged('Nhóm nội bộ'),
                            selectedColor: mainColor.withOpacity(0.2),
                            side: shareGroup == 'Nhóm nội bộ'
                                ? BorderSide(color: mainColor)
                                : BorderSide(color: Colors.grey.shade300),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: ChoiceChip(
                            label: const Text('Nhóm công khai'),
                            selected: shareGroup == 'Nhóm công khai',
                            onSelected: (_) =>
                                _onGroupTypeChanged('Nhóm công khai'),
                            selectedColor: mainColor.withOpacity(0.2),
                            side: shareGroup == 'Nhóm công khai'
                                ? BorderSide(color: mainColor)
                                : BorderSide(color: Colors.grey.shade300),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    // Group Selection
                    if (widget.isLoadingGroups)
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade50,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey.shade200),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(mainColor),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'Đang tải danh sách nhóm...',
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      )
                    else if (groupOptions.isEmpty)
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.orange.shade50,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.orange.shade200),
                        ),
                        child: Column(
                          children: [
                            Icon(
                              Icons.info_outline,
                              color: Colors.orange.shade600,
                              size: 24,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Không có ${shareGroup.toLowerCase()} nào',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.orange.shade700,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'Vui lòng chọn loại nhóm khác hoặc thử lại sau',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.orange.shade600,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      )
                    else
                      Column(
                        children: [
                          InkWell(
                            onTap: () =>
                                _showGroupSelectionBottomSheet(groupOptions),
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: selectedGroup != null
                                      ? mainColor.withOpacity(0.3)
                                      : Colors.grey.shade300,
                                ),
                                borderRadius: BorderRadius.circular(8),
                                color: selectedGroup != null
                                    ? mainColor.withOpacity(0.05)
                                    : null,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    selectedGroup != null
                                        ? Icons.check_circle_outline
                                        : Icons.group_outlined,
                                    color: selectedGroup != null
                                        ? mainColor
                                        : Colors.grey.shade600,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          selectedGroup ?? 'Chọn nhóm...',
                                          style: TextStyle(
                                            color: selectedGroup != null
                                                ? Colors.black87
                                                : Colors.grey.shade600,
                                            fontWeight: selectedGroup != null
                                                ? FontWeight.w500
                                                : FontWeight.normal,
                                          ),
                                        ),
                                        if (selectedGroup != null)
                                          Text(
                                            shareGroup,
                                            style: TextStyle(
                                              color: Colors.grey.shade600,
                                              fontSize: 12,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.grey.shade600,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Group info card (if group is selected)
                          if (selectedGroup != null) ...[
                            const SizedBox(height: 8),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: mainColor.withOpacity(0.05),
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                  color: mainColor.withOpacity(0.2),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.info_outline,
                                    color: mainColor,
                                    size: 16,
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      'Khách hàng sẽ được gộp vào nhóm: $selectedGroup',
                                      style: TextStyle(
                                        color: mainColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ],
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Customer list header
            Row(
              children: [
                Icon(Icons.people_outline, color: mainColor, size: 20),
                const SizedBox(width: 8),
                const Text(
                  'Danh sách khách hàng',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: mainColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: isLoadingTrips
                      ? SizedBox(
                          width: 12,
                          height: 12,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(mainColor),
                          ),
                        )
                      : Text(
                          '${customers.length}',
                          style: TextStyle(
                            color: mainColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            if (selectedIds.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  color: mainColor.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: mainColor.withOpacity(0.2)),
                ),
                child: Row(
                  children: [
                    Icon(Icons.check_circle, color: mainColor, size: 16),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Đã chọn ${selectedIds.length} khách hàng',
                        style: TextStyle(
                          color: mainColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () => setState(() => selectedIds.clear()),
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        'Bỏ chọn tất cả',
                        style: TextStyle(
                          color: mainColor,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            // Customer list
            if (isLoadingTrips)
              Container(
                padding: const EdgeInsets.all(40),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(mainColor),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Đang tải danh sách khách hàng...',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            else if (customers.isEmpty)
              Container(
                padding: const EdgeInsets.all(40),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.people_outline,
                        size: 48,
                        color: Colors.grey.shade400,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Không có khách hàng nào',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Thử thay đổi bộ lọc hoặc chọn ngày khác',
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            else
              ...customers.asMap().entries.map((entry) {
                final int index = entry.key;
                final Map<String, String> c = entry.value;
                final bool checked = selectedIds.contains(c['id']);
                final String ticketType = c['ticketType'] ?? 'thường';

                return Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: checked
                          ? mainColor.withOpacity(0.3)
                          : Colors.grey.shade200,
                    ),
                    borderRadius: BorderRadius.circular(8),
                    color: checked ? mainColor.withOpacity(0.02) : null,
                  ),
                  child: CheckboxListTile(
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
                    activeColor: mainColor,
                    title: Row(
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: ticketType == 'vip'
                                ? Colors.amber.withOpacity(0.2)
                                : Colors.grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Center(
                            child: Text(
                              '${index + 1}',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: ticketType == 'vip'
                                    ? Colors.amber.shade700
                                    : Colors.grey.shade700,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                c['name'] ?? '',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Row(
                                children: [
                                  Icon(
                                    Icons.phone,
                                    size: 12,
                                    color: Colors.grey.shade600,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    c['phone'] ?? '',
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              if (c['departure'] != null &&
                                  c['departure']!.isNotEmpty) ...[
                                const SizedBox(height: 2),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      size: 12,
                                      color: Colors.grey.shade600,
                                    ),
                                    const SizedBox(width: 4),
                                    Expanded(
                                      child: Text(
                                        '${c['departure']} → ${c['destination']}',
                                        style: TextStyle(
                                          color: Colors.grey.shade600,
                                          fontSize: 11,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: ticketType == 'vip'
                                    ? Colors.amber.withOpacity(0.2)
                                    : Colors.blue.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                ticketType.toUpperCase(),
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: ticketType == 'vip'
                                      ? Colors.amber.shade700
                                      : Colors.blue.shade700,
                                ),
                              ),
                            ),
                            if (c['status'] != null) ...[
                              const SizedBox(height: 4),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(
                                  color: _getStatusColor(c['status']!)
                                      .withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  c['status']!,
                                  style: TextStyle(
                                    fontSize: 9,
                                    fontWeight: FontWeight.w500,
                                    color: _getStatusColor(c['status']!),
                                  ),
                                ),
                              ),
                            ],
                            if (selectedGroup != null) ...[
                              const SizedBox(height: 4),
                              Text(
                                selectedGroup!.length > 15
                                    ? '${selectedGroup!.substring(0, 15)}...'
                                    : selectedGroup!,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ],
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  ),
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
