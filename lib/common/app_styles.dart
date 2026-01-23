import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF6200EE);
  static const Color secondary = Color(0xFF03DAC6);
  static const Color background = Color(0xFFF5F5F5);
  static const Color surface = Colors.white;
  static const Color error = Color(0xFFB00020);
  static const Color textPrimary = Color(0xFF000000);
  static const Color textSecondary = Color(0xFF757575);
  static const Color grey500 = Color(0xFF9E9E9E);
  static const Color grey600 = Color(0xFF757575);
  static const Color grey700 = Color(0xFF616161);
}

class AppTextStyles {
  static TextStyle get todoContent => const TextStyle(
      fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.textPrimary);

  static TextStyle get todoCompleted => const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: AppColors.grey500,
      decoration: TextDecoration.lineThrough);

  static TextStyle get todoDate => const TextStyle(
      fontSize: 14,
      color: AppColors.textSecondary);

  static TextStyle get statCount => const TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w600
  );
}

// 로그인 화면 스타일
class LoginStyles {
  static const double gradientOpacity = 0.7;
  static const double borderWidth = 2.0;

  static const TextStyle title = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 18,
    color: Colors.white70,
    letterSpacing: 2,
  );

  static const TextStyle buttonText = TextStyle(fontSize: 16);
}

// 테마 상점 스타일
class ThemeShopStyles {
  static const double previewSize = 80.0;
  static const double checkIconSize = 32.0;
  static const double shadowOpacity = 0.3;
  static const double shadowBlur = 8.0;
  static const Offset shadowOffset = Offset(0, 4);
  static const double cardElevation = 2.0;
  static const double selectedCardElevation = 8.0;
  static const double selectedBorderWidth = 2.0;
  static const Color successColor = Colors.green;

  static const TextStyle headerTitle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static TextStyle headerSubtitle = const TextStyle(
    fontSize: 14,
    color: AppColors.grey600,
  );

  static const TextStyle cardTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static TextStyle cardDescription = const TextStyle(
    fontSize: 14,
    color: AppColors.grey600,
  );
}

class AppSpacing {
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
}

class AppRadius {
  static const double md = 12.0;

  static BorderRadius get mediumRadius => BorderRadius.circular(md);
}