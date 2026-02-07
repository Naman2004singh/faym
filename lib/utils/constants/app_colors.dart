import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF6C63FF);
  static const Color primaryDark = Color(0xFF5A52E0);
  static const Color primaryLight = Color(0xFF8B85FF);
  
  static const Color secondary = Color(0xFFFF6584);
  static const Color secondaryDark = Color(0xFFE0546F);
  static const Color secondaryLight = Color(0xFFFF8FA3);
  
  static const Color accent = Color(0xFF00D4AA);
  static const Color accentLight = Color(0xFF33DCBC);
  
  static const Color background = Color(0xFFF8F9FE);
  static const Color darkBackground = Color(0xFF1A1A2E);
  
  static const Color textPrimary = Color(0xFF2D3142);
  static const Color textSecondary = Color(0xFF7E8A9E);
  static const Color textLight = Color(0xFFFFFFFF);
  
  static const Color divider = Color(0xFFE8ECF4);
  static const Color border = Color(0xFFE0E4EC);
  
  static const Color success = Color(0xFF00C48C);
  static const Color error = Color(0xFFFF647C);
  static const Color warning = Color(0xFFFFA26B);
  
  static LinearGradient primaryGradient = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primary, primaryLight],
  );
  
  static LinearGradient accentGradient = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [accent, accentLight],
  );
  
  static LinearGradient overlayGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Colors.black.withValues(alpha: 0.7),
      Colors.black.withValues(alpha: 0.5),
    ],
  );
  
  static LinearGradient shimmerGradient = LinearGradient(
    colors: [
      Colors.grey[300]!,
      Colors.grey[200]!,
      Colors.grey[300]!,
    ],
  );
}
