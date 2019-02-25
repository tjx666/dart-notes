import 'package:meta/meta.dart';

/**
 * 函数部分一
 */

// ------------------------- 基础部分 --------------------------
// dart 中一切皆对象, 函数也是对象, 是类 Function 的实例
void sayHello(String name) {
  print('Hello ${name}!');
}

// 其实可以不声明类型, name 为字符串时正常运行, 说明 name 被推断为 dynamic
sayBye(name) {
  print('Bye! ${name}');
  name = 111;
}

// 当函数比较简短时, 使用箭头函数会更简洁, 可读性更高
String reverseStr(String str) => str.split('').reversed.join('');
// 上面的等同于 String reverseStr(String str) { return str.split('').reversed.join(''); }

void testBasic() {
  sayHello('AiLiLy'); // Hello AiLiLy!
  sayBye('lyr...'); // Bye! lyr...
  print(reverseStr('12234567')); // 76543221
}

// --------------------------- 函数参数 --------------------------------
// dart 中函数参数总体上两大类: 必须参数, 可选参数. 可选参数必须在必要参数后面声明

// 参数默认值就是在参数后面使用 =defaultValue 的形式就可以了
// 默认值必须是编译期常量

// 可选参数又分两种, 一种是命名(named)参数, 一种为占位(positional)参数

// 命名参数
/**
 * 命名参数适合参数较多的情况, 形式就是在花括号中声明参数
 */
// 不知道为什么在必要参数不传也不会报错
void enableFlags({@required bool bold, bool hidden = true}) {
  print({'bold': bold, 'hidden': hidden});
}

/**
 * 占位参数, 形式就是在中括号中声明参数
 */
String say(String from, String msg, [String device = 'pc']) {
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device';
  }
  return result;
}

// 一个关于默认参数的复杂的例子
// 其实就是一个特殊的命名参数
void doStuff(
    {List<int> list = const [1, 2, 3],
    Map<String, String> gifts = const {
      'first': 'paper',
      'second': 'cotton',
      'third': 'leather'
    }}) {
  print('list:  $list');
  print('gifts: $gifts');
}

void testOptionalArgs() {
  enableFlags(bold: false, hidden: false); // {bold: false, hidden: false}
  enableFlags(bold: true); // {bold: true, hidden: true}
  // namedFunc(name: 123); // Error: The argument type 'int' can't be assigned to the parameter type 'String'.
  print(say('ly', 'lyd', 'phone')); // ly says lyd with a phone
  print(say('ly', 'htt')); // ly says htt with a pc
  doStuff(
      list: [2, 3, 4],
      gifts: {'first': 'paper', 'second': 'cotton', 'third': 'leather'});
}

// ------------------------- main 函数 ----------------------------
// main 函数在官方文档上是说就是 void 类型, 即没有返回值
// 和很多语言一样, dart 也是以 main 函数作为程序的入口点
// 可以使用一个可选的 List<String> 类型的参数来获取使用 dart 运行程序时传入的参数

void main(List<String> args) {
  // testBasic();
  // testOptionalArgs();
  print(args);
  /*
   * 使用  dart Functions.dart arg1 arg2 运行
   * 输出 => [arg1, arg2]
   */
}
