/**
 * Dart 内建类型
 * numbers
 * strings
 * booleans
 * lists (also known as arrays)
 * maps
 * runes (for expressing Unicode characters in a string)
 * symbols
 */

// Numbers 数字类
void main() {
  // testNumbers();
  // testBoolean();
  testRunes();
}

// String 类型
void testBoolean() {
  // 在 Dart 所有的对象中,类型为 bool 的只有 true/false, 其实也就是运用了单例的设计模式
  // Dart 是类型安全的语言, 不像 javascript 在需要一个 bool 类型时, 会自动将传的非 bool 值自动转换成 bool 类型
  // if (1) { // A value of type 'int' can't be assigned to a variable of type 'bool'.
  //   print('...');
  // }

  // Check for an empty string.
  var fullName = '';
  assert(fullName.isEmpty);

  // Check for zero.
  var hitPoints = 0;
  assert(hitPoints <= 0);

  // Check for null.
  var unicorn;
  assert(unicorn == null);

  // Check for NaN.
  var iMeantToDoThis = 0 / 0;
  assert(iMeantToDoThis.isNaN);

  print(1.isNaN); // false
}

// Booleans 类型
/**
 * 主要包括两种类型, int 和 double, 即整形和浮点型, 两者都继承自 num 类型
 * int 类型的长度是不确定的, 在 Dart 虚拟机上是  -263 to 263 - 1, 编译为 javascript 时 253 to 253 - 1
 * double 遵循 IEEE754标准
 */
void testNumbers() {
  // int 表示整形数
  int decimalInteger = 10;
  // int binaryInteger = 0b10; // 不支持二进制格式
  // 可以使用 16 进制
  int hexInteger = 0x10;

  // doucle 表示浮点数
  double PI = 3.1159265457;
  print(0.1 + 0.2 == 0.3); // false

  // 测试一下 num
  num number = 1;
  // num 类作为 int 和 double 的父类, 定义了一些公共的方法, 比如 +, -, *, /
  number++;
  // 位移操作只是 num 的子类 int 定义了
  // number << 2; // Error: The method '<<' isn't defined for the class 'num'.

  // Dart2 支持隐式类型转换
  double d = 1; // dart 1 报错

  // numbers 类型和 String 类型之间的转换
  // numbers => String
  assert(1111.toString() == '1111');
  // String => numbers
  assert(1024 == int.parse('1024'));

  // 测试API
  // 判断类型
  print(number.isNaN); // false
  // 判断是否有限
  print(number.isFinite); // true
  print(number.isInfinite); // false
  // 判断是否为负数
  print(number.isNegative); // false
  print((-1).isNegative); // true
  print(0.isNegative); // false

  // 绝对值
  print((-10).abs()); // 10
  // 下面俩方法继承自 num 类型
  print(number.ceil()); // 2
  print(number.floor()); // 2
  print(1.3.ceil()); // 2
  print(1.8.floor()); // 1
  // 直接砍掉小数部分
  print(3.14159.truncate()); // 3
  // 四舍五入
  print(9.4.round()); // 9
  print(6.5.round()); // 77
  // 转换成浮点数
  print(number.truncateToDouble()); // 2.0
  print(3.14.roundToDouble()); // 3.0
  print(6.25.toInt()); // 6
  // 这个不知道中文怎么说, 在范围内返回本身, 不在范围内返回最接近的那个值,
  // 应该说就是取范围内最靠近给定值的值
  print(5.5.clamp(5, 8));
}

// runes utf-32 字符
void testRunes() {
  // 做个测试
  const testStr = '💔';
  for (var i = 0; i < testStr.length; i++) {
    print('Line $i: ${testStr[0]}');
  }
  // 结果, 32 位字符被识别为两个字符
  /*
    Line 0: ���
    Line 1: ���
  */

  // dart 中表示unicode字符的方式使用 \u{codePoint}
  print('\u{1f600}'); // 😀
  print(testStr.runes.toList().length); // 1

  Runes input = new Runes(
      '\u2665  \u{1f605}  \u{1f60e}  \u{1f47b}  \u{1f596}  \u{1f44d}');
  print(new String.fromCharCodes(input));
  // ♥  😅  😎  👻  🖖  👍
}

// Symbol 类
// A Symbol object represents an operator or identifier declared in a Dart program. You might never need to use symbols, but they’re invaluable for APIs that refer to identifiers by name, because minification changes identifier names but not identifier symbols.

// To get the symbol for an identifier, use a symbol literal, which is just # followed by the identifier:

// #radix
// #bar
// Symbol literals are compile-time constants.
