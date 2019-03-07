/**
 * Asynchronous
 * 异步 
 */

// ---------------------- flutter --------------------------
// flutter 中有大量的 API 是返回 Future 和 Stream 的, 这些函数都是异步的
// future 和 js 中的 Promise 概念上几乎没什么区别

void tsetThenCatch() {
  // then
  Future.delayed(new Duration(seconds: 2), () {
    return "hi world!";
  }).then((data) {
    print(data);
  });

  // catchError
  Future.delayed(Duration(seconds: 2), () {
    throw AssertionError();
  }).catchError((e) {
    print('可以使用 catchError 来处理发生错误的情况');
  });
}

void testWhenCompleted() {
  // 还有个 whenComplete
  Future.delayed(Duration(milliseconds: 500), () {
    print('500毫秒到了');
    return '返回的数据';
  })
      .then((data) {
        print('异步操作成功, 获得数据: $data');
      })
      .catchError((e) => print(e))
      .whenComplete(() {
        print('Completed');
      });
  // 执行结果 =>
  // 500毫秒到了
  // 异步操作成功, 获得数据: 返回的数据
  // Completed
  // 结果表明异步操作完成后先执行 then 和 catchError 再执行 whenComplete
}

// 类似的还有 any, wait
final List<Future> tasks = [1, 2, 3, 4]
    .map((ele) => Future.delayed(
        Duration(milliseconds: ele * 100), () => print('task$ele completed!')))
    .toList();

void testAny() {
  // 只要有一个先完成就调用 then
  Future.any(tasks).then((data) => print('比比看谁最快!'));
  // task1 completed!
  // 比比看谁最快!
  // task2 completed!
  // task3 completed!
  // task4 completed!
}

void testWait() {
  Future.wait(tasks).then((data) => print('都完成了...'));
// task1 completed!
// task2 completed!
// task3 completed!
// task4 completed!
// 都完成了...
}

// -------------------- async await ------------------------
// 和 es7 中 async 函数定义的形式上有点区别
Future<bool> login() async {
  print('First, to login');
  return true;
}

Future<Map<String, String>> getUserInfo() async {
  print('Then, get userinfo');
  return {'name': 'ly', 'age': '22'};
}

Future<void> saveUserInfo(Map<String, String> map) async {
  print('Finally, save the userInfo');
  return null;
}

Future<void> tsetAsyncAwait() async {
  final loginResult = await login();
  if (loginResult) {
    final Map<String, String> userInfo = await getUserInfo();
    await saveUserInfo(userInfo);
    print('Test async/await completed');
  }
// First, to login
// Then, get userinfo
// Finally, save the userInfo
// Test async/await completed
}

// --------------------- Stream -------------------------
// 传递一个 futute 数组, 每个 fututre 完成时都会被处理
void testStream() {
  Stream.fromFutures([
    // 1秒后返回结果
    Future.delayed(new Duration(seconds: 1), () {
      return "hello 1";
    }),
    // 抛出一个异常
    Future.delayed(new Duration(seconds: 2), () {
      throw AssertionError("Error");
    }),
    // 3秒后返回结果
    Future.delayed(new Duration(seconds: 3), () {
      return "hello 3";
    })
  ]).listen((data) {
    print(data);
  }, onError: (e) {
    print(e.message);
  }, onDone: () {});
}

void main() {
  // testAny();
  // testWait();
  // tsetAsyncAwait();
  testStream();
}
