/**
 * Dart 语言中的一些事实和概念
 */

/*
 * 1. 一切皆对象
 * Dart 中所有变量都是一个指向对象的引用
 * 每个对象都是某个类的实例
 * 包括 数字，函数和 null 都是对象
 * 所有的对象都继承于 Object 类
 */


/* 
 * 2. 强类型语言
 * 尽管 Dart 中类型声明是可选的，那只是因为 Dart 编译器会自动推断类型。
 * 如果你确实要声明一个没有类型的变量，请使用 dynamic 类型声明它
 */


/*
 * 3.Dart 支持泛型。然而， Dart 亲兄弟 GoLang 不支持🙃
 * 例如 List<int>, List<dynamic>
 */


/*
 * 4. Dart 并不是纯面向对象的
 * 不像 Java，变量和函数必须声明在类中，Dart 允许声明顶级的函数
 * 同样也可以将函数作为静态方法绑定到 Class 上，作为实例方法绑定到对象上
 * 你甚至可以在函数中定义函数
 */


/*
 * 5.类似的, Dart 支持顶级的变量
 * 当然也可以作为 Class 的静态属性和实例上的属性
 * 有时又被称之为 fields 和 properties
 */ 


/*
 * 6. Dart 不支持权限修饰符
 * 不像 Java, Dart 不支持 public, private 等关键字
 * 在 Dart 中, 以下划线开头的标识符，对于它所属的库来说是私有的
 */


/*
 * 7. Dart 中的标识符可以以下划线和字母开头，后面可以跟任意字符和数字的组合
 */


/*
 * 8.Dart 中有 expression 和 statement
 * expression 有返回值， statement 一般包含 expression, 但是没有返回值
 */


/*
 * Dart 工具可能会报两种 problems, warning 和 error
 * warning 只是说你的代码可能不会正常运行，但是不会妨碍程序执行
 * error 分为编译时 error 和 运行时 error
 * 前者会导致程序彻底不能执行，后者是执行代码时被抛出的
 */
