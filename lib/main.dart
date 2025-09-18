import 'package:flutter/material.dart';
import 'package:timos_customer_2025/ui/routers/router_generator.dart';
import 'package:timos_customer_2025/ui/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
  } catch (_) {}
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quản lý Timos',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        fontFamily: 'Montserrat',
      ),
      home: const SplashScreen(),
      onGenerateRoute: RouterGenerator.generateRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
