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

void main() {
  testMap();
}