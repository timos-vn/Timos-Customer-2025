import 'package:flutter/material.dart';
import 'package:timos_customer_2025/enum/enum_request_method.dart';

class CustomerScreen extends StatelessWidget {
  const CustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CustomerInfo> items = List<CustomerInfo>.generate(
      15,
      (int i) => CustomerInfo(
        customerId: 'c$i',
        name: 'Nguyễn Văn ${i + 1}',
        phone: '09${i.toString().padLeft(8, '0')}',
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách khách'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
      body: ListView.separated(
        itemCount: items.length,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (BuildContext context, int index) {
          final CustomerInfo c = items[index];
          return Card(
            child: ListTile(
              title: Text(c.name),
              subtitle: Text(c.phone),
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}
