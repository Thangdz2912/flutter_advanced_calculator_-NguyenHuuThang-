import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// Đảm bảo đúng đường dẫn các file trong project của bạn
import 'package:code_may_tinh/providers/calculator_provider.dart';
import 'package:code_may_tinh/providers/theme_provider.dart';
import 'package:code_may_tinh/screens/calculator_screen.dart';

void main() async {
  // BẮT BUỘC: Đảm bảo Flutter framework sẵn sàng để đọc SharedPreferences
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CalculatorProvider()),
        // THÊM: Quản lý giao diện sáng/tối
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Lắng nghe sự thay đổi từ ThemeProvider
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Advanced Calculator',

      // SỬA: Sử dụng cấu hình Theme từ ThemeProvider thay vì fix cứng
      theme: themeProvider.lightTheme,
      darkTheme: themeProvider.darkTheme,

      // Quyết định dùng theme nào dựa trên biến isDarkMode
      themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,

      home: const CalculatorScreen(),
    );
  }
}