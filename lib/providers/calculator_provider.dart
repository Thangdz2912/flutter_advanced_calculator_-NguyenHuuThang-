import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math' as math;

enum CalcMode { basic, scientific, programmer }

class CalculatorProvider with ChangeNotifier {
  String _expression = '';
  String _result = '0';
  CalcMode _mode = CalcMode.basic;

  // Memory & History
  double _memory = 0.0;
  List<String> _history = [];

  // Programmer Mode Getters (Chuyển đổi nhanh)
  String get binDisplay => _toBase(2);
  String get hexDisplay => _toBase(16);
  String get octDisplay => _toBase(8);
  String get decDisplay => _result;

  // Getters
  String get expression => _expression;
  String get result => _result;
  CalcMode get mode => _mode;
  List<String> get history => _history;
  double get memory => _memory;

  CalculatorProvider() {
    _loadHistory();
  }

  // --- CHẾ ĐỘ (MODES) ---
  void setMode(CalcMode newMode) {
    _mode = newMode;
    notifyListeners();
  }

  void toggleScientific() {
    if (_mode == CalcMode.scientific) {
      _mode = CalcMode.basic;
    } else {
      _mode = CalcMode.scientific;
    }
    notifyListeners();
  }

  // --- LOGIC NHẬP LIỆU ---
  void addToExpression(String value) {
    // Ngăn nhập ký tự khoa học/chữ cái khi ở mode Basic/Programmer tùy logic
    switch (value) {
      case 'sin': case 'cos': case 'tan': case 'ln': case 'log':
      _expression += "$value(";
      break;
      case '√':
        _expression += "sqrt(";
        break;
      case 'x²':
        _expression += "^2";
        break;
      case 'π':
        _expression += "3.1415926535";
        break;
      case 'e':
        _expression += "2.7182818284";
        break;
      case 'exp':
        _expression += "e^";
        break;
      case 'mod':
        _expression += "%";
        break;
    // Programmer logic: Bitwise
      case 'AND': _expression += "&"; break;
      case 'OR':  _expression += "|"; break;
      case 'XOR': _expression += "^"; break;
      case 'NOT': _expression += "~"; break;
      case '<<':  _expression += "<<"; break;
      case '>>':  _expression += ">>"; break;
      default:
        _expression += value;
    }
    notifyListeners();
  }

  // --- XỬ LÝ BỘ NHỚ (MEMORY) ---
  void memoryClear() {
    _memory = 0.0;
    notifyListeners();
  }

  void memoryAdd() {
    _memory += double.tryParse(_result) ?? 0.0;
    notifyListeners();
  }

  void memorySubtract() {
    _memory -= double.tryParse(_result) ?? 0.0;
    notifyListeners();
  }

  void memoryRecall() {
    _expression += _memory.toString();
    notifyListeners();
  }

  // --- CÁC PHÍM CHỨC NĂNG ---
  void clear() {
    _expression = '';
    _result = '0';
    notifyListeners();
  }

  void deleteLast() {
    if (_expression.isNotEmpty) {
      _expression = _expression.substring(0, _expression.length - 1);
      notifyListeners();
    }
  }

  // --- TÍNH TOÁN (LOGIC CHÍNH) ---
  void calculate() {
    if (_expression.isEmpty) return;

    if (_mode == CalcMode.programmer) {
      _calculateProgrammer();
      return;
    }

    try {
      String finalExpression = _expression
          .replaceAll('×', '*')
          .replaceAll('÷', '/')
          .replaceAll('±', '-');

      // Tự động đóng ngoặc
      int leftBrackets = '('.allMatches(finalExpression).length;
      int rightBrackets = ')'.allMatches(finalExpression).length;
      while (leftBrackets > rightBrackets) {
        finalExpression += ')';
        _expression += ')';
        rightBrackets++;
      }

      Parser p = Parser();
      Expression exp = p.parse(finalExpression);
      ContextModel cm = ContextModel();

      double eval = exp.evaluate(EvaluationType.REAL, cm);

      _result = eval % 1 == 0 ? eval.toInt().toString() : eval.toStringAsFixed(4);
      if (_result.endsWith('.0000')) _result = _result.split('.')[0];

      _addToHistory("$_expression = $_result");
    } catch (e) {
      _result = "Error";
    }
    notifyListeners();
  }

  // --- PROGRAMMER LOGIC (BITWISE) ---
  void _calculateProgrammer() {
    try {
      // Đơn giản hóa: Chỉ hỗ trợ tính toán số nguyên ở mode Programmer
      // Lưu ý: math_expressions không hỗ trợ trực tiếp Bitwise,
      // vì vậy ta xử lý thủ công các phép tính cơ bản hoặc dùng parser riêng.
      // Dưới đây là logic mẫu cho các phép tính số nguyên:
      int val = int.parse(_expression);
      _result = val.toString();
    } catch (e) {
      // Nếu biểu thức phức tạp, bạn có thể tích hợp thư viện 'expressions'
      // hoặc logic parse riêng cho toán tử &, |, ^, <<, >>
      _result = "Error";
    }
    notifyListeners();
  }

  String _toBase(int radix) {
    try {
      int? val = int.tryParse(_result.split('.')[0]);
      if (val == null) return '0';
      return val.toRadixString(radix).toUpperCase();
    } catch (e) {
      return '0';
    }
  }

  // --- PERSISTENCE (LƯU TRỮ) ---
  void _addToHistory(String entry) async {
    _history.insert(0, entry);
    if (_history.length > 20) _history.removeLast();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('calc_history', _history);
    notifyListeners();
  }

  void _loadHistory() async {
    final prefs = await SharedPreferences.getInstance();
    _history = prefs.getStringList('calc_history') ?? [];
    notifyListeners();
  }

  void clearHistory() async {
    _history.clear();
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('calc_history');
    notifyListeners();
  }
}