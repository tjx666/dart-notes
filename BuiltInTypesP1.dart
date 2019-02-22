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
  testString();
  // testBoolean();
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

void testString() {
  // Dart 中字符串既可以用单引号也可以用双引号
  var s1 = 'Single quotes work well for string literals.';
  var s2 = "Double quotes work just as well.";
  var s3 = 'It\'s easy to escape the string delimiter.';
  var s4 = "It's even easier to use the other delimiter.";

  // 字符串插值 ${expression}, 如果花括号内只是标识符, 可以不写花括号
  const userName = 'YuTengjing';
  print('$userName is ${20 + 2} years old'); // YuTengjing is 22 years old

  // 拼接字符串还可以使用分离的字符串或者直接使用 +
  const adjacentString = '这是一段比较长的字符串'
      "你可以直接换行写"
      '本质上还是一行';
  print(adjacentString); // 这是一段比较长的字符串你可以直接换行写本质上还是一行
  print('PI is' + '3.14159265457');

  // Dart 中也有类似 javascript 的多行字符串, 使用三个单引号或双引号括起来
  print('''床前明月光，
疑是地上霜。
举头望明月，
低头思故乡。''');

  // 可以使用 r(raw) 前缀表示原生字符串
  print(r'\n\t\b'); // \n\t\b

  // 字符串常量
  // 所有的字符串字面值都是编译时常量
  const heartWords = 'I used to love dsy, but...';

  // 下面是个官方文档的例子
  // These work in a const string.
  const aConstNum = 0;
  const aConstBool = true;
  const aConstString = 'a constant string';

// These do NOT work in a const string.
/*
 * Literal strings are compile-time constants, 
 * as long as any interpolated expression is a compile-time constant
 * that evaluates to null or a numeric, string, or boolean value.
 */
  var aNum = 0;
  var aBool = true;
  var aString = 'a string';
  const aConstList = [1, 2, 3];

  // Dart 插件有错误提示, 但是运行是非常正常的运行了, 有点异常信息都没有
  // const validConstString = '$aConstNum $aConstBool $aConstString $aConstList';
  // print(validConstString); // 0 true a constant string [1, 2, 3]
  // const invalidConstString = '$aNum $aBool $aString $aConstList'; // Error: Not a constant expression.

  // 测试 String API
  const testStr = 'hello world';

  // 可以通过下标访问 dart 字符串中的字符

  // 获取长度
  print(testStr.length);

  // 判断是否为空
  print(testStr.isEmpty); // false
  print(testStr.isNotEmpty); // true

  // 除空
  assert('  middle  '.trim() == 'middle');
  assert('  lyr'.trimLeft() == 'lyr');
  assert('ytj '.trimRight() == 'ytj');

  // 取子串
  print(testStr.substring(1));
  print(testStr.substring(0, 5));

  // 返回 utf-16 代码单元的码值
  print('A'.codeUnitAt(0)); // 65
  print(testStr.codeUnits); // [104, 101, 108, 108, 111, 32, 119, 111, 114, 108, 100]

  // 判断内容
  print(testStr.contains('world')); // true
  print(testStr.startsWith('hell')); // true
  print(testStr.endsWith('ddd')); // false

  // 和下标有关的
  print(testStr.indexOf('wor')); // 6
  print('YuTengjing lyr dsy lyr'.lastIndexOf('lyr')); // 19

  // 修改字符串的
  print('11'.padLeft(4, '0')); // 0011
  print('password'.padRight(18, '*')); // password**********
  print('Dart is a awful language'.replaceAll('awful', 'awesome')); // Dart is a awesome language
  
  // 拆分
  print('Miscrosoft, Google, IBM'.split(', ')); // [Miscrosoft, Google, IBM]
}
