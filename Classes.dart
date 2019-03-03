/**
 * dart Class
 */

// ------------------------ constructor ---------------------------
// 同时也隐式定义了 interface Point, interface Point 实现了 Point 和 其实现, 继承的所有方法
class Point {
  num x;
  num y;
  num z = 0;

  // 生成构造器
  // 在构造器中使用 this.field 的方式的语法糖等同于在构造体中直接对 this.field 赋值
  // 和 java 一样, 如果一个构造器也没有声明, 编译器会默认添加一个无参构造器, 同时调用父类的无参构造器初始化父类
  Point(this.x, this.y, this.z);

  // Named constructor 命名构造器
  Point.origin() {
    x = 0;
    y = 0;
  }
}

class Config {
  final String version;
  final String name;

  // 常量构造器要确保实例的所有变量都是 final 的
  const Config(this.version, this.name);
}

void testConstructor() {
  // dart2 中 new 是可选的, 即下面等价于 Point p = new Point(0.5, 1, 0.5);
  Point p = Point(0.5, 1, 0.5);
  // 本质上调用了 p.getX('x');
  // dart 为每个实例变量隐式生成了 getter 和 setter 方法, 当然 final 实例变量是没有生成 setter 方法
  print(p.x); // 0.5
  
  const config1 = const Config('0.0.1', 'dart-notes');
  const config2 = const Config('0.0.1', 'dart-notes');
  print(config1 == config2); // true
}

// --------------------------- 继承 --------------------------------
abstract class Father {
  // 没有函数体就是 abstract method
  void driveCar();
}

// 这个 Father 是声明 class Father 后隐式生成的 interface Father
class Son implements Father {
  int age;
  int grade;
  int agePlusGrade;

  // 初始化列表即构造器 : 后面部分
  Son(this.age, this.grade) : agePlusGrade = age + grade;

  // 使用 override 注解表示这是个重写方法
  @override
  void driveCar() {
    print('呜呜呜呜!');
  }
}

class Daughtor extends Father {
  @override
  void driveCar() {}
}

// ----------------------------------- 枚举 -----------------------------------
enum Fruit { BANANA, APPLE, PEAR, ORAMGE }
// 枚举有两点限制
// 1. 不允许有类继承, 实现, 混入 枚举类
// 2. 枚举类不能实例化

void testEnumInDart() {
  // 通过枚举类来访问枚举成员
  print(Fruit.APPLE);
  // 获取所有枚举成员
  print(Fruit.values); // [Fruit.BANANA, Fruit.APPLE, Fruit.PEAR, Fruit.ORAMGE]
  print(Fruit.PEAR.index); // 下标从 0 开始

  // 枚举常和 switch case 搭配
  const fruit = Fruit.APPLE;
  switch (fruit) {
    case Fruit.APPLE:
      print('apple...');
      break;
    default:
      print('...');
  }
}

void main() {
  // testConstructor();
  testEnumInDart();
}
