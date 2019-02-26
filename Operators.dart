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


// --------------------------- 关系运算符 -----------------------------------


void main() {
  testArithmetric();
}
