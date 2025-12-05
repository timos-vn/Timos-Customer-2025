import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timos_customer_2025/bloc_base/app_bloc.dart';
import 'package:timos_customer_2025/bloc_base/app_event.dart';
import 'package:timos_customer_2025/enum/enum_request_method.dart';
import 'package:timos_customer_2025/screen/dashboard/bloc/dashboard_bloc.dart';
import 'package:timos_customer_2025/screen/utils/widget/utils_widget.dart';
import 'package:timos_customer_2025/themes/colors.dart';
import 'package:timos_customer_2025/screen/trip/trip_screen.dart';
import 'package:timos_customer_2025/services/auth_service.dart';
import 'package:timos_customer_2025/screen/routers/router_generator.dart';
import 'package:timos_customer_2025/models/response/auth/auth_response.dart';
import 'package:timos_customer_2025/utils/dio_log.dart';
import 'package:timos_customer_2025/utils/shorebird_utils.dart';
import 'package:timos_customer_2025/utils/utils.dart';

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
      // const CustomerScreen(),
      const TripScreen(),
      _ProfileTab(onRolePicked: (UserRole r) => setState(() => role = r)),
    ];
  }

  void onTabSelected(int index) => setState(() => currentIndex = index);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ShorebirdUtils.instance.checkUpdateAndRestart(context);
    });

    context.read<AppBloc>().add(UpdateTongDiemEvent(
          AuthService.currentUser?.idNhaXe ?? 0,
        ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> tabs = buildTabs();

    return BlocProvider(
      create: (_) => DashboardBloc(),
      child: Scaffold(
        body: tabs[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: onTabSelected,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.dashboard), label: 'Dashboard'),
            // BottomNavigationBarItem(
            //     icon: Icon(Icons.people), label: 'Khách hàng'),
            BottomNavigationBarItem(
                icon: Icon(Icons.directions_bus), label: 'Chuyến đi'),
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
          ],
        ),
      ),
    );

    // return Scaffold(
    //   body: tabs[currentIndex],
    //   bottomNavigationBar: BottomNavigationBar(
    //     currentIndex: currentIndex,
    //     type: BottomNavigationBarType.fixed,
    //     onTap: onTabSelected,
    //     items: const [
    //       BottomNavigationBarItem(
    //           icon: Icon(Icons.dashboard), label: 'Dashboard'),
    //       // BottomNavigationBarItem(
    //       //     icon: Icon(Icons.people), label: 'Khách hàng'),
    //       BottomNavigationBarItem(
    //           icon: Icon(Icons.directions_bus), label: 'Chuyến đi'),
    //       BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
    //     ],
    //   ),
    // );
  }
}

class _DashboardTab extends StatelessWidget {
  const _DashboardTab();

  @override
  Widget build(BuildContext context) {
    final tongDiem = context.select((AppBloc bloc) => bloc.state.tongDiem);
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
              _MetricCard(title: 'Tổng điểm: ', value: '$tongDiem Đ', trend: ''),
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
    final user = AuthService.currentUser;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        centerTitle: true,
        title: const Text('Menu'),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          children: [
            GestureDetector(
              onDoubleTap: () => Diolog().showDiolog(context),
              child: _MenuHeaderCard(
                name: user?.hoTen ?? 'Chưa cập nhật',
                role: user?.roleName ?? 'Không xác định',
                phone: user?.dienThoai ?? '--',
              ),
            ),
            const SizedBox(height: 16),
            _SectionCard(
              title: 'Thông tin cá nhân',
              children: [
                _InfoRow(
                  icon: Icons.person_outline,
                  label: 'Họ tên',
                  value: user?.hoTen ?? 'Chưa cập nhật',
                ),
                _InfoRow(
                  icon: Icons.phone_android,
                  label: 'Số điện thoại',
                  value: user?.dienThoai ?? 'Chưa cập nhật',
                ),
                _InfoRow(
                  icon: Icons.badge_outlined,
                  label: 'Chức vụ',
                  value: user?.roleName ?? 'Không xác định',
                ),
              ],
            ),
            const SizedBox(height: 16),
            _SectionCard(
              title: 'Hành động',
              children: [
                _MenuActionTile(
                  icon: Icons.delete_outline,
                  label: 'Xoá tài khoản',
                  subtitle:
                      'Xoá tài khoản sẽ mất toàn bộ dữ liệu và không thể khôi phục.',
                  isDanger: true,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return UtilsWidget.dialogUpdateShorebird(
                          contentNotification:
                              "Bạn có chắc muốn xoá tài khoản, hành động này sẽ xoá toàn bộ dữ liệu và không thể khôi phục.",
                          fuc: () async {
                            await AuthService.signOut();
                            if (context.mounted) {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                RouterGenerator.routeLoginScreen,
                                (Route<dynamic> route) => false,
                              );
                            }
                          },
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),
            _LogoutButton(
              onPressed: () async {
                await AuthService.signOut();
                if (context.mounted) {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    RouterGenerator.routeLoginScreen,
                    (Route<dynamic> route) => false,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget dialogUpdateShorebird({
    required String contentNotification,
    required Function() fuc,
  }) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 12,
          ),
          Utils.buildText(
            "Ứng dụng cần cập nhật",
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
          const SizedBox(
            height: 12,
          ),
          Utils.buildText(
            contentNotification,
            fontSize: 14,
            maxLines: 4,
            // fontWeight: FontWeight.w700,
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorOrange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () => fuc(),
                    child: UtilsWidget.buildText(
                        text: "Đồng ý",
                        textColor: white,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MenuHeaderCard extends StatelessWidget {
  final String name;
  final String role;
  final String phone;

  const _MenuHeaderCard({
    required this.name,
    required this.role,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.black.withValues(alpha: 0.05)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 18,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: backgroundColor,
              border: Border.all(color: mainColor.withValues(alpha: 0.3)),
            ),
            child: const Icon(Icons.person, size: 36, color: Colors.grey),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  role,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey.shade600,
                      ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: mainColor.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.phone_iphone,
                          size: 16, color: mainColor),
                      const SizedBox(width: 6),
                      Text(
                        phone,
                        style: const TextStyle(
                          color: mainColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
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

class _SectionCard extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _SectionCard({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.black.withValues(alpha: 0.03)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
          const SizedBox(height: 12),
          for (var i = 0; i < children.length; i++) ...[
            children[i],
            if (i != children.length - 1)
              Divider(height: 24, color: Colors.grey.shade200, thickness: 0.8),
          ],
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        radius: 22,
        backgroundColor: backgroundColor,
        child: Icon(icon, color: mainColor),
      ),
      title: Text(
        label,
        style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
      ),
      subtitle: Text(
        value,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 15,
        ),
      ),
    );
  }
}

class _MenuActionTile extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final String label;
  final String subtitle;
  final bool isDanger;

  const _MenuActionTile({
    required this.icon,
    required this.label,
    required this.subtitle,
    required this.onTap,
    this.isDanger = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = isDanger ? Colors.red : mainColor;
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        radius: 24,
        backgroundColor: color.withValues(alpha: 0.12),
        child: Icon(icon, color: color),
      ),
      title: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 4),
        child: Text(
          subtitle,
          style: TextStyle(color: Colors.grey.shade600),
        ),
      ),
      trailing: Icon(Icons.chevron_right, color: Colors.grey.shade400),
      onTap: onTap,
    );
  }
}

class _LogoutButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _LogoutButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.redAccent,
        elevation: 0,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.redAccent.withValues(alpha: 0.4)),
        ),
      ),
      icon: const Icon(Icons.logout),
      label: const Text(
        'Đăng xuất',
        style: TextStyle(fontWeight: FontWeight.w600),
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
                      color: mainColor.withValues(alpha: 0.15),
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
          colors: <Color>[
            mainColor,
            mainColor.withValues(alpha: 0.8),
          ],
        ),
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
