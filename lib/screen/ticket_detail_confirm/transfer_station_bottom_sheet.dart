import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timos_customer_2025/models/response/transfer_station/transfer_station_response.dart';
import 'package:timos_customer_2025/themes/colors.dart';

class TransferStationBottomSheet extends StatefulWidget {
  final String title;
  final List<TransferStationItem> items;
  final TransferStationItem? selectedItem;

  const TransferStationBottomSheet({
    super.key,
    required this.title,
    required this.items,
    this.selectedItem,
  });

  static Future<TransferStationItem?> show(
    BuildContext context, {
    required String title,
    required List<TransferStationItem> items,
    TransferStationItem? selectedItem,
  }) {
    return showModalBottomSheet<TransferStationItem?>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => TransferStationBottomSheet(
        title: title,
        items: items,
        selectedItem: selectedItem,
      ),
    );
  }

  @override
  State<TransferStationBottomSheet> createState() =>
      _TransferStationBottomSheetState();
}

class _TransferStationBottomSheetState
    extends State<TransferStationBottomSheet> {
  late TextEditingController _searchController;
  List<TransferStationItem> _filteredItems = [];
  TransferStationItem? _selectedItem;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _selectedItem = widget.selectedItem;
    _filteredItems = widget.items;
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase().trim();
    setState(() {
      if (query.isEmpty) {
        _filteredItems = widget.items;
      } else {
        _filteredItems = widget.items
            .where((item) =>
                item.text.toLowerCase().contains(query) ||
                item.value.toLowerCase().contains(query))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey[200]!, width: 1),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.title,
                    style: GoogleFonts.roboto(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),

          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Tìm kiếm...",
                hintStyle: GoogleFonts.roboto(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
            ),
          ),

          // List of items
          Flexible(
            child: _filteredItems.isEmpty
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(32),
                      child: Text(
                        "Không tìm thấy kết quả",
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: _filteredItems.length,
                    itemBuilder: (context, index) {
                      final item = _filteredItems[index];
                      final isSelected = _selectedItem?.value == item.value;

                      return InkWell(
                        onTap: item.disabled
                            ? null
                            : () {
                                setState(() {
                                  _selectedItem = item;
                                });
                              },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey[200]!,
                                width: 1,
                              ),
                            ),
                            color: isSelected
                                ? colorApp.withOpacity(0.05)
                                : Colors.transparent,
                          ),
                          child: Row(
                            children: [
                              // Radio button
                              Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: isSelected
                                        ? colorApp
                                        : (item.disabled
                                            ? Colors.grey[300]!
                                            : Colors.grey[400]!),
                                    width: isSelected ? 2 : 1.5,
                                  ),
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.transparent,
                                ),
                                child: isSelected
                                    ? Center(
                                        child: Container(
                                          width: 12,
                                          height: 12,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: colorApp,
                                          ),
                                        ),
                                      )
                                    : null,
                              ),
                              const SizedBox(width: 12),
                              // Text content
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.text,
                                      style: GoogleFonts.roboto(
                                        fontSize: 14,
                                        fontWeight: isSelected
                                            ? FontWeight.w600
                                            : FontWeight.normal,
                                        color: item.disabled
                                            ? Colors.grey[400]
                                            : Colors.black87,
                                      ),
                                    ),
                                    if (item.value.isNotEmpty) ...[
                                      const SizedBox(height: 4),
                                      Text(
                                        "Mã: ${item.value}",
                                        style: GoogleFonts.roboto(
                                          fontSize: 12,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ],
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),

          // Action buttons
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.grey[200]!, width: 1),
              ),
            ),
            child: Row(
              children: [
                // Cancel button
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      side: BorderSide(color: Colors.grey[300]!),
                    ),
                    child: Text(
                      "Hủy",
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                // Select button
                Expanded(
                  child: ElevatedButton(
                    onPressed: _selectedItem == null
                        ? null
                        : () => Navigator.pop(context, _selectedItem),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorApp,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      "Chọn",
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
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

