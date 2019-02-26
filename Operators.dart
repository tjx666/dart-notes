/**
 * 操作符
 */

// dart 可以像 c++ 一样对操作符进行重写
// dart 在使用二元操作符时是取哪一个对象的操作符函数呢? 默认取左边的

// -------------------- 算术运算符 -----------------------
void testArithmetric() {
  final a = 1;
  final b = 2;
  print(a + b); // 3
  print(b - a); // 2
  print(a * b); // 2
  print(a / b); // 0.5
  print(7 % 3); // 1
  // ! 类似于 python 中的地板符 //, 表示结果取整的除运算, 有时候还是挺方便的
  print(5 ~/ 2); // 2
  print(-(-10)); // 减号既可以做一元操作符也可以做二元操作符

  // 前置和后置 ++, -- 操作符
  // 前置和后置的区别在于返回值是不同的, 前置返回加1后的值, 后者返回原来的值
  // 一个常见的考题
  var number = 0;
  for (int index = 0, maxIndex = 100; index < maxIndex; index++) {
    number = number++;
  }
  print(number); // 0

  /*
    number = number++; 发生了啥? 其实拆开来看应该等同于下面地代码:
    tempnumber = number;
    number = number + 1;
    number = tempbumber;
  */
}

// --------------------------- 相等运算符和关系运算符 -----------------------------------
// To test whether two objects x and y represent the same thing, use the == operator.
// (In the rare case where you need to know whether two objects are the exact same object,
// use the identical() function instead.) Here’s how the == operator works:

// If x or y is null, return true if both are null, and false if only one is null.

// Return the result of the method invocation x.==(y).
// (That’s right, operators such as == are methods that are invoked on their first operand.
//  You can even override many operators, including ==, as you’ll see in Overridable operators.)
void testEqualityAndrelationalOperators() {
  // 相等运算符就是 == 和 !=
  print(null == 123); // false
  print('666' == 666); // false
  print(null == null); // true
  print({} == {}); // false
  print([1, 2, 3] == [1, 2, 3]); // false

  // == 判断的是两个比较对象 x, y 是否是同一个东西
  // 判断的具体流程是
  // 1. 先判断两个对象中是否有 null, 如果有, 判断另一个是不是也是 null, 都是 null, 返回 true, 只有一个 null 返回false
  // 2. 如果 1 中没得到结果, 则返回 x.==(y) 的结果, 没错, == 也是一个函数

  // 总的来说, 一般情况是这样的:
  // 字符串和数值型还有, 比较的是内容是否相等, 其它对象一般引用相等才相等, 不过还是得看它内部的 == 操作符是怎样的

  // 关系运算符
  print(1.0 > 1); // false
  // print('short string' <= 'long string'); // Error: The method '<=' isn't defined for the class 'String'.
  print(666 <= 999); // true
  // 测试一个别的语言常见的错误写法, 好像目前我学过的语言里面只有 python 可以
  double goldenRatio = 0.618;
  // print(0.6 < goldenRatio < 1); // Error: An equality expression can't be an operand of another equality expression.
}

// ------------------------ 测试类型 --------------------------------
class Father {
  String name;
}

class Son extends Father {
  int grade;
}

void testType() {
  // 使用 is 来判断左边的对象是否是右侧类的实例或实现了接口
  print('This is a string' is String); // => true
  // is! 和 is 相反, 判断不是右侧类的实例且没有实现了接口
  print(666 is! num); // => false

  // as 用来类型转换的, as 仅当你认为左侧对象确实是右侧类型时使用, 否则会抛异常
  Father f = Son();
  print((f as Son).grade);
  // ('aaa' as Son).grade; // type 'String' is not a subtype of type 'Son' in type cast
}

// -------------------------- 赋值运算符 ---------------------------------
void testAssignmentOperator() {
  // = 就是赋值运算符
  int integer = 666;

  // 类似于 js 中的设置默认值的 hack 方法 v = v || defaultValue.
  // dart 中有 ??=, 那么设置默认值可以写成 v ??= defaultValue
  // ??= 操作符的功能就是当左侧对象不为 null 时, 将右侧的值赋值给左侧
  void printName([String name]) {
    name ??= 'lyreal666';
    print(name);
  }

  printName(); // lyreal666
  printName('htt'); // htt

  int age = 22;
  age ??= 21;
  print(age); // 22

  // 复合赋值运算符
  int res = 10;
  res ~/= 3;
  print(res); // 3
}

// --------------------------- 逻辑运算符 -----------------------------
void testLogicalOperators() {
  // 逻辑运算符就是 true / false 作为操作数的运算符
  print(!false); // true
  print(false || true); // true
  print(true && false); // false
}

void testBitOperators() {
  final value = 0x22;
  final bitmask = 0x0f;

  assert((value & bitmask) == 0x02); // AND
  assert((value & ~bitmask) == 0x20); // AND NOT
  assert((value | bitmask) == 0x2f); // OR
  assert((value ^ bitmask) == 0x2d); // XOR
  assert((value << 4) == 0x220); // Shift left
  assert((value >> 4) == 0x02); // Shift right
}

// ----------------------- 条件运算符 ---------------------------
void testConditionOperators() {
  // 不用条件运算符我们可能会用 if 语句
  String playerName1(String name) {
    if (name != null) {
      return name;
    } else {
      return 'Guest';
    }
  }

  // 使用 3 元条件运算符可以这样
  String playerName2(String name) => name == null ? 'Guest' : name;

  // 使用二元条件运算符, 可以用来给一个变量设默认值
  String playerName3(String name) => name ?? 'Guest';
}

// ------------------------- 级联表示法 ----------------------------------
// 级联表示法, 使用 .. 对一个对象多次操作, 严格来说 .. 操作符并不是一个操作符, 只是一个语法糖
class Node {
  Map<String, String> style;
  List<Node> children;
  double clientHeight;
  double clientWidth;
  void addListener(String eventString, Function callback) {}
}

void testCascadeNotation() {
  Node node = Node()
    ..clientHeight = 200
    ..clientWidth = 50
    ..addListener('click', () => {})
    ..style = {'backgroundColor': 'red'};

  // 级联也可以嵌套, 下面时一个例子
  // final addressBook = (AddressBookBuilder()
  //     ..name = 'jenny'
  //     ..email = 'jenny@example.com'
  //     ..phone = (PhoneNumberBuilder()
  //           ..number = '415-555-0100'
  //           ..label = 'home')
  //         .build())
  //   .build();

  // 级联表示法必须跟在一个对象后面, 下面的例子是一个错误的用法, sb.write('foo') 返回的是 void
  // var sb = StringBuffer();
  // sb.write('foo')
  //   ..write('bar'); // Error: method 'write' isn't defined for 'void'.
}

// -------------------------- 其它操作符 ------------------------------
void testOtherOperators() {
  // 这里只谈 ?. 成员访问符
  Node node;
  print(node?.clientHeight); // => null
  // print(node.clientHeight); // NoSuchMethodError: The getter 'clientHeight' was called on null.
}

void main() {
  // testArithmetric();
  // testEqualityAndrelationalOperators();
  // testType();
  // testAssignmentOperator();
  // testLogicalOperators();
  // testConditionOperators();
  testOtherOperators();
}
