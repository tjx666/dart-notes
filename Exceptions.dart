/**
 * Dart 中的异常
 */

/*
 * 和 java 的异常差不多, 有几点区别
 * 1. dart 允许抛出任意类型数据, 不只是像 java 一样继承了 Throwable 类的类的对象
 * 2. dart 中所有的异常都是非受检异常, 即所有异常你不处理, 不在函数声明中 throws 编译器不会报错
 * 3. dart 中 使用 on 来表示异常类型, catch 来接受异常对象, 未声明异常类型, 即捕捉任意类型
 * 4. dart 中需要重新抛出异常只要调用 rethrow 即可
 * 5. dart 中 catch 可以接受第二参数 StackTrace
 */

void main () {
  try {
    print('我是你永远得不到的爸爸!');
    throw('我也想要自由');
  } on Exception catch(e) {
    print(e);
    rethrow;
  } catch (e, stackTrace) {
    print(e);
    print(stackTrace);
  }
}

// 我是你永远得不到的爸爸!
// 我也想要自由
// #0      main (file:///d:/Code/flutter/study-dart/Exceptions.dart:17:5)
// #1      _startIsolate.<anonymous closure> (dart:isolate/runtime/libisolate_patch.dart:300:19)
// #2      _RawReceivePortImpl._handleMessage (dart:isolate/runtime/libisolate_patch.dart:171:12)
