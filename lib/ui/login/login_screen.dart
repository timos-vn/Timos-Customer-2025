import 'package:flutter/material.dart';
import 'package:timos_customer_2025/ui/routers/router_generator.dart';
import 'package:timos_customer_2025/themes/colors.dart';
import 'package:timos_customer_2025/services/fake_auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController orgCodeController = TextEditingController();
  bool isObscured = true;
  bool rememberMe = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[mainColor, mainColor.withOpacity(0.8)],
              ),
            ),
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset('assets/image/logo.png',
                            width: 96, height: 96, fit: BoxFit.cover),
                      ),
                      const SizedBox(height: 12),
                      const Text('Quản lý Timos',
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w800,
                              color: Colors.white)),
                      const SizedBox(height: 8),
                      const Text(
                        'Hệ thống quản trị điều hành đặt vé xe\nQuản lý đơn, chuyến, tài xế, báo cáo vận hành',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 13, color: Colors.white70),
                      ),
                    ]),
                    const SizedBox(height: 24),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.black.withOpacity(0.10),
                              blurRadius: 18,
                              offset: const Offset(0, 8)),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextField(
                            controller: phoneController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              labelText: 'Email hoặc Số điện thoại',
                              prefixIcon: Icon(Icons.person_outline),
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 12),
                          TextField(
                            controller: passwordController,
                            obscureText: isObscured,
                            decoration: InputDecoration(
                              labelText: 'Mật khẩu',
                              prefixIcon: const Icon(Icons.lock_outline),
                              border: const OutlineInputBorder(),
                              suffixIcon: IconButton(
                                icon: Icon(isObscured
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () =>
                                    setState(() => isObscured = !isObscured),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(children: [
                                Checkbox(
                                    value: rememberMe,
                                    onChanged: (v) =>
                                        setState(() => rememberMe = v ?? true)),
                                const Text('Ghi nhớ đăng nhập',
                                    style: TextStyle(fontSize: 13)),
                              ]),
                              TextButton(
                                  onPressed: () {},
                                  child: const Text('Quên mật khẩu?',
                                      style: TextStyle(fontSize: 13))),
                            ],
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            height: 52,
                            child: FilledButton(
                              onPressed: () async {
                                final user = await FakeAuthService.signIn(
                                  username: phoneController.text.trim(),
                                  password: passwordController.text,
                                );
                                if (!mounted) return;
                                if (user != null) {
                                  Navigator.of(context).pushReplacementNamed(
                                      RouterGenerator.routeDashboardScreen);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          'Đăng nhập thất bại. Thử: manager@timos.vn / 123456 hoặc driver@timos.vn / 123456'),
                                    ),
                                  );
                                }
                              },
                              child: const Text('Đăng nhập',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Bằng việc tiếp tục, bạn đồng ý với Điều khoản và Chính sách bảo mật của Timos',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 11, color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xFFF7F9FC),
    );
  }
}
