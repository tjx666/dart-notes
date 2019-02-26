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

void main() {
  // testArithmetric();
  testEqualityAndrelationalOperators();
  
}
