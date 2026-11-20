import 'package:material_ui/material_ui.dart';

/// 应用主题配置。
abstract final class AppTheme {
  static const Color seedColor = Color(0xFF5B8DEF);
  static const Color pageBackground = Color(0xFFF7F8FA);

  static final ThemeData light = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: seedColor,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: pageBackground,
  );
}
