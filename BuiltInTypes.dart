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
}

// String 类型
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
  const validConstString = '$aConstNum $aConstBool $aConstString $aConstList';
  print(validConstString); // 0 true a constant string [1, 2, 3]
// const invalidConstString = '$aNum $aBool $aString $aConstList'; // Error: Not a constant expression.
}

void main() {
  testNumbers();
  testString();
}
