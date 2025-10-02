import 'package:flutter/material.dart';
import 'package:timos_customer_2025/enum/enum_request_method.dart';
import 'package:timos_customer_2025/themes/colors.dart';
import 'package:timos_customer_2025/ui/customer/customer_sceen.dart';
import 'package:timos_customer_2025/ui/trip/trip_screen.dart';
import 'package:timos_customer_2025/services/fake_auth_service.dart';
import 'package:timos_customer_2025/ui/routers/router_generator.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentIndex = 0;
  UserRole? role;

  List<Widget> buildTabs() {
    return [
      const _DashboardTab(),
      const CustomerScreen(),
      const TripScreen(),
      _ProfileTab(onRolePicked: (UserRole r) => setState(() => role = r)),
    ];
  }

  void onTabSelected(int index) => setState(() => currentIndex = index);

  @override
  Widget build(BuildContext context) {
    final List<Widget> tabs = buildTabs();
    return Scaffold(
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: onTabSelected,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(
              icon: Icon(Icons.people), label: 'Khách hàng'),
          BottomNavigationBarItem(
              icon: Icon(Icons.directions_bus), label: 'Chuyến đi'),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
        ],
      ),
    );
  }
}

class _DashboardTab extends StatelessWidget {
  const _DashboardTab();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _AnalyticsBanner(),
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              const _MetricCard(
                  title: 'Doanh thu hôm nay', value: '12.5M', trend: '+8%'),
              const _MetricCard(
                  title: 'Số khách / chuyến', value: '145 / 18', trend: '+3%'),
              const _MetricCard(title: 'Chuyến trong ngày', value: '28'),
            ],
          ),
        ],
      ),
    );
  }
}

class _ProfileTab extends StatelessWidget {
  final void Function(UserRole role) onRolePicked;
  const _ProfileTab({required this.onRolePicked});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menu')),
      body: ListView(
        children: [
          Card(
            child: Column(children: const [
              ListTile(
                  leading: Icon(Icons.history),
                  title: Text('Lịch sử xử lý khách')),
              Divider(height: 1),
              ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text('Thông tin cá nhân')),
            ]),
          ),
          const Divider(height: 1),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text('Chọn vai trò'),
          ),
          ListTile(
            leading: const Icon(Icons.admin_panel_settings),
            title: const Text('Quản lý Timos'),
            onTap: () => onRolePicked(UserRole.manager),
          ),
          ListTile(
            leading: const Icon(Icons.swap_calls),
            title: const Text('Trung chuyển'),
            onTap: () => onRolePicked(UserRole.dispatcher),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.all(16),
            child: FilledButton.tonal(
                onPressed: () {
                  FakeAuthService.signOut();
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    RouterGenerator.routeLoginScreen,
                    (Route<dynamic> route) => false,
                  );
                },
                child: const Text('Đăng xuất')),
          ),
        ],
      ),
    );
  }
}

class _MetricCard extends StatelessWidget {
  final String title;
  final String value;
  final String trend;
  const _MetricCard(
      {required this.title, required this.value, this.trend = ''});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.labelLarge),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(value,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 22)),
                if (trend.isNotEmpty)
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: mainColor.withOpacity(.15),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(trend,
                        style: const TextStyle(color: Colors.green)),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _AnalyticsBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: <Color>[mainColor, mainColor.withOpacity(0.8)]),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: const [
          Icon(Icons.assessment, color: Colors.white),
          SizedBox(width: 12),
          Expanded(
              child: Text('Tổng quan vận hành hôm nay',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600))),
        ],
      ),
    );
  }
}

