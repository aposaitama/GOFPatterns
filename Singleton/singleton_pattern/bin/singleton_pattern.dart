class Singleton {
  static final Singleton _instance = Singleton._internal();

  Singleton._internal();

  factory Singleton() {
    return _instance;
  }

  void showMessage() {
    print('Hello from Singleton!');
  }
}

void main() {
  var singleton1 = Singleton();
  var singleton2 = Singleton();

  if (singleton1 == singleton2) {
    print('Both variables point to the same instance.');
  }

  singleton1.showMessage();
}
