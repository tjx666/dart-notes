/**
 * Dart 中在 PI 部分未测试的内建类型
 */

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

// Map
void testMap() {
  // dart 中的 map 和 js 中的对象使用时很像, 但也有很大区别
  // 定义一个 map, dart 中的 Map 字面量和 js 中的 对象字面量一样是用花括号包裹的 key-values
  var gifts = {
    // Key:    Value
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 'golden rings'
  };

  // 上面的 gifts 其实被推断成了 Map<String, String>
  // 验证一下
  // gifts['third'] = 666; // Error: A value of type 'int' can't be assigned to a variable of type 'String'.

  // 使用构造器构造 Map
  final employers = Map();
  // 添加 key-value
  employers['ytj'] = 1800;
  employers['lyd'] = 1600;
  // Map 的特点就是 key 不会重复, 但 value 可以
  employers['ytj'] = 1750;
  print(employers); // {ytj: 1750, lyd: 1600}
  // 获取 kye-value 对数
  print(employers.length); // 2
  // 获取不到返回 null
  print(employers['noThisKey']); // null

  // To create a map that’s a compile-time constant, add const before the map literal:
  final constantMap = const {
    1: 'Sunday',
    2: 'Monday'
  };

  // 测试 Map 的 API
  // 获取所有 keys, 返回 iterable
  print(gifts.keys); // (first, second, fifth)
  print(gifts.values); // (partridge, turtledoves, golden rings)
  print(gifts.isEmpty); // false
  print(gifts.isNotEmpty); // true
  gifts.remove('first');
  print(gifts); // {second: turtledoves, fifth: golden rings}
  print(gifts.containsKey('third')); // false
}

// runes utf-32 字符
void testRunes() {
  // 做个测试
  const testStr = '💔';
  for (var i = 0; i < testStr.length; i++) {
    print('Line $i: ${testStr[0]}');
  }
  // 结果, 32 位字符被识别为两个字符
  /*
    Line 0: ���
    Line 1: ���
  */

  // dart 中表示unicode字符的方式使用 \u{codePoint}
  print('\u{1f600}'); // 😀
  print(testStr.runes.toList().length); // 1

  Runes input = new Runes(
      '\u2665  \u{1f605}  \u{1f60e}  \u{1f47b}  \u{1f596}  \u{1f44d}');
  print(new String.fromCharCodes(input));
  // ♥  😅  😎  👻  🖖  👍
}

// Symbol 类
// A Symbol object represents an operator or identifier declared in a Dart program. You might never need to use symbols, but they’re invaluable for APIs that refer to identifiers by name, because minification changes identifier names but not identifier symbols.

// To get the symbol for an identifier, use a symbol literal, which is just # followed by the identifier:

// #radix
// #bar
// Symbol literals are compile-time constants.
void main() {
  testLists();
  // testMap();
  // testRunes();

}
