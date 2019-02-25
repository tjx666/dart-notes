/**
 * 函数部分二
 */

// --------------------- 函数也是对象 ----------------------------
void testFunctionAsObject() {
  // 匿名函数作为对象参数, 本质是 Function 类的实例
  [1, 2, 3].forEach((ele) => print(ele)); // 换行输出 1, 2, 3
  
  void innerFunction() {
    print('函数内部的函数');
  }

  // 函数还可以赋值给变量
  final funcVar = innerFunction;
  funcVar(); // => 函数内部的函数
}

void main() {
  testFunctionAsObject();
}