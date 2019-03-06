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
  print(testStr
      .codeUnits); // [104, 101, 108, 108, 111, 32, 119, 111, 114, 108, 100]

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
  print('Dart is a awful language'
      .replaceAll('awful', 'awesome')); // Dart is a awesome language

  // 拆分
  print('Miscrosoft, Google, IBM'.split(', ')); // [Miscrosoft, Google, IBM]
}


void main() {
  testString();
}