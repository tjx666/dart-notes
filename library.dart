import './testLibrary/lib1.dart';
// 可以多次导入
import './testLibrary/lib2.dart' as lib2;
import './testLibrary/lib2.dart' hide age;
import './testLibrary/lib2.dart' show age;

import 'testLibrary/lazyLoad.dart' deferred as lazy;

void main() {
  // ---------------------- 可访问性 ----------------------------
  // 使用 _ 开头的标识符都是只能在自身所在 lib 即 dart 文件中可以访问
  // lib1中的_privateGlobalVariable 不可见, 仅在 lib1.dart 中可见
  // print(_privateGlobalVariable); // Error: Getter not found: '_privateGlobalVariable'.

  print(constPrivateGlobalVariable); // => lib1 中全局常量
  // 导入的常量并不能修改
  // constPrivateGlobalVariable = '导入的常量能不能修改'; // library.dart:8:3: Error: Setter not found: 'constPrivateGlobalVariable'.

  print(finalPrivateGlobalVariable); // => lib1 中全局 final 变量
  // finalPrivateGlobalVariable = '导入的 final 变量能不能修改'; // library.dart:12:3: Error: Setter not found: 'finalPrivateGlobalVariable'.

  // --------------------- 同名冲突问题 -------------------------
  // 导入的多个 lib 有同名的标识符咋办?
  // 可以使用 as 在导入 lib 的时候给 lib 加个名字
  lib2.SameIdentifier sd = new lib2.SameIdentifier();

  // ---------------------- 部分导入 ----------------------------
  // 通过 show 和 hide, 感觉比 es6 import 用起来更舒服
  print(name);
  print(age);

  // -------------------------- 懒加载 -------------------------------
  // 当前的 dart 虚拟机允许在 loadLibray 之前访问被懒加载的 library 中的变量
  // 但是官方文档说以后这种语法是会被修改的, 建议不要使用这种 bug 特性

  // 被 lazy load 的 library 中的类型在导入的 library 中是不可用的
  // 建议的做法是 将要导入的类型抽离出来然后再两个 library 中都导入
  Future testLazyLoad() async {
    await lazy.loadLibrary();
    print(lazy.lazyConstant);
  }

  testLazyLoad();
}
