import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  // Khóa để lưu vào SharedPreferences
  static const String themeKey = "isDarkMode";

  bool _isDarkMode = true; // Mặc định là Dark Mode theo yêu cầu Lab

  bool get isDarkMode => _isDarkMode;

  ThemeProvider() {
    _loadTheme();
  }

  // Chuyển đổi qua lại giữa Light và Dark
  void toggleTheme() async {
    _isDarkMode = !_isDarkMode;
    notifyListeners();

    // Lưu lựa chọn của người dùng
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(themeKey, _isDarkMode);
  }

  // Tải tùy chọn đã lưu từ bộ nhớ
  void _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    _isDarkMode = prefs.getBool(themeKey) ?? true;
    notifyListeners();
  }

  // Định nghĩa màu sắc cho Light Theme
  ThemeData get lightTheme => ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xFF1E1E1E),
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF1E1E1E),
      secondary: Color(0xFF424242),
      surface: Color(0xFFF5F5F5),
      error: Color(0xFFFF6B6B),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
    ),
  );

  // Định nghĩa màu sắc cho Dark Theme
  ThemeData get darkTheme => ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF121212),
    scaffoldBackgroundColor: Colors.black,
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF121212),
      secondary: Color(0xFF2C2C2C),
      surface: Color(0xFF1E1E1E),
      error: Color(0xFFFF6B6B),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
  );
}