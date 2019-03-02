/**
 * 控制流语句
 */

// ------------------------ if else ----------------------------
// 和 js 不一样, dart 的条件必须是 bool 类型
void testCondition() {
  const age = 22;
  const hasGF = false;

  if (age < 18) {
    print('小孩子');
  } else if (age >= 18 && age < 20) {
    print('成年人');
  } else if (age > 20 && !hasGF) {
    print('老男人');
  }

  // if (null) print('ok'); // Failed assertion: boolean expression must not be null
}

// ---------------------- for loop-------------------------
void testForLoop() {
  // 上个最简单的例子
  for (int i = 0, max = 3; i < max; i++) {
    print(i);
  }

  // dart 在循环中如果有异步函数绑定引用, 不会出现 js 中的那种最后引用全是循环中最后一个值
  var callbacks = [];
  for (var i = 0; i < 2; i++) {
    callbacks.add(() => print(i));
  }
  callbacks.forEach((c) => c()); // => 0, 1

  // 函数式的方式来写 for loop
  const ls = [2, 3, 4, 5];
  ls.forEach((ele) => print(ele)); // => 2, 3, 4, 5

  // for in 循环, 类似于 python 遍历的是值
  for (final v in ls) {
    print(v);
  }
  // => 2, 3, 4, 5

  // 问题来了, 如果要像 js 一样遍历 key 咋办?
  const map = {'name': 'lyreal666', 'age': '22'};

  for (final key in map.keys) {
    print('${key}: ${map[key]}');
  }
  // =>
  // name: lyreal666
  // age: 22
}

// -------------------------- while---------------------------------
// 大多数语言都支持两种 while 循环. while 和 do while
// do while 特点就是一定会执行一次
void testWhile() {
  // 太简单, 不测了
}

// ----------------------- break and continue ---------------------------
void testBreakAndContinue() {
  const map = {
    'name': 'lyreal666',
    'pwd': 'xxxxxxxx',
    'sex': 'man',
    'remember': true
  };

  for (final value in map.values) {
    if (value == true) break;
    print(value);
  }
  // =>
  // lyreal666
  // xxxxxxxx
  // man

  // 官方文档没看到带标签的 break, 测试一下, 结果证明是可以用的
  tag:
  for (var i = 0; i < 3; i++) {
    for (var j = 0; j < 3; j++) {
      for (var k = 0; k < 3; k++) {
        print('[${i}, ${j}, ${k}]');
        if (i == 1 && j == 1 && k == 1) break tag;
      }
    }
  }

  // 循环中的 break 和 continue 一般用来过滤某些情况, 可以考虑使用 where 来达到 js 中 filter 的效果
  const firms = ['Microsoft', 'Google', 'facebook', 'Oracle'];
  firms
      .where((firm) => firm[0].codeUnitAt(0) < 'a'.codeUnitAt(0))
      .forEach((firm) => print(firm));
  // =>
  // Microsoft
  // Google
  // Oracle
}

// ------------------------- switch case -------------------------------
void testSwitchCase() {
  // dart 中的 switch case 和 java, javascript 中的 switch case 语法上有点不一样
  // dart 中非空 case 块必须以 break, continue, return, throw 语句之一结尾
  const executeResult = 'SUCCESS';
  switch (executeResult) {
    // case 'SUCCESS':
    //   print('SUCCESS'); //  Error: Switch case may fall through to the next case.
    case 'SUCCESS':
      print('SUCCESS');
      break;
    case 'FAIL':
      print('FAIL');
  }

  // dart 支持空的 case
  var command = 'CLOSED';
  switch (command) {
    case 'CLOSED': // Empty case falls through.
    case 'NOW_CLOSED':
      // Runs for both CLOSED and NOW_CLOSED.
      print('did close');
      break;
  }

  //
  command = 'CLOSED';
  switch (command) {
    case 'CLOSED':
      print('CLOSE');
      continue nowClosed;
    // Continues executing at the nowClosed label.
    nowClosed:
    case 'NOW_CLOSED':
      // Runs for both CLOSED and NOW_CLOSED.
      print('CLOSE');
      ;
      break;
  }

  // 每个 case 语句的的变量只能在它的块中访问
  command = 'CLOSED';
  switch (command) {
    case 'CLOSED':
      const name = 'ly';
      continue nowClosed;
    // Continues executing at the nowClosed label.
    nowClosed:
    case 'NOW_CLOSED':
      // Runs for both CLOSED and NOW_CLOSED.
      // print(name); // Error: Getter not found: 'name'.
      break;
  }
}

// ---------------------- 断言 ----------------------------
void testAssert() {
  // dart 的断言很方便, 默认是不生效的, 即就算断言失败, 也不会抛出异常. 可以通过启动参数开启断言失败抛出异常
  // 启动参数 添加 --enable-asserts 即可开启断言
  assert(true);
  // 可以传第二个参数标注作为断言失败的提示信息
  // assert(false, '断言失败了');
  // 'file:///d:/Code/flutter/study-dart/ControlFlowStatements.dart': Failed assertion: line 164 pos 10: 'null': 断言失败了
}


void main() {
  // testCondition();
  // testForLoop();
  // testWhile();
  // testBreakAndContinue();
  // testSwitchCase();
  testAssert();
}
