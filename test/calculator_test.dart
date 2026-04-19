import 'package:flutter_test/flutter_test.dart';
import 'package:code_may_tinh/providers/calculator_provider.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Thêm dòng này

void main() {
  // BẮT BUỘC: Thêm 2 dòng này để giả lập môi trường Flutter và SharedPreferences
  TestWidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});

  group('Kiểm thử tính toán cơ bản', () {
    test('Phép cộng: 5 + 3 phải bằng 8', () {
      final calc = CalculatorProvider();
      calc.addToExpression('5');
      calc.addToExpression('+');
      calc.addToExpression('3');
      calc.calculate();
      expect(calc.result, '8');
    });

    test('Phép nhân: 10 × 2 phải bằng 20', () {
      final calc = CalculatorProvider();
      calc.addToExpression('10');
      calc.addToExpression('×');
      calc.addToExpression('2');
      calc.calculate();
      expect(calc.result, '20');
    });

    test('Xử lý chia cho 0', () {
      final calc = CalculatorProvider();
      calc.addToExpression('10');
      calc.addToExpression('÷');
      calc.addToExpression('0');
      calc.calculate();
      // math_expressions thường trả về 'Infinity'
      expect(calc.result, contains('Infinity'));
    });
  });

  group('Kiểm thử hàm khoa học', () {
    test('Kiểm tra hàm Sin(0) = 0', () {
      final calc = CalculatorProvider();
      calc.addToExpression('sin');
      calc.addToExpression('0');
      calc.calculate();
      expect(calc.result, '0');
    });
  });

  group('Kiểm thử chức năng xóa', () {
    test('Nút C phải reset về 0', () {
      final calc = CalculatorProvider();
      calc.addToExpression('123');
      calc.clear();
      expect(calc.expression, '');
      expect(calc.result, '0');
    });

    test('Nút DEL phải xóa ký tự cuối cùng', () {
      final calc = CalculatorProvider();
      calc.addToExpression('123');
      calc.deleteLast();
      expect(calc.expression, '12');
    });
  });
}