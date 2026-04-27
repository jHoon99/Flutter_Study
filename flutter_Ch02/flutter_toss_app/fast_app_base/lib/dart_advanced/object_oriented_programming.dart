main() {
  /// 객체지향 프로그래밍(OOP)의 특징
  ///
  /// 1. 추상화 (Abstraction)
  ///   - Abstract Class (extends - only 1)
  ///     - Animal - age, eat()
  ///     - Dog, Cat
  ///
  ///   - Abstract mixin Class (with - n*)
  ///
  ///
  ///   - Abstract interface Class (implements - n*)
  ///
  final bird1 = Bird(0);
  bird1.fly();
  bird1.run();

  /// 2. 상속 (Inheritance)
  ///   - Extends
  ///
  /// 3. 다형성 (Polymorphism)
  ///   - override
  ///   - implement
  ///
  /// 4. 캡슐화 (Encapsulation)
  ///   - private ( _ 언더스코어, 언더바)
  ///   - method
  ///   - get & set
}

abstract class Animal {
  // 추상 클래스는 직접 인스턴스를 생성하지 못함.
  int _age;

  int get age => _age;

  void addAge() {
    _age++;
  }
  void eat() {
    print('기본 eat');
  }
  Animal(this._age);
}

abstract mixin class CanFly {
  String wigns = 'wings';

  void fly() {
    print("훨훨");
  }
}

abstract mixin class CanRun {
  String legs = 'legs';

  void run() {
    print('후다닥');
  }
}

class Dog extends Animal {
  Dog(super.age);

  @override
  void eat() {
    print('촵촵');
  }
}

class Bird extends Animal with CanFly, CanRun {
  Bird(super.age);

  @override
  void eat() {
    print('콕콕');
  }
}
