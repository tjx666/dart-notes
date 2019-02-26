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

// ------------------ 函数作用域 ------------------------
// 和很多其它语言一样, dart 中 变量的访问新就是由它所有处在代码中的位置, 布局决定的
// 具体来说就是: 内层可以访问外层变量, 后声明的可以访问前面声明的
void testLexicalScope() {
  void mostOutterFunc() {
    final mostOutterVar = 9;

    void outerFunc() {
      void innerFunc() {
        print(mostOutterVar);
      }

      innerFunc();
      // ! 不像javascript 可以访问后声明的函数
      // anotherInnerFunc(); // Error: Method not found: 'anotherInnerFunc'.

      void anotherInnerFunc() {
        print('anotherInnerFunc');
      }
    }

    outerFunc();
  }

  mostOutterFunc();
}

// ------------------ 闭包(closures) ------------------------
// 简明来说闭包就是一个调用了外部变量的函数对象
// 闭包有时候是导致内存泄漏的罪魁祸首, 因为被调用的函数内部变量被返回的闭包引用,导致被调用函数占用资源无法内回收
const PI = 3.14159265457;
Function testClouser() {
  print(PI);
  return () => PI + 1;
}

// ------------------------- 函数的相等性 ------------------------------
void func1() {}
void func2() {}
int func3() {
  return 1;
}

class A {
  static void func4() {}
  void func5() {}
}

void testEqualityOfFunc() {
  print(func1 == func2); // false
  print(func1 == func3); // false
  print(func1 == A.func4); // false
  A a1 = A();
  A a2 = A();
  // 实例对象不能访问静态方法
  // print(a1.func4 == a2.func4); // Error: The getter 'func4' isn't defined for the class 'A'.
  print(a1.func5 == a2.func5); // false

  final func = A.func4;
  print(func == A.func4); // true
}

// ---------------------- 函数返回值 ----------------------------
// 当没有写返回语句时, 编译器默认在最后追加一具 return null;
void testReturn() {
  foo() {}
  assert(foo() == null);
}

void main() {
  // testFunctionAsObject();
  // testLexicalScope(); // => 9
  // print(testClouser()());
  // =>
  // 3.14159265457
  // 4.14159265457
  // testEqualityOfFunc();
  testReturn();
}
