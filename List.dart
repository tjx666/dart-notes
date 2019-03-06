// 列表类
void testLists() {
  // List 类就是 dart 中的数组, 和 js 的字面值很像
  var ls = [1, 2, 3]; //  Dart 解析器将推断该列表类型为 List<int>
  const doubleLs = [1.0, 'jjj', 3];
  ls.add(4);
  print(ls); // [1, 2, 3, 4]
  // 下面报错,说明 Dart 中的 List 保存的都是同类型的元素
  // ls.add('5'); // Error: The argument type 'String' can't be assigned to the parameter type 'int'.

  // Dart 中的 List 以 0 为第一个下标, 我们可以通过下标来访问 List
  print(ls[3]);

  // 和 Java 以及 js 一样, 可以通过 length 访问 List 长度
  print(ls.length);

  // 不能越界访问
  // print(ls[10]); // RangeError (index): Invalid value: Not in range 0..3, inclusive: 10

  // 定义一个常量列表
  final constantList = const ['a', 'b', 'c'];

  // 测试API, API 和 Java 的 List 差不多一模一样, 不过用起来更方便一点.
  // 基本属性
  print(ls.isEmpty); // false
  print(ls.isNotEmpty); // true

  // 基本操作
  ls.add(5);
  ls.remove(1);
  print(ls); // [2, 3, 4, 5]
  ls.clear();
  print(ls); // []
  ls.addAll([666, 888, 999, 666]);
  ls.removeLast();
  ls.removeAt(0);
  ls.removeRange(1, 2);
  print(ls); // [888]
  ls.insert(1, 999);
  print(ls); // [888, 999]
  ls.replaceRange(0, 1, [666]);
  print(ls); // [666, 999]
}

void main() {
  testLists();
}