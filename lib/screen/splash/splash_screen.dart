import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timos_customer_2025/screen/routers/router_generator.dart';
import 'package:timos_customer_2025/screen/login/bloc/bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer(const Duration(seconds: 2), () {
      if (!mounted) return;
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.when(
          initial: () {},
          loading: () {},
          authenticated: (user, token) {
            Navigator.of(context).pushReplacementNamed(
              RouterGenerator.routeDashboardScreen,
            );
          },
          unauthenticated: () {
            Navigator.of(context).pushReplacementNamed(
              RouterGenerator.routeLoginScreen,
            );
          },
          error: (message) {
            Navigator.of(context).pushReplacementNamed(
              RouterGenerator.routeLoginScreen,
            );
          },
        );
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              FlutterLogo(size: 96),
              SizedBox(height: 16),
              CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
