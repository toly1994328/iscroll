main() {
  Dog dog = Dog(energy: 2);
  dog.bark();
  dog.bark();
  dog.feed(2);
  dog.bark();
  // dog.cry();
}

abstract class Animal {
  int energy;

  Animal({this.energy = 10}); //体力

  void _bark(); // 定义抽象方法

  void bark() {
    if (energy < 1) {
      print('体力不足!');
      return;
    }
    _bark(); // 使用抽象方法
    energy--;
  }

  void feed(int energy) {
    this.energy += energy;
  }
}

class Dog extends Animal {
  Dog({int energy = 10}) :super(energy: energy);

  @override
  void _bark() {
    print('汪汪');
  }
}

class Cat extends Animal {
  Cat({int energy = 10}) :super(energy: energy);

  @override
  void _bark() {
    print('喵喵');
  }
}

