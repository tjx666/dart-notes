/**
 * Dart中的变量
 */

class Student {
  String name;
  int age;
}

main() {
  // ------------------- var --------------------------
  // 使用 var 可以让dart 编译器自动推断变量的类型
  var name = 'YuTengjing';

  // 也可以在声明变量的同时指明具体的类型
  int age = 22;

  print('My name is ${name}, age ${age}');

  // 变量默认值
  // Dart 中所有的变量默认值都是 null
  // 因为在dart 中所有的变量都是指向某个对象，包括数字类型
  int num;
  assert(num == null);

  // ----------------------- final ------------------------
  // Dart 中的 final 和 const
  final lover = 'lyr';
  // lover = 'other'; // Error: Setter not found: 'lover'.
  final stu = new Student();
  // 说明 final 修饰的变量和 java 一样只是不能修改变量的引用
  stu.name = 'YuTengjing';
  

  // ----------------------- const ---------------------------
  // const 在 Dart 中既可以修饰变量，也可以修饰值， 表示一个编译时常量，或者不变值
  const birthday = '11.11';
  // const 修饰的变量，隐式的被 final 修饰
  // birthday = '01.27'; // Error: Setter not found: 'birthday'.

  // const 修饰变量时，同时值也是
  const ls = [1, 2, 3];
  // ls[0] = 2; // Unsupported operation: Cannot modify an unmodifiable list
  // ls = [3, 4, 5]; // Error: Setter not found: 'ls'.

  // 声明 cnost 时必须初始化, 并且只能使用常量表达式初始化, 因为 const 变量指向的是一个编译时常量
  // const stu1 = new Student(); // Error: New expression is not a constant expression.

  List<String> getList() {
    return const <String>['a', 'b', 'c'];
  }

  assert(getList() == getList());
  assert([1, 2, 3] == [1, 2, 3]);


  //
}
