/**
 * 多行注释
 * With features aimed at client-side development,
 * Dart is a great fit for both mobile and web apps.
 */

// 单行注释
// 可以在类外定义函数和变量，非完全的面向对象
printInteger(int aNumber) {
  // 字符串插值语法，既可以用 $Variable 也可以用 ${Variable} 形式
  // 字符串可以用单引号，也可以用双引号
  // print 是一个方便的输出函数
  print('The number is $aNumber.'); // Print to console.
}

// This is where the app starts executing.
// 和其它语言一样的顶级函数
main() {
  // Var is a way to declare a variable without specifying its type.
  var number = 42; // Declare and initialize a variable.
  printInteger(number); // Call a function.
}
