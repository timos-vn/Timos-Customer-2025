import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timos_customer_2025/const/const.dart';
import 'package:timos_customer_2025/screen/booking_ticket/booking/bloc/booking_bloc.dart';
import 'package:timos_customer_2025/screen/booking_ticket/booking/bloc/booking_state.dart';
import 'package:timos_customer_2025/screen/booking_ticket/booking/model/province_model.dart';
import 'package:timos_customer_2025/screen/booking_ticket/booking/model/ticket_detail_model.dart';
import 'package:timos_customer_2025/screen/booking_ticket/ticket_price/ticket_price_screen.dart';

/// BookingScreen.dart
/// A clean, user-friendly ticket booking screen with:
/// - From (province) dropdown
/// - To (province) dropdown
/// - Date & Time pickers
/// - Passenger counter
/// - Search button with simple validation
///
/// Copy this file into your Flutter project (e.g. `lib/screens/booking_screen.dart`) and
/// navigate to it from your app to see the UI.

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final _formKey = GlobalKey<FormState>();

  // Example data for provinces — replace with your real data or API.
  final List<String> _provinces = [
    'Hà Nội',
    'Hồ Chí Minh',
    'Đà Nẵng',
    'Hải Phòng',
    'Cần Thơ',
    'Ninh Bình',
    'Quảng Ninh',
  ];

  ProvinceModel? _from;
  ProvinceModel? _to;
  DateTime? _date;
  TimeOfDay? _time;
  int _passengers = 1;

  // Helpers to format date/time
  String get _dateText => _date == null
      ? 'Chọn ngày'
      : '${_date!.day}/${_date!.month}/${_date!.year}';

  String get _timeText => _time == null ? 'Chọn giờ' : _time!.format(context);

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _date ?? now,
      firstDate: now,
      lastDate: DateTime(now.year + 2),
    );
    if (picked != null) setState(() => _date = picked);
  }

  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _time ?? TimeOfDay(hour: 8, minute: 0),
    );
    if (picked != null) setState(() => _time = picked);
  }

  void _swapLocations() {
    setState(() {
      final tmp = _from;
      _from = _to;
      _to = tmp;
    });
  }

  List<ProvinceModel> listProvince = [];



  void _submit(BookingState state) {
    if (_formKey.currentState?.validate() ?? false) {
      if (_date == null || _time == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Vui lòng chọn ngày và giờ đi.')),
        );
        return;
      }

      // Gather booking info and proceed
      final DateTime dateTime = DateTime(
        _date!.year,
        _date!.month,
        _date!.day,
        _time!.hour,
        _time!.minute,
      );

      // Example result — replace with navigation / API call.
      final bookingSummary = {
        'from': _from,
        'to': _to,
        'datetime': dateTime.toIso8601String(),
        'passengers': _passengers,
      };

      // For demo show a Dialog
      TicketDetailModel ticketDetail = TicketDetailModel(
        dropoff: state.dropoff,
        pickup: state.pickup,
        pickupDetail: state.pickupDetail,
        dropoffDetail: state.dropoffDetail,
        departureDate: state.departureDate,
        returnDate: state.returnDate,
        numCustomers: state.numCustomers,
        isRoundTrip: state.isRoundTrip,
        typeCar: state.selectedVehicleType,
        idDiemLen: state.idDiemLen,
        idDiemXuong: state.idDiemXuong,
      );
      // Navigator.pushNamed(context, RouterGenerator.ticketDetail,
      //     arguments: ticketDetail);
      // searchTicket(ticketDetail);
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return TicketPriceScreen(ticketDetail);
      }));
    }
  }

  Future<List<ProvinceModel>> loadTinhThanh() async {
    // Đọc file JSON dưới dạng String
    final String response = await rootBundle.loadString(Const.fileDataProvince);
    // Parse JSON
    final List<dynamic> data = jsonDecode(response);
    // Chuyển thành List<TinhThanh>
    return data.map((e) => ProvinceModel.fromJson(e)).toList();
  }

  @override
  void initState() {

    _loadData();
    super.initState();
  }
  Future<void> _loadData() async {
    listProvince = await loadTinhThanh();
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BookingBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Đặt vé'),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black87,
        ),
        backgroundColor: const Color(0xFFF6F8FB),
        body: BlocBuilder<BookingBloc, BookingState>(builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          // From & To Row
                          Row(
                            children: [
                              Expanded(
                                child: _buildDropdownField(
                                  label: 'Tỉnh đi',
                                  value: _from,
                                  onChanged: (v) => setState(() => _from = v),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(horizontal: 8),
                                child: IconButton(
                                  icon: const Icon(Icons.swap_horiz),
                                  tooltip: 'Đổi chỗ',
                                  onPressed: _swapLocations,
                                ),
                              ),
                              Expanded(
                                child: _buildDropdownField(
                                  label: 'Tỉnh đến',
                                  value: _to,
                                  onChanged: (v) => setState(() => _to = v),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 12),

                          // Date & Time Row
                          Row(
                            children: [
                              Expanded(
                                child: _buildPickerField(
                                  label: 'Ngày đi',
                                  valueText: _dateText,
                                  onTap: _pickDate,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: _buildPickerField(
                                  label: 'Giờ đi',
                                  valueText: _timeText,
                                  onTap: _pickTime,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 12),

                          // Passengers
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Số lượng khách',
                                  style: TextStyle(fontSize: 16)),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () => setState(() {
                                      if (_passengers > 1) _passengers--;
                                    }),
                                    icon: const Icon(Icons.remove_circle_outline),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 6),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 4,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: Text('$_passengers',
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600)),
                                  ),
                                  IconButton(
                                    onPressed: () => setState(() {
                                      if (_passengers < 9) _passengers++;
                                    }),
                                    icon: const Icon(Icons.add_circle_outline),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          const SizedBox(height: 8),

                          // Optional quick tips / smart defaults
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Mẹo: Chọn ngày đi sớm để có nhiều lựa chọn ghế và giá tốt hơn.',
                              style: TextStyle(
                                  fontSize: 12, color: Colors.grey[700]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Search button
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () => _submit(state),
                    icon: const Icon(Icons.search),
                    label:
                    const Text('Tìm chuyến', style: TextStyle(fontSize: 16)),
                  ),

                  const SizedBox(height: 12),

                  // Extra: Recent searches or promotions card (nice touch)
                  Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('Ưu đãi hôm nay',
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold)),
                                SizedBox(height: 6),
                                Text(
                                    'Giảm giá đến 20% cho các chuyến sớm. Nhanh tay để đặt!'),
                              ],
                            ),
                          ),
                          Icon(Icons.local_offer_outlined,
                              color: Colors.orange[700]),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildDropdownField(
      {required String label,
        ProvinceModel? value,
      required ValueChanged<ProvinceModel?> onChanged}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
        const SizedBox(height: 6),
        DropdownButtonFormField<ProvinceModel>(
          value: value,
          items: listProvince.map((p) {
            return DropdownMenuItem(
              value: p,
              child: Text(p.tenThanhPho),
            );
          }).toList(),
          onChanged: onChanged,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
          validator: (v) => (v == null) ? 'Vui lòng chọn $label' : null,
        ),
      ],
    );
  }

  Widget _buildPickerField(
      {required String label,
      required String valueText,
      required VoidCallback onTap}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
        const SizedBox(height: 6),
        InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(valueText, style: const TextStyle(fontSize: 16)),
                const Icon(Icons.calendar_today_outlined, size: 18),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
