import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:code_may_tinh/providers/calculator_provider.dart';
import 'package:code_may_tinh/providers/theme_provider.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final calc = Provider.of<CalculatorProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text("Advanced Calculator", style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: Icon(themeProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode, color: Colors.amber),
            onPressed: () => themeProvider.toggleTheme(),
          ),
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () => _showHistoryDialog(context, calc),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // --- PHẦN 1: MODE SELECTOR (Giữ nguyên chiều cao cố định) ---
            _buildModeSelector(calc),

            // --- PHẦN 2: DISPLAY AREA (Flex 1 - Thu gọn lại) ---
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                alignment: Alignment.bottomRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    if (calc.history.isNotEmpty)
                      FittedBox( // Chống tràn dòng lịch sử
                        fit: BoxFit.scaleDown,
                        child: Text(
                          calc.history.first,
                          style: const TextStyle(fontSize: 16, color: Colors.orangeAccent),
                        ),
                      ),
                    const SizedBox(height: 4),
                    // Biểu thức đang nhập
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        calc.expression.isEmpty ? "0" : calc.expression,
                        style: TextStyle(fontSize: 26, color: themeProvider.isDarkMode ? Colors.grey : Colors.black54),
                      ),
                    ),
                    const SizedBox(height: 4),
                    // Kết quả chính (Dùng Flexible + FittedBox là an toàn nhất)
                    Flexible(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: SelectableText(
                          calc.result,
                          style: TextStyle(
                            fontSize: 50, // Giảm nhẹ size gốc để ổn định hơn
                            fontWeight: FontWeight.bold,
                            color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // --- PHẦN 3: BUTTON GRID (Tăng Flex lên 3 để bàn phím thoải mái) ---
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: themeProvider.isDarkMode ? const Color(0xFF171717) : Colors.grey[100],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: LayoutBuilder(
                    builder: (context, constraints) {
                      // Tự động tính toán tỷ lệ nút dựa trên không gian thực tế
                      return _buildGridByMode(calc, constraints);
                    }
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Cập nhật hàm điều hướng Grid để nhận thêm constraints
  Widget _buildGridByMode(CalculatorProvider calc, BoxConstraints constraints) {
    if (calc.mode == CalcMode.scientific) return _buildScientificGrid(calc, constraints);
    if (calc.mode == CalcMode.programmer) return _buildProgrammerGrid(calc, constraints);
    return _buildBasicGrid(calc, constraints);
  }

  // Sửa Grid cơ bản: Dùng childAspectRatio linh hoạt
  Widget _buildBasicGrid(CalculatorProvider calc, BoxConstraints constraints) {
    return GridView.count(
      crossAxisCount: 4,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      physics: const NeverScrollableScrollPhysics(), // Khóa cuộn để không bị cấn UI
      childAspectRatio: (constraints.maxWidth / 4) / (constraints.maxHeight / 5.5),
      children: [
        _btn(calc, 'C', color: Colors.redAccent, action: () => calc.clear()),
        _btn(calc, 'CE', color: Colors.blueGrey, action: () => calc.deleteLast()),
        _btn(calc, '%', color: Colors.blueGrey),
        _btn(calc, '÷', color: Colors.orange),
        _btn(calc, '7'), _btn(calc, '8'), _btn(calc, '9'),
        _btn(calc, '×', color: Colors.orange),
        _btn(calc, '4'), _btn(calc, '5'), _btn(calc, '6'),
        _btn(calc, '-', color: Colors.orange),
        _btn(calc, '1'), _btn(calc, '2'), _btn(calc, '3'),
        _btn(calc, '+', color: Colors.orange),
        _btn(calc, '±'), _btn(calc, '0'), _btn(calc, '.'),
        _btn(calc, '=', color: Colors.green, action: () => calc.calculate()),
      ],
    );
  }

  // Sửa Grid khoa học: Rất dễ tràn nếu không khóa Physics
  Widget _buildScientificGrid(CalculatorProvider calc, BoxConstraints constraints) {
    return GridView.count(
      crossAxisCount: 6,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: (constraints.maxWidth / 6) / (constraints.maxHeight / 6.5),
      children: [
        _btn(calc, 'sin'), _btn(calc, 'cos'), _btn(calc, 'tan'), _btn(calc, 'π'), _btn(calc, 'e'), _btn(calc, '√'),
        _btn(calc, 'ln'), _btn(calc, 'log'), _btn(calc, 'x²'), _btn(calc, '^'), _btn(calc, '('), _btn(calc, ')'),
        _btn(calc, '7'), _btn(calc, '8'), _btn(calc, '9'), _btn(calc, '÷', color: Colors.orange), _btn(calc, 'AC', color: Colors.redAccent, action: () => calc.clear()), _btn(calc, 'DEL', color: Colors.redAccent, action: () => calc.deleteLast()),
        _btn(calc, '4'), _btn(calc, '5'), _btn(calc, '6'), _btn(calc, '×', color: Colors.orange), _btn(calc, 'M+', color: Colors.blueGrey), _btn(calc, 'MR', color: Colors.blueGrey),
        _btn(calc, '1'), _btn(calc, '2'), _btn(calc, '3'), _btn(calc, '-', color: Colors.orange), _btn(calc, 'M-', color: Colors.blueGrey), _btn(calc, 'MC', color: Colors.blueGrey),
        _btn(calc, '0'), _btn(calc, '.'), _btn(calc, '±'), _btn(calc, '+', color: Colors.orange), _btn(calc, '=', color: Colors.green, action: () => calc.calculate()), _btn(calc, 'mod'),
      ],
    );
  }

  // --- THÊM ĐOẠN NÀY ĐỂ SỬA LỖI _buildModeSelector ---
  Widget _buildModeSelector(CalculatorProvider calc) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal, // Chống tràn nếu màn hình nhỏ
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _modeButton(calc, "Basic", CalcMode.basic),
            _modeButton(calc, "Scientific", CalcMode.scientific),
            _modeButton(calc, "Programmer", CalcMode.programmer),
          ],
        ),
      ),
    );
  }

  Widget _modeButton(CalculatorProvider calc, String label, CalcMode mode) {
    bool isSelected = calc.mode == mode;
    return GestureDetector(
      onTap: () => calc.setMode(mode), // Gọi hàm setMode trong Provider
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? Colors.orange : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? Colors.orange : Colors.grey.withOpacity(0.5),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
  Widget _buildProgrammerGrid(CalculatorProvider calc, BoxConstraints constraints) {
    return Column(
      children: [
        _baseInfo("HEX", calc.hexDisplay),
        _baseInfo("DEC", calc.decDisplay),
        _baseInfo("BIN", calc.binDisplay),
        const Divider(height: 10, color: Colors.white10),
        Expanded(
          child: GridView.count(
            crossAxisCount: 6,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: (constraints.maxWidth / 6) / (constraints.maxHeight / 6),
            children: [
              _btn(calc, 'A'), _btn(calc, 'B'), _btn(calc, 'C'), _btn(calc, 'D'), _btn(calc, 'E'), _btn(calc, 'F'),
              _btn(calc, 'AND', color: Colors.blueGrey), _btn(calc, 'OR', color: Colors.blueGrey), _btn(calc, 'XOR', color: Colors.blueGrey), _btn(calc, '<<', color: Colors.blueGrey), _btn(calc, '>>', color: Colors.blueGrey), _btn(calc, 'NOT', color: Colors.blueGrey),
              _btn(calc, '7'), _btn(calc, '8'), _btn(calc, '9'), _btn(calc, '4'), _btn(calc, '5'), _btn(calc, '6'),
              _btn(calc, '1'), _btn(calc, '2'), _btn(calc, '3'), _btn(calc, '0'), _btn(calc, 'AC', color: Colors.redAccent, action: () => calc.clear()), _btn(calc, '=', color: Colors.green, action: () => calc.calculate()),
            ],
          ),
        )
      ],
    );
  }
  Widget _baseInfo(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 12)),
          Text(value, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
    );
  }

  // --- COMMON BUTTON ---
  Widget _btn(CalculatorProvider calc, String text, {Color? color, VoidCallback? action}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? const Color(0xFF333333),
        foregroundColor: Colors.white,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: action ?? () => calc.addToExpression(text),
      child: Text(text, style: TextStyle(fontSize: text.length > 2 ? 10 : 18, fontWeight: FontWeight.bold)),
    );
  }

  // --- HISTORY DIALOG (Giữ nguyên bản fix ở Step trước) ---
  void _showHistoryDialog(BuildContext context, CalculatorProvider calc) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1E1E1E),
        title: const Text("History"),
        content: SizedBox(
          width: double.maxFinite,
          height: 300,
          child: ListView.separated(
            itemCount: calc.history.length,
            separatorBuilder: (_, __) => const Divider(color: Colors.white10),
            itemBuilder: (_, i) => ListTile(title: Text(calc.history[i], style: const TextStyle(color: Colors.white70))),
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("Close")),
        ],
      ),
    );
  }
}