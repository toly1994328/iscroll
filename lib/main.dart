main() {
  // Uri? uri = Uri.tryParse('http://aio-spacexxx.com/platform-web/wx_zff.html?token=AAQTnZoAAAABAAAAAACQQpkiTxIQ2FE9peC2YSAAAABcwQVtru-5k9MmE ');
  // print(uri?.query);

  A a = A(a: 8);
  print(4.clamp(2, 8)); //4
  print(4.clamp(2, 3)); //3
  print(4.clamp(6, 9)); //6

  Counter counter = Counter(10000000000);
  counter.doCount();
}


class Counter {
  Counter(this.count);

  final int count;

  void doCount() {
    for (int i = 0; i < count; i++) {
      print(count);
    }
  }
}

class A {
  final int a;
  final int _b;

  A({required this.a}) :
        _b = a {

  }
}