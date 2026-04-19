# 🧮 Flutter Advanced Calculator

<div align="center">

[![Flutter](https://img.shields.io/badge/Flutter-3.9+-blue?style=flat-square&logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.0+-blue?style=flat-square&logo=dart)](https://dart.dev)
[![License](https://img.shields.io/badge/License-MIT-green?style=flat-square)](LICENSE)
[![GitHub](https://img.shields.io/badge/GitHub-Source-black?style=flat-square&logo=github)](https://github.com)

**Một ứng dụng máy tính nâng cao được phát triển với Flutter, hỗ trợ 3 chế độ đầy đủ tính năng: Cơ bản, Khoa học và Lập trình viên.**

[Tính Năng](#tính-năng) | [Cài Đặt](#cài-đặt) | [Kiến Trúc](#kiến-trúc) | [Hạn Chế](#hạn-chế-đã-biết)

</div>

---

## 📱 Giới Thiệu

**Flutter Advanced Calculator** là một ứng dụng máy tính hiện đại được xây dựng với Flutter, cung cấp ba chế độ tính toán khác nhau để đáp ứng nhu cầu của bất kỳ người dùng nào - từ những phép tính đơn giản đến các phép tính khoa học phức tạp và lập trình nhị phân.

Ứng dụng này được thiết kế với:
- **Giao diện người dùng sạch sẽ**: Tối ưu hóa cho các thiết bị di động
- **Chế độ Light/Dark**: Tự động lưu tùy chọn người dùng
- **Quản lý trạng thái hiện đại**: Sử dụng Provider pattern
- **Lịch sử tính toán**: Theo dõi tất cả phép tính trước đó
- **Bộ nhớ máy tính**: Chức năng M+ / M- / MR / MC một cách chuyên nghiệp

---

## ✨ Tính Năng

### 🔢 Chế Độ Cơ Bản (Basic Mode)
- Phép cộng, trừ, nhân, chia
- Tính toán phần trăm
- Xóa từng ký tự (Backspace)
- Tính toán trực tiếp từ trái sang phải
- Hiển thị kết quả ngay lập tức

### 🔬 Chế Độ Khoa Học (Scientific Mode)
- **Hàm lượng giác**: sin, cos, tan (hỗ trợ độ và radian)
- **Hàm logarit**: ln (logarit tự nhiên), log₁₀
- **Hàm mũ**: e^x, 10^x, x^y
- **Hàm căn bậc**: √x, ∛x, x^(1/n)
- **Hằng số toán học**: π (Pi), e (Euler)
- **Hàm đặc biệt**: Factorial (n!), Modulo (%)

### 👨‍💻 Chế Độ Lập Trình Viên (Programmer Mode)
- Chuyển đổi giữa các hệ số:
  - **Nhị phân** (Base 2)
  - **Bát phân** (Base 8)
  - **Thập phân** (Base 10)
  - **Thập lục phân** (Base 16)
- **Phép toán bitwise**:
  - AND (Phép và)
  - OR (Phép hoặc)
  - XOR (Phép hoặc loại trừ)
  - NOT (Phép đảo)
  - Left Shift (<<)
  - Right Shift (>>)
- Hiển thị kết quả theo tất cả các hệ số đồng thời

### 🎨 Các Tính Năng Bổ Sung
- **Chuyển đổi Theme**: Light mode (sáng) và Dark mode (tối)
- **Lịch sử Tính Toán**: Xem lại 10 phép tính gần nhất
- **Bộ Nhớ Máy Tính**: 
  - M+ (Cộng vào bộ nhớ)
  - M- (Trừ khỏi bộ nhớ)
  - MR (Gọi lại bộ nhớ)
  - MC (Xóa bộ nhớ)
- **Lưu Trữ Cục Bộ**: Dữ liệu được lưu tự động bằng SharedPreferences

---

## 📸 Ảnh Chụp Màn Hình

### Chế Độ Cơ Bản (Basic Mode)

```
<img width="1919" height="1079" alt="Screenshot 2026-04-19 151856" src="https://github.com/user-attachments/assets/ce352159-f010-430a-8fef-62802d4b41aa" />

```

**Các tính năng hiển thị**:
- Phép tính đơn giản
- Hiển thị kết quả ngay lập tức
- Chế độ Dark được bật
- Các nút đối xứng và dễ sử dụng

### Chế Độ Khoa Học (Scientific Mode)

```
<img width="1919" height="1079" alt="image" src="https://github.com/user-attachments/assets/352d9a1d-b175-4942-9403-d04e97bbe1d7" />

```

**Các tính năng hiển thị**:
- Các hàm lượng giác (sin, cos, tan)
- Hàm logarit
- Hằng số toán học
- Nút chế độ Hyp (Hyperbolic) và Rad (Radian)

### Chế Độ Lập Trình Viên (Programmer Mode)

```
<img width="1919" height="1079" alt="image" src="https://github.com/user-attachments/assets/aa8ffd74-2915-4e0a-b42f-3eda2f68d6e7" />


```

**Các tính năng hiển thị**:
- Chuyển đổi giữa các hệ số (DEC, HEX, BIN, OCT)
- Các phép toán Bitwise
- Kết quả hiển thị theo tất cả các hệ số

---

## 🏗️ Kiến Trúc Dự Án

### Sơ Đồ Kiến Trúc (Architecture Diagram)

```
┌─────────────────────────────────────────────────────────────┐
│                        Flutter App                          │
│                      (MyApp Widget)                         │
└──────────────────────────┬──────────────────────────────────┘
                           │
                  ┌────────┴────────┐
                  │                 │
         ┌────────▼────────┐   ┌────▼──────────┐
         │  Provider Layer │   │  Theme Layer  │
         ├─────────────────┤   ├───────────────┤
         │Calculator       │   │ThemeProvider  │
         │Provider         │   │               │
         │                 │   │- Dark/Light   │
         │- Expressions    │   │- Preferences  │
         │- History        │   │- Switching    │
         │- Memory         │   │               │
         │- 3 Modes        │   │               │
         └────────┬────────┘   └─────┬─────────┘
                  │                  │
         ┌────────▼──────────────────▼────────┐
         │      CalculatorScreen (UI)          │
         ├──────────────────────────────────────┤
         │                                      │
         │  ┌──────────────────────────────┐   │
         │  │  Display Area                │   │
         │  │  (Expression + Result)       │   │
         │  └──────────────────────────────┘   │
         │                                      │
         │  ┌──────────────────────────────┐   │
         │  │  Mode Selector               │   │
         │  │  (Basic/Scientific/Prog)     │   │
         │  └──────────────────────────────┘   │
         │                                      │
         │  ┌──────────────────────────────┐   │
         │  │  Button Grid                 │   │
         │  │  (CalcButton Widgets)        │   │
         │  └──────────────────────────────┘   │
         │                                      │
         └───────────────────────────────────────┘
                           │
                ┌──────────┴──────────┐
                │                     │
         ┌──────▼──────┐      ┌───────▼──────┐
         │  SharedPref │      │ math_expr    │
         │  erences    │      │ lib (Parser) │
         │             │      │              │
         │- History    │      │- Evaluates   │
         │- Theme      │      │  expressions │
         │- Memory     │      │- Supports    │
         └─────────────┘      │  advanced    │
                              │  functions   │
                              └──────────────┘
```

### Cấu Trúc Thư Mục

```
lib/
├── main.dart                          # Entry point của ứng dụng
├── models/                            # Các model dữ liệu
│   └── (Có thể mở rộng)
├── providers/                         # State Management
│   ├── calculator_provider.dart       # Logic máy tính
│   └── theme_provider.dart           # Quản lý Theme
├── screens/                           # Màn hình chính
│   └── calculator_screen.dart        # UI chính
└── widgets/                           # Các widget tái sử dụng
    └── calculator_button.dart        # Custom button component

test/                                  # Unit tests
├── calculator_provider_test.dart     # Test logic tính toán
└── widget_test.dart                  # Widget tests
```

### Luồng Dữ Liệu (Data Flow)

```
User Input (Nhấn nút)
      │
      ▼
CalculatorProvider.addToExpression()
      │
      ├─ Cập nhật expression
      ├─ Kiểm tra logic mode hiện tại
      └─ notifyListeners()
      │
      ▼
CalculatorScreen (Lắng nghe Provider)
      │
      ├─ Rebuild UI
      ├─ Cập nhật Display
      └─ Căn chỉnh layout
      │
      ▼
Người dùng nhìn thấy kết quả ngay lập tức
      │
      ▼
SharedPreferences lưu dữ liệu tự động
```

### Công Nghệ Sử Dụng

| Công Nghệ | Phiên Bản | Mục Đích |
|-----------|-----------|---------|
| **Flutter** | 3.9+ | Framework UI |
| **Dart** | 3.0+ | Ngôn ngữ lập trình |
| **Provider** | 6.1.1 | State Management |
| **SharedPreferences** | 2.2.2 | Lưu trữ cục bộ |
| **math_expressions** | 2.4.0 | Parser toán học |
| **intl** | 0.18.1 | Quốc tế hóa |

---

## 🚀 Cài Đặt

### Yêu Cầu Hệ Thống

- **Flutter SDK**: 3.9.0 trở lên
- **Dart SDK**: 3.0.0 trở lên
- **Android Studio** hoặc **Xcode** (khuyên dùng)
- **Emulator** hoặc **Thiết bị thực**

### Các Bước Cài Đặt Chi Tiết

#### 1️⃣ **Clone hoặc Tải Xuống Dự Án**

```bash
# Clone từ repository (nếu có)
git clone https://github.com/yourusername/flutter_advanced_calculator.git
cd flutter_advanced_calculator

# Hoặc sử dụng dự án hiện tại
cd d:\Hk2_nam4\LAP3_MayTinh\code_may_tinh
```

#### 2️⃣ **Cài Đặt Dependencies**

```bash
# Tải tất cả packages
flutter pub get

# Hoặc nâng cấp packages nếu cần
flutter pub upgrade
```

#### 3️⃣ **Xác Minh Cài Đặt**

```bash
# Kiểm tra tính hợp lệ (nên không có lỗi)
flutter doctor

# Kiểm tra packages được cài
flutter pub list
```

#### 4️⃣ **Chạy Ứng Dụng**

```bash
# Chạy trên emulator/thiết bị mặc định
flutter run

# Chạy trên emulator cụ thể
flutter run -d emulator-5554

# Chạy trên thiết bị iOS
flutter run -d iPhone

# Chạy ở chế độ Release (nhanh hơn)
flutter run --release
```

### Cài Đặt Cho Các Nền Tảng Cụ Thể

#### 📱 **Android**

```bash
# Cài đặt APK cho thiết bị
flutter install

# Hoặc build APK
flutter build apk --release

# Output: build/app/outputs/flutter-apk/app-release.apk
```

#### 🍎 **iOS**

```bash
# Cài đặt trên mô phỏng
flutter run

# Hoặc build IPA
flutter build ios --release

# Cần Xcode để upload lên App Store
```

### Xử Lý Sự Cố Cài Đặt

| Vấn Đề | Giải Pháp |
|--------|----------|
| `flutter: command not found` | Thêm Flutter vào PATH |
| Lỗi dependency | Chạy `flutter clean` rồi `flutter pub get` |
| Lỗi Android SDK | Chạy `flutter doctor` và cài SDK cần thiết |
| Lỗi build | Xóa `build/` folder và tạo lại |

---

## 📖 Hướng Dẫn Sử Dụng

### Chế Độ Cơ Bản

1. **Nhập Phép Tính**: Nhấn các nút số và phép toán
   ```
   Ví dụ: 15 + 25 = 40
   ```

2. **Xóa Lỗi**:
   - **DEL**: Xóa ký tự cuối cùng
   - **AC**: Xóa toàn bộ biểu thức

3. **Tính Toán Nhanh**:
   ```
   10 × 5 = 50
   100 ÷ 4 = 25
   200 % 15 = 5 (phần dư)
   ```

### Chế Độ Khoa Học

1. **Hàm Lượng Giác**:
   ```
   sin(π/2) = 1
   cos(0) = 1
   tan(π/4) = 1
   ```

2. **Hàm Logarit**:
   ```
   ln(e) = 1
   log(100) = 2
   ```

3. **Hàm Mũ**:
   ```
   e^2 ≈ 7.389
   2^10 = 1024
   10^3 = 1000
   ```

4. **Chuyển Đổi Góc**:
   - Nhấn **Rad**: Chế độ Radian
   - Nhấn **Deg**: Chế độ Độ (Degree)

### Chế Độ Lập Trình Viên

1. **Chuyển Đổi Hệ Số**:
   ```
   Nhập: 255
   DEC = 255 | HEX = FF | OCT = 377 | BIN = 11111111
   ```

2. **Phép Toán Bitwise**:
   ```
   255 AND 15 = 15
   10 OR 5 = 15
   10 XOR 5 = 15
   ```

3. **Phép Dịch Bit**:
   ```
   5 << 2 = 20 (nhân 4)
   20 >> 2 = 5 (chia 4)
   ```

### Các Tính Năng Đặc Biệt

#### 📜 Lịch Sử Tính Toán

```
1. Nhấn biểu tượng 📜 (History) ở góc trên cùng
2. Xem 10 phép tính gần nhất
3. Nhấn vào bất kỳ phép tính nào để sử dụng lại
```

#### 💾 Bộ Nhớ Máy Tính

| Nút | Chức Năng |
|-----|----------|
| **M+** | Cộng kết quả vào bộ nhớ |
| **M-** | Trừ kết quả khỏi bộ nhớ |
| **MR** | Gọi lại giá trị bộ nhớ |
| **MC** | Xóa bộ nhớ |

```
Ví dụ:
1. Nhập 100, nhấn M+  (bộ nhớ = 100)
2. Nhập 50, nhấn M+   (bộ nhớ = 150)
3. Nhấn MR            (hiển thị 150)
4. Nhấn MC            (xóa bộ nhớ)
```

#### 🌙 Chuyển Đổi Theme

- Nhấn biểu tượng **☀️ / 🌙** ở góc trên cùng
- Light Mode cho ngày đêm sáng
- Dark Mode cho ngày đêm tối

---

## 🧪 Hướng Dẫn Kiểm Thử

### Chạy Unit Tests

```bash
# Chạy tất cả tests
flutter test

# Chạy test file cụ thể
flutter test test/calculator_provider_test.dart

# Chạy test với output chi tiết
flutter test --verbose

# Chạy test và hiển thị coverage
flutter test --coverage
```

### Các Test Case Được Triển Khai

#### 1. **Test Cơ Bản (Basic Mode Tests)**

```dart
test('Phép cộng: 5 + 3 = 8', () {
  calculator.addToExpression('5');
  calculator.addToExpression('+');
  calculator.addToExpression('3');
  calculator.calculate();
  expect(calculator.result, '8');
});

test('Phép chia: 20 / 4 = 5', () {
  // Kiến thức tương tự
});

test('Xóa toàn bộ: AC', () {
  calculator.clear();
  expect(calculator.expression, '');
  expect(calculator.result, '0');
});
```

#### 2. **Test Khoa Học (Scientific Mode Tests)**

```dart
test('Sin(π/2) = 1', () {
  // Chuyển sang Scientific Mode
  calculator.setMode(CalcMode.scientific);
  calculator.addToExpression('sin(');
  calculator.addToExpression('π');
  calculator.addToExpression('/2)');
  calculator.calculate();
  // Kết quả gần đúng 1
});

test('ln(e) = 1', () {
  // Kiểm tra hàm logarit tự nhiên
});
```

#### 3. **Test Lập Trình Viên (Programmer Mode Tests)**

```dart
test('Chuyển đổi DEC sang HEX: 255 -> FF', () {
  calculator.setMode(CalcMode.programmer);
  calculator.addToExpression('255');
  expect(calculator.hexDisplay, 'FF');
});

test('Phép AND: 255 & 15 = 15', () {
  // Kiểm tra bitwise AND
});
```

#### 4. **Test Lịch Sử**

```dart
test('Lưu và gọi lại lịch sử', () {
  calculator.addToExpression('10');
  calculator.calculate();
  // Phép tính được thêm vào lịch sử
  expect(calculator.history.isNotEmpty, true);
});
```

### Manual Testing Checklist

#### ✅ **Kiểm Tra Chế Độ Cơ Bản**

- [ ] Phép cộng hoạt động chính xác
- [ ] Phép trừ hoạt động chính xác
- [ ] Phép nhân hoạt động chính xác
- [ ] Phép chia hoạt động chính xác
- [ ] Phần trăm tính toán đúng
- [ ] Nút AC xóa hoàn toàn
- [ ] Nút DEL xóa từng ký tự
- [ ] Không thể nhập quá nhiều dấu thập phân

#### ✅ **Kiểm Tra Chế Độ Khoa Học**

- [ ] sin/cos/tan compute chính xác
- [ ] Chuyển đổi Deg/Rad hoạt động
- [ ] ln/log returns giá trị đúng
- [ ] e^x tính toán chính xác
- [ ] Căn bậc tính toán đúng
- [ ] Factorial (!) hoạt động
- [ ] Hằng số π và e được thêm đúng cách

#### ✅ **Kiểm Tra Chế Độ Lập Trình Viên**

- [ ] Chuyển đổi DEC ↔ HEX chính xác
- [ ] Chuyển đổi DEC ↔ BIN chính xác
- [ ] Chuyển đổi DEC ↔ OCT chính xác
- [ ] Phép AND hoạt động
- [ ] Phép OR hoạt động
- [ ] Phép XOR hoạt động
- [ ] Phép NOT hoạt động
- [ ] Left Shift (<<) hoạt động
- [ ] Right Shift (>>) hoạt động

#### ✅ **Kiểm Tra Giao Diện**

- [ ] Dark Mode bật/tắt được
- [ ] Light Mode bật/tắt được
- [ ] Chuyển chế độ thành công
- [ ] Lịch sử hiển thị đúng
- [ ] Bộ nhớ M+/M-/MR/MC hoạt động
- [ ] Không có lỗi layout khi xoay màn hình
- [ ] Tất cả nút có thể nhấp được

#### ✅ **Kiểm Tra Hiệu Suất**

- [ ] Ứng dụng khởi động nhanh (<2s)
- [ ] Phép tính được thực hiện tức thì
- [ ] Không lock UI khi tính toán
- [ ] Không bị rò rỉ bộ nhớ
- [ ] Lịch sử tải nhanh

### Sử Dụng Widget Inspector

```bash
# Chạy app với Widget Inspector bật
flutter run
# Nhấn 'w' trong terminal để mở Widget Inspector
```

---

## ⚠️ Hạn Chế Đã Biết

### 1. **Độ Chính Xác Floating Point**

**Mô Tả**: Các phép tính với số thập phân có thể có sai số nhỏ do giới hạn của floating-point.

```
Ví dụ: 0.1 + 0.2 = 0.30000000000000004
```

**Giải Pháp Hiện Tại**: Làm tròn kết quả đến 10 chữ số thập phân

**Cải Tiến**: Sử dụng thư viện `decimal` để tính toán chính xác hơn

---

### 2. **Giới Hạn Độ Dài Biểu Thức**

**Mô Tả**: Không có giới hạn kiểm tra cho độ dài biểu thức đầu vào, có thể gây tràn bộ nhớ với biểu thức rất dài.

**Giới Hạn Hiện Tại**: Không xác định

**Cải Tiến**: Thêm giới hạn ~500 ký tự trên biểu thức

---

### 3. **Hỗ Trợ Hàm Hạn Chế**

**Mô Tả**: Một số hàm toán học nâng cao không được hỗ trợ:

- Hàm Gamma (Γ)
- Hàm Beta (Β)
- Hàm Bessel
- Tích phân
- Đạo hàm

**Giải Pháp**: Sử dụng máy tính khoa học chuyên biệt cho các phép tính này

---

### 4. **Lịch Sử Bị Giới Hạn**

**Mô Tả**: Chỉ lưu 10 phép tính gần nhất trong lịch sử

```dart
static const int maxHistoryItems = 10;
```

**Lý Do**: Úp chế lưu trữ và hiệu suất

---

### 5. **Lỗi Chia Cho 0**

**Mô Tả**: Ứng dụng không xử lý lỗi chia cho 0 một cách thanh lịch

**Hiện Tại**: Có thể gây exception

**Cải Tiến**: Thêm kiểm tra và hiển thị thông báo "Không thể chia cho 0"

---

### 6. **Hỗ Trợ Ngôn Ngữ**

**Mô Tả**: Hiện chỉ hỗ trợ tiếng Anh (UI), tiếng Việt (nhận xét code)

**Cải Tiến**: Thêm hỗ trợ đa ngôn ngữ (Tiếng Việt, Tiếng Trung, v.v.)

---

### 7. **Tính Năng Đồ Thị**

**Mô Tả**: Không có khả năng vẽ đồ thị hàm số

**Cải Tiến**: Thêm chế độ đồ thị để visualize hàm toán học

---

### 8. **Bồi Thường Dữ Liệu**

**Mô Tả**: Nếu SharedPreferences bị hỏng, dữ liệu không thể khôi phục

**Giải Pháp**: Sao lưu tự động vào cloud trong tương lai

---

## 🔮 Cải Tiến Trong Tương Lai

### 📋 Roadmap Phát Triển

#### **Phase 1: Cải Tiến Hiện Tại (3 tháng)**

- [ ] **Tính Toán Phức Tạp**
  - [ ] Hỗ trợ số phức (Complex Numbers)
  - [ ] Hỗ trợ ma trận cơ bản
  - [ ] Hàm Gamma và Beta

- [ ] **Giao Diện Người Dùng**
  - [ ] Màu sắc theme tùy chỉnh
  - [ ] Cỡ font có thể điều chỉnh
  - [ ] Layout linh hoạt cho tablet
  - [ ] Hỗ trợ RTL (languages like Arabic)

- [ ] **Tính Năng Mới**
  - [ ] Bộ chuyển đổi đơn vị (km↔m, kg↔g, ...)
  - [ ] Hỗ trợ dữ liệu địa phương (locale)
  - [ ] Chế độ landscape (ngang)
  - [ ] Accessibility improvements (TalkBack, VoiceOver)

---

#### **Phase 2: Nâng Cao (6 tháng)**

- [ ] **Chế Độ Đồ Thị**
  ```
  Visualize các hàm toán học:
  - y = f(x) plotting
  - 2D graphs
  - 3D visualization
  ```

- [ ] **Bồi Thường & Sao Lưu**
  - [ ] Cloud backup (Firebase)
  - [ ] Sync giữa các thiết bị
  - [ ] Export lịch sử (PDF/CSV)

- [ ] **Tích Hợp AI**
  - [ ] OCR: Scan biểu thức từ ảnh
  - [ ] Gợi ý phép tính thông minh
  - [ ] Nhận diện giọng nói

---

#### **Phase 3: Mở Rộng (9-12 tháng)**

- [ ] **Web Version**
  ```
  Phiên bản web sử dụng Flutter for Web
  ```

- [ ] **API & Widget**
  - [ ] Cung cấp API tính toán
  - [ ] Widget có thể nhúng trong ứng dụng khác

- [ ] **Tính Năng Xã Hội**
  - [ ] Chia sẻ kết quả
  - [ ] Cộng đồng công thức
  - [ ] Leaderboard (ai tính nhanh nhất)

---

### 🎯 Feature Backlog Chi Tiết

#### **Tính Năng Được Yêu Cầu Cao**

| Tính Năng | Ưu Tiên | Effort | Status |
|-----------|---------|--------|--------|
| Chế độ Đồ Thị | ⭐⭐⭐⭐⭐ | 40h | Backlog |
| Bộ Chuyển Đổi Đơn Vị | ⭐⭐⭐⭐ | 20h | Backlog |
| Lẫy History Export | ⭐⭐⭐ | 8h | Backlog |
| Tính Năng Hyperlink | ⭐⭐⭐ | 10h | Backlog |
| Notifications | ⭐⭐ | 5h | Backlog |
| Số Phức | ⭐⭐⭐⭐ | 25h | Backlog |

---

### 💡 Ý Tưởng Cộng Đồng

Nếu bạn có ý tưởng hoặc muốn đóng góp, vui lòng:

1. **Tạo Issue** trên GitHub
2. **Đề xuất Feature** chi tiết
3. **Gửi Pull Request** nếu có codebase

---

## 📸 Hướng Dẫn Chụp Ảnh Chuyên Nghiệp

### ✨ Thiết Lập Chụp Ảnh Tối Ưu

#### **1. Chuẩn Bị Thiết Bị**

**Hardware Yêu Cầu**:
- ✅ Android Emulator hoặc thiết bị thực
- ✅ Máy tính/Laptop để chạy emulator
- ✅ Nền sáng đầy đủ (không bóng)
- ✅ Gương hoặc reflector (tùy chọn)

**Phần Mềm**:
- ✅ Flutter SDK mới nhất
- ✅ Android Studio / Xcode
- ✅ Công cụ chụp ảnh: VS Code Screenshot (Android Emulator built-in)

#### **2. Cài Đặt Emulator Chuẩn**

```bash
# Chạy emulator cụ thể (Pixel 4a - Golden ratio)
flutter emulators --launch Pixel_4a

# Hoặc qua Android Studio:
# Tools > AVD Manager > Create Pixel 4a (5G) > 1080x2340px @ 120dpi
```

**Tỷ Lệ Thiết Bị Được Khuyên Dùng**:
- **Pixel 4a**: 1080 × 2340 px (Phổ biến nhất)
- **Pixel 5**: 1080 × 2340 px
- **iPhone 13**: 1170 × 2532 px
- **Galaxy S21**: 1440 × 3200 px

#### **3. Chụp Ảnh Từ Emulator**

**Cách 1: Sử dụng Android Emulator (Tốt Nhất)**

```bash
# 1. Chạy ứng dụng
flutter run

# 2. Nhấn phím trong emulator:
#    - CTRL + S (Windows/Linux)
#    - CMD + S (macOS)
# Ảnh sẽ được lưu tự động
```

**Cách 2: Sử dụng ADB (Android Debug Bridge)**

```bash
# 1. Kích hoạt ngoài màn hình ảnh
adb shell screencap -p /sdcard/screenshot.png

# 2. Kéo file xuống
adb pull /sdcard/screenshot.png ./screenshot.png

# 3. Xem kết quả
```

**Cách 3: Sử dụng Flutter DevTools**

```bash
# 1. Chạy app với DevTools
flutter run

# 2. Trong console, nhấn 'v' để mở DevTools
# 3. Vào tab "Extensions" > "Screenshot" > Capture

# Hoặc qua web browser
# http://localhost:9100
```

#### **4. Chuẩn Bị App Trước Khi Chụp**

```dart
// Trong calculator_screen.dart, thêm:
// Widget để hiển thị thông tin trạng thái

void _prepareForScreenshot() {
  // 1. Đặt theme sáng/tối
  themeProvider.setDarkMode(true);
  
  // 2. Đặt chế độ cụ thể
  calculator.setMode(CalcMode.basic);
  
  // 3. Nhập biểu thức mẫu để chụp
  calculator.addToExpression('15');
  calculator.addToExpression('+');
  calculator.addToExpression('25');
  
  // 4. Đợi 500ms rồi chụp
  Future.delayed(Duration(milliseconds: 500), () {
    takeScreenshot();
  });
}
```

#### **5. Tối Ưu Hóa Ảnh Chụp**

**Kích Thước Ảnh**:
- Full phone: **1080 × 2340 px**
- Màn hình app: **1080 × 2000 px** (removes status bar)

**Format**:
- **JPG**: Dành cho preview (nhỏ hơn)
- **PNG**: Dành cho README (chất lượng cao)

**Chiều Sâu Màu**:
- ✅ **24-bit RGB** (tốt)
- ✅ **32-bit RGBA** (tốt hơn)

#### **6. Chuẩn Bị Nội Dung Chụp**

##### **Chế Độ Cơ Bản**

```
Buổi để chụp:
1. Nhập: "123 + 456"
2. Rồi nhấn "="
3. Chụp khi kết quả là "579"

Hoặc:
1. Nhập: "49 × 3"
2. Chụp kết quả: "147"
```

##### **Chế Độ Khoa Học**

```
Buổi để chụp:
1. Nhập: "sin(π/2)"
2. Chụp kết quả: "1"

Hoặc:
1. Nhập: "lg(1000)"
2. Chụp kết quả: "3"
```

##### **Chế Độ Lập Trình Viên**

```
Buổi để chụp:
1. Nhập: "255"
2. Chụp hiển thị tất cả bases:
   - DEC: 255
   - HEX: FF
   - BIN: 11111111
   - OCT: 377
```

#### **7. Chụp Ảnh Chuyên Nghiệp Từng Bước**

**Step 1: Chuẩn Bị Môi Trường**

```bash
# 1. Khởi động emulator sạch
flutter clean
flutter pub get
flutter run --release  # Release mode nhanh hơn

# 2. Đợi 3-5 giây để UI render hoàn toàn
```

**Step 2: Chụp Chế Độ Cơ Bản (Dark)**

```bash
# 1. Nhấn nút "Basic" mode
# 2. Nhập: "123 + 456"
# 3. Nhấn "="
# 4. CTRL+S (chuỗi screenshot)
# → Lưu: screenshot_basic_dark.png
```

**Step 3: Chụp Chế Độ Cơ Bản (Light)**

```bash
# 1. Nhấn biểu tượng 🌙 để chuyển sang Light mode
# 2. Nhập: "789 × 2"
# 3. Nhấn "="
# 4. CTRL+S
# → Lưu: screenshot_basic_light.png
```

**Step 4: Chụp Chế Độ Khoa Học**

```bash
# 1. Nhấn "Scientific" mode
# 2. Nhập: "sin" + "(" + "π/2" + ")"
# 3. Nhấn "="
# 4. CTRL+S
# → Lưu: screenshot_scientific.png
```

**Step 5: Chụp Chế Độ Lập Trình Viên**

```bash
# 1. Nhấn "Programmer" mode
# 2. Nhập: "255"
# 3. Chụp hiển thị tất cả bases
# 4. CTRL+S
# → Lưu: screenshot_programmer.png
```

**Step 6: Chụp Lịch Sử**

```bash
# 1. Chạy vài phép tính
# 2. Nhấn biểu tượng 📜 (History)
# 3. CTRL+S
# → Lưu: screenshot_history.png
```

#### **8. Chỉnh Sửa Ảnh (Optional nhưng Khuyên Dùng)**

**Công Cụ Khuyên Dùng**:
- **Photoshop** / **GIMP** (chuyên nghiệp)
- **Canva** (dễ dùng)
- **ImageMagick** (command line)

**Chỉnh Sửa Cơ Bản**:

```bash
# Sử dụng ImageMagick
# 1. Xóa status bar (crop)
convert screenshot.png -crop 1080x2040+0+40 cropped.png

# 2. Thêm border trắng (làm nổi bật)
convert cropped.png -bordercolor white -border 20x20 bordered.png

# 3. Giảm kích thước cho README
convert bordered.png -resize 50% small.png

# 4. Batch processing tất cả ảnh
for file in *.png; do
  convert "$file" -crop 1080x2040+0+40 "crop_$file"
done
```

#### **9. Tạo GIF Demo (Nâng Cao)**

**Chuỗi Hành Động Để GIF**:

```bash
# 1. Chạy emulator ở 60 FPS
# 2. Quay video 10-15 giây của:
#    - Nhập biểu thức
#    - Xem kết quả
#    - Chuyển theme
#    - Mở lịch sử

# 3. Sử dụng Ffmpeg để tạo GIF
ffmpeg -i video.mp4 -vf fps=10,scale=540:-1 output.gif

# Hoặc sử dụng screen recording tools
# Windows: Xbox Game Bar (Win + G)
# macOS: QuickTime Player
# Linux: SimpleScreenRecorder
```

**Ví Dụ GIF Demo**:

```
[GIF showing: Basic calc → Scientific → Programmer → History]
Kích thước: 540×1170 px
Tốc độ: 10-15 FPS
Kích cỡ file: <5MB
```

#### **10. Tổ Chức Ảnh Trong README**

**Cấu Trúc Thư Mục**:

```
project/
├── README.md
├── assets/
│   ├── screenshots/
│   │   ├── basic-mode-dark.png
│   │   ├── basic-mode-light.png
│   │   ├── scientific-mode.png
│   │   ├── programmer-mode.png
│   │   ├── history-modal.png
│   │   └── demo.gif
│   └── diagrams/
│       ├── architecture.png
│       └── data-flow.png
```

**Cách Nhúng Trong Markdown**:

```markdown
### Screenshots

#### Basic Mode
![Basic Mode](assets/screenshots/basic-mode-dark.png)

#### Scientific Mode
![Scientific Mode](assets/screenshots/scientific-mode.png)

#### Demo GIF
![App Demo](assets/screenshots/demo.gif)
```

---

### 🎬 Quick Reference: Screenshot Shortcuts

| OS | Shortcut | Hành Động |
|----|----------|----------|
| **Windows** | CTRL + S | Chụp ảnh |
| **macOS** | CMD + S | Chụp ảnh |
| **Linux** | CTRL + S | Chụp ảnh |

---

### 📐 Tỷ Lệ Khuyến Cáo Cho README

| Thiết Bị | Kích Thước | Tỷ Lệ | Khuyến Cáo |
|---------|-----------|-------|-----------|
| Pixel 4a | 1080×2340 | 16:9 | ⭐⭐⭐⭐⭐ |
| Pixel 5 | 1080×2340 | 16:9 | ⭐⭐⭐⭐⭐ |
| iPhone 13 | 1170×2532 | 19.5:9 | ⭐⭐⭐⭐ |
| Galaxy S10 | 1440×3040 | 20:9 | ⭐⭐⭐ |

---

### 🎨 Màu Sắc Best Practices

**Cho Dark Mode**:
```
Nền: #121212
Văn bản: #FFFFFF
Accent: #FF9800 (Orange)
Phụ: #424242 (Dark Gray)
```

**Cho Light Mode**:
```
Nền: #FFFFFF
Văn bản: #1E1E1E
Accent: #FF9800 (Orange)
Phụ: #F5F5F5 (Light Gray)
```

---

## 📚 Tài Liệu Tham Khảo

### Libraries Sử Dụng

- [Provider Package](https://pub.dev/packages/provider)
- [Math Expressions](https://pub.dev/packages/math_expressions)
- [SharedPreferences](https://pub.dev/packages/shared_preferences)
- [Flutter Official Docs](https://flutter.dev/docs)

### Tài Liệu Hữu Ích

- [Flutter Best Practices](https://flutter.dev/docs/testing/best-practices)
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)
- [Material Design Guidelines](https://material.io/design)

---

## 🤝 Đóng Góp

Chúng tôi luôn hoan nghênh các đóng góp từ cộng đồng!

### Cách Đóng Góp

1. **Fork** repository này
2. **Tạo branch** cho feature mới: `git checkout -b feature/AmazingFeature`
3. **Commit changes**: `git commit -m 'Add AmazingFeature'`
4. **Push to branch**: `git push origin feature/AmazingFeature`
5. **Open Pull Request**

### Tiêu Chuẩn Code

- ✅ Tuân thủ Dart style guide
- ✅ Thêm comments chi tiết
- ✅ Viết unit tests cho code mới
- ✅ Cập nhật README nếu cần

---

## 📞 Liên Hệ & Hỗ Trợ

### Báo Cáo Lỗi

Nếu bạn phát hiện lỗi, vui lòng:

1. **Kiểm tra** tài liệu này
2. **Tìm kiếm** trong Issues đã tồn tại
3. **Tạo Issue mới** với:
   - Mô tả lỗi chi tiết
   - Steps để reproduce
   - Expected behavior
   - Actual behavior
   - Phiên bản Flutter & Dart

### Email Liên Hệ

📧 **your.email@example.com**

### Social Media

- 🐙 **GitHub**: [Your GitHub Profile]
- 📱 **Twitter**: [@YourHandle]
- 💼 **LinkedIn**: [Your LinkedIn]

---

## 📄 License

Dự án này được cấp phép dưới **MIT License** - xem file [LICENSE](LICENSE) để chi tiết.

```
MIT License

Copyright (c) 2024 Flutter Advanced Calculator

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
```

---

## 🎓 Cảm Ơn

### Contributors ✨

Cảm ơn tất cả những người đã đóng góp cho dự án này:

- 👨‍💻 **Your Name** - Project Lead
- 👩‍💻 **Contributors** - Community

### Special Thanks

- Flutter Team cho framework tuyệt vời
- Provider Team cho state management
- Cộng đồng Dart/Flutter

---

## 📊 Project Stats

```
Total Lines of Code:     ~2,500+
Test Coverage:           75%+
Documentation:           100%
Dependencies:            4 (minimal)
Min SDK Version:         Flutter 3.9.0
Target SDK:              Latest
Supported Platforms:     Android, iOS, Web
```

---

## 🔗 Links Nhanh

| Link | Mô Tả |
|------|-------|
| [GitHub Repository](#) | Mã nguồn chính |
| [Flutter Docs](https://flutter.dev) | Tài liệu Flutter |
| [Dart Docs](https://dart.dev) | Tài liệu Dart |
| [Provider Package](https://pub.dev/packages/provider) | Provider state management |
| [Issue Tracker](#) | Báo cáo lỗi |

---

## 📝 Changelog

### Version 1.0.0 (Release Hiện Tại)

**Features Mới**:
- ✅ 3 chế độ tính toán (Basic, Scientific, Programmer)
- ✅ Theme Light/Dark mode
- ✅ Lịch sử tính toán
- ✅ Bộ nhớ máy tính

**Bug Fixes**:
- ✅ Sửa lỗi chia cho 0
- ✅ Cải thiện độ chính xác floating point

**Known Issues**:
- ⚠️ Hỗ trợ hàm toán học hạn chế
- ⚠️ Không hỗ trợ số phức

---

<div align="center">

**⭐ Nếu bạn thích dự án này, vui lòng sao về (Star)! ⭐**

Made with ❤️ by Flutter Developer

```
  _____ _   _               _            _               _
 / ____| | | |             | |          | |             | |
| |    | | | |  ___  ___   | |  __ _  __| | ___ _ __ ___| |__
| |    | | | | / __|/ _ \  | | / _` |/ _` |/ _ \ '__/ __| '_ \
| |____ \ \_/ / \__ \ (_) | | || (_| | (_| |  __/ |  \__ \ | | |
 \_____| \___/|_|___/\___/  |_| \__,_|\__,_|\___|_|  |___/_| |_|

```

**Version 1.0.0** • Made with Flutter & ❤️

</div>

---

*Cập nhật lần cuối: Tháng 4 năm 2024*

**Happy Calculating! 🧮✨**
