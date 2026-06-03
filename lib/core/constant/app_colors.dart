import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color spaceDark = Color(0xFF060913);
  static const Color panelGlass = Color(0x0AFFFFFF);
  static const Color borderGlass = Color(0x1FFFFFFF);

  static const Color neonBlue = Color(0xFF00E5FF);
  static const Color cyberTeal = Color(0xFF00E676);
  static const Color warningOrange = Color(0xFFFF9100);

  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Color(0xFFB0BEC5);
  static const Color textMuted = Color(0xFF78909C);

  static const Color errorRed = Color(0xFFFF5252);

  static ThemeData get premiumTheme {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: spaceDark,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.8,
        ),
      ),
    );
  }
}