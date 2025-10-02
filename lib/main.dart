import 'package:flutter/material.dart';
import 'package:timos_customer_2025/ui/routers/router_generator.dart';
import 'package:timos_customer_2025/ui/splash/splash_screen.dart';
import 'package:timos_customer_2025/themes/colors.dart';
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
    final ColorScheme colorScheme =
        ColorScheme.fromSeed(seedColor: mainColor).copyWith(
      primary: mainColor,
      secondary: secondaryColor,
      surface: cardBackground,
      background: backgroundColor,
      onPrimary: white,
      onSecondary: white,
      onSurface: textPrimary,
      onBackground: textPrimary,
    );
    final ThemeData theme = ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: const AppBarTheme(centerTitle: true, elevation: 0),
      cardTheme: CardTheme(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
      listTileTheme: const ListTileThemeData(
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 6)),
      fontFamily: 'Montserrat',
    );
    return MaterialApp(
      title: 'Quản lý Timos',
      theme: theme,
      home: const SplashScreen(),
      onGenerateRoute: RouterGenerator.generateRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
