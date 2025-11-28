import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timos_customer_2025/screen/routers/router_generator.dart';
import 'package:timos_customer_2025/themes/colors.dart';
import 'package:timos_customer_2025/screen/login/bloc/bloc.dart';
import 'package:timos_customer_2025/services/auth_service.dart';

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
  void initState() {
    super.initState();
    // Đợi widget build xong rồi mới load credentials
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadRememberedCredentials();
    });
  }

  void _loadRememberedCredentials() {
    try {
      final isRememberMe = AuthService.isRememberMeEnabled;
      if (isRememberMe) {
        final savedUsername = AuthService.savedUsername;
        final savedPassword = AuthService.savedPassword;
        
        if (savedUsername != null && savedPassword != null && savedUsername.isNotEmpty && savedPassword.isNotEmpty) {
          setState(() {
            phoneController.text = savedUsername;
            passwordController.text = savedPassword;
            rememberMe = true;
          });
        } else {
          // Nếu không có thông tin đã lưu nhưng flag rememberMe vẫn true, reset lại
          setState(() {
            rememberMe = false;
          });
          AuthService.clearRememberMe();
        }
      } else {
        setState(() {
          rememberMe = false;
        });
      }
    } catch (e) {
      // Nếu có lỗi khi load, reset về trạng thái mặc định
      setState(() {
        rememberMe = false;
      });
    }
  }

  void _handleLogin() {
    final username = phoneController.text.trim();
    final password = passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      _showErrorMessage('Vui lòng nhập đầy đủ thông tin đăng nhập');
      return;
    }

    context.read<AuthBloc>().add(AuthEvent.loginRequested(
      username: username,
      password: password,
    ));
  }

  void _showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 4),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.when(
          initial: () {},
          loading: () {},
          authenticated: (user, token) {
            // Lưu hoặc xóa thông tin đăng nhập dựa trên rememberMe
            final saveFuture = rememberMe
                ? AuthService.saveRememberMe(
                    username: phoneController.text.trim(),
                    password: passwordController.text.trim(),
                  )
                : AuthService.clearRememberMe();
            
            saveFuture.then((_) {
              if (mounted) {
                Navigator.of(context).pushReplacementNamed(
                  RouterGenerator.routeDashboardScreen,
                );
              }
            });
          },
          unauthenticated: () {},
          error: (message) {
            _showErrorMessage(message);
          },
        );
      },
      child: Scaffold(
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
                                    onChanged: (v) {
                                      final newValue = v ?? true;
                                      setState(() => rememberMe = newValue);
                                      // Xóa thông tin đã lưu nếu bỏ chọn rememberMe
                                      if (!newValue) {
                                        AuthService.clearRememberMe();
                                      }
                                    }),
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
                          BlocBuilder<AuthBloc, AuthState>(
                            builder: (context, state) {
                              final isLoading = state.maybeWhen(
                                loading: () => true,
                                orElse: () => false,
                              );
                              
                              return SizedBox(
                                height: 52,
                                child: FilledButton(
                                  onPressed: isLoading ? null : _handleLogin,
                                  child: isLoading
                                      ? const SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                          ),
                                        )
                                      : const Text('Đăng nhập',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600)),
                                ),
                              );
                            },
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
      ),
    );
  }
}
