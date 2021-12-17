main() {
  Dog dog = Dog(energy: 2);
  dog.bark();
  dog.bark();
  dog.feed(2);
  dog.bark();
  // dog.cry();
}

class Dog {
  int energy;

  Dog({this.energy = 10}); //体力

  void bark() {
    if (energy < 1) {
      print('体力不足!');
      return;
    }
    print('汪汪');
    energy--;
  }

  void feed(int energy) {
    this.energy += energy;
  }
}

class Cat {
  int energy;

  Cat({this.energy = 10}); //体力

  void bark() {
    if (energy < 1) {
      print('体力不足!');
      return;
    }
    print('喵喵');
    energy--;
  }

  void feed(int energy) {
    this.energy += energy;
  }
}