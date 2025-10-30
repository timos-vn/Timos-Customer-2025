import 'package:flutter/material.dart';
import 'package:timos_customer_2025/themes/colors.dart';

class TransferManagerPane extends StatefulWidget {
  const TransferManagerPane({super.key});

  @override
  State<TransferManagerPane> createState() => _TransferManagerPaneState();
}

class _TransferManagerPaneState extends State<TransferManagerPane> {
  String selectedCategory = 'Tất cả';
  DateTime selectedDate = DateTime.now();
  final TextEditingController searchController = TextEditingController();
  
  final List<String> categories = [
    'Tất cả',
    'Đón sân bay', 
    'Trả sân bay',
    'Đón bến xe',
    'Trả bến xe'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header với bộ lọc
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
          ),
          child: Column(
            children: [
              // Category filters
              SizedBox(
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemBuilder: (_, int index) {
                    final String category = categories[index];
                    final bool isSelected = category == selectedCategory;
                    return FilterChip(
                      label: Text(category),
                      selected: isSelected,
                      onSelected: (_) {
                        setState(() {
                          selectedCategory = category;
                        });
                      },
                      selectedColor: mainColor.withOpacity(0.2),
                      checkmarkColor: mainColor,
                    );
                  },
                ),
              ),
              const SizedBox(height: 12),
              // Date selector
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () async {
                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: selectedDate,
                          firstDate: DateTime.now().subtract(const Duration(days: 30)),
                          lastDate: DateTime.now().add(const Duration(days: 30)),
                        );
                        if (picked != null) {
                          setState(() {
                            selectedDate = picked;
                          });
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.calendar_today, size: 16, color: Colors.grey.shade600),
                            const SizedBox(width: 8),
                            Text('${selectedDate.day}/${selectedDate.month}/${selectedDate.year}'),
                            const Spacer(),
                            Icon(Icons.arrow_drop_down, color: Colors.grey.shade600),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: 'Tìm kiếm khách hàng...',
                        prefixIcon: const Icon(Icons.search, size: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      ),
                      onChanged: (_) => setState(() {}),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        
        // Customer list
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: _buildCustomerList().length,
            itemBuilder: (BuildContext context, int index) {
              final CustomerTransfer customer = _buildCustomerList()[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 8),
                child: ExpansionTile(
                  leading: CircleAvatar(
                    backgroundColor: _getStatusColor(customer.status).withOpacity(0.2),
                    child: Icon(
                      _getStatusIcon(customer.status),
                      color: _getStatusColor(customer.status),
                      size: 20,
                    ),
                  ),
                  title: Text(
                    customer.customerName,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(customer.transferType),
                      Text(
                        '${customer.pickupTime} • ${customer.location}',
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                  trailing: Chip(
                    label: Text(
                      customer.status,
                      style: TextStyle(
                        color: _getStatusColor(customer.status),
                        fontSize: 12,
                      ),
                    ),
                    backgroundColor: _getStatusColor(customer.status).withOpacity(0.1),
                    side: BorderSide(color: _getStatusColor(customer.status)),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.phone, size: 16, color: Colors.grey.shade600),
                              const SizedBox(width: 8),
                              Text(customer.phoneNumber),
                              const Spacer(),
                              Icon(Icons.people, size: 16, color: Colors.grey.shade600),
                              const SizedBox(width: 4),
                              Text('${customer.passengerCount} người'),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.location_on, size: 16, color: Colors.grey.shade600),
                              const SizedBox(width: 8),
                              Expanded(child: Text(customer.fullAddress)),
                            ],
                          ),
                          if (customer.note.isNotEmpty) ...[
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(Icons.note, size: 16, color: Colors.grey.shade600),
                                const SizedBox(width: 8),
                                Expanded(child: Text(customer.note)),
                              ],
                            ),
                          ],
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: OutlinedButton.icon(
                                  onPressed: () => _makeCall(customer.phoneNumber),
                                  icon: const Icon(Icons.phone, size: 16),
                                  label: const Text('Gọi'),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: ElevatedButton.icon(
                                  onPressed: () => _updateStatus(customer),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: mainColor,
                                    foregroundColor: Colors.white,
                                  ),
                                  icon: const Icon(Icons.check, size: 16),
                                  label: const Text('Cập nhật'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  List<CustomerTransfer> _buildCustomerList() {
    final List<CustomerTransfer> allCustomers = List<CustomerTransfer>.generate(
      15,
      (int i) => CustomerTransfer(
        customerId: 'c$i',
        customerName: 'Khách hàng ${i + 1}',
        phoneNumber: '0900${i.toString().padLeft(6, '0')}',
        transferType: categories[1 + (i % 4)],
        location: i % 2 == 0 ? 'Sân bay Tân Sơn Nhất' : 'Bến xe Miền Đông',
        fullAddress: 'Địa chỉ chi tiết của khách hàng ${i + 1}',
        pickupTime: '${6 + (i % 12)}:${(i % 4) * 15}'.padLeft(5, '0'),
        passengerCount: 1 + (i % 4),
        status: ['Chờ xác nhận', 'Đã xác nhận', 'Đang thực hiện', 'Hoàn thành'][i % 4],
        note: i % 3 == 0 ? 'Ghi chú đặc biệt cho khách hàng này' : '',
      ),
    );

    // Filter by category
    List<CustomerTransfer> filtered = selectedCategory == 'Tất cả'
        ? allCustomers
        : allCustomers.where((c) => c.transferType == selectedCategory).toList();

    // Filter by search
    if (searchController.text.isNotEmpty) {
      filtered = filtered
          .where((c) => c.customerName
              .toLowerCase()
              .contains(searchController.text.toLowerCase()))
          .toList();
    }

    return filtered;
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Chờ xác nhận':
        return Colors.orange;
      case 'Đã xác nhận':
        return Colors.blue;
      case 'Đang thực hiện':
        return mainColor;
      case 'Hoàn thành':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  IconData _getStatusIcon(String status) {
    switch (status) {
      case 'Chờ xác nhận':
        return Icons.schedule;
      case 'Đã xác nhận':
        return Icons.check_circle_outline;
      case 'Đang thực hiện':
        return Icons.directions_car;
      case 'Hoàn thành':
        return Icons.check_circle;
      default:
        return Icons.help_outline;
    }
  }

  void _makeCall(String phoneNumber) {
    // Implement call functionality
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Gọi $phoneNumber')),
    );
  }

  void _updateStatus(CustomerTransfer customer) {
    // Implement status update
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Cập nhật trạng thái cho ${customer.customerName}')),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}

// Customer transfer model
class CustomerTransfer {
  final String customerId;
  final String customerName;
  final String phoneNumber;
  final String transferType;
  final String location;
  final String fullAddress;
  final String pickupTime;
  final int passengerCount;
  final String status;
  final String note;

  CustomerTransfer({
    required this.customerId,
    required this.customerName,
    required this.phoneNumber,
    required this.transferType,
    required this.location,
    required this.fullAddress,
    required this.pickupTime,
    required this.passengerCount,
    required this.status,
    required this.note,
  });
}