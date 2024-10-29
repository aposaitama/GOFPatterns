class Singleton {
  //created private constructor to prevent external realization;
  Singleton._();

  //single instance of the class
  static final Singleton _instance = Singleton._();

  //factory constructor to provide access to the singleton instance.
  factory Singleton() => _instance;

  //some method
  void showMessage() {
    print('Hello');
  }
}

void main() {
  final singleton1 = Singleton();
  final singleton2 = Singleton();

  if (singleton1 == singleton2) {
    print('same instance');
  }
  singleton1.showMessage();
  singleton2.showMessage();
}
