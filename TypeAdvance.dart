/**
 * 包括 typedef 和 runtimeType
 */

// ------------------------------ typedef ------------------------------------
/*
 * 目前只有函数能使用 typedef, 可能以后会支持普通类型
 * typedef 可以理解为给函数定义别名
 * 相比与使用 Function 类来声明函数类型变量, 使用 typedef 定义特定的函数类型不会丢失类型信息, 对开发者和开发工具都有帮助
 * 常用于声明 field, 参数和返回值类型
 */
typedef bool Callback(String event);

class DOMElement {
  num width;
  num height;
  Map<String, String> styles = {};
  Callback onEvent;

  DOMElement(this.width, this.height);
}

// 下面这个是官方文档的标准写法, 可以看到还可以对带泛型的函数声明别名
typedef Compare<T> = int Function(T a, T b);
int sort(int a, int b) => a - b;

void testTypedef() {
  DOMElement ele =DOMElement(20, 30);
  ele.styles['backgroundColor'] = 'red';
  ele.onEvent = (String event) {
    print(event);
  };
  ele.onEvent('onCLick');

  assert(sort is Compare<int>);
}

// ------------------------- 运行时类型 --------------------------------
void testRuntimeType() {
  print("${666}'s type is ${666.runtimeType}"); // => 666's type is int
  DOMElement ele = new DOMElement(1, 1);
  print("${ele}'s type is ${ele.runtimeType}"); // => Instance of 'DOMElement''s type is DOMElement

  Compare<int> cp = sort;
  print("${cp}'s type is ${cp.runtimeType}"); // Closure: (int, int) => int from Function 'sort': static.'s type is (int, int) => int

  // Function 类型变量可以接受任何类型的函数
  Function fcp = sort;
  print("${fcp}'s type is ${fcp.runtimeType}"); // Closure: (int, int) => int from Function 'sort': static.'s type is (int, int) => int
}

void main() {
  // testTypedef();
  // testRuntimeType();
  assert(1 is! String);
}