abstract class Breakfast {
  void prepareBreakfast() {
    boilWater();
    cook();
    serve();
  }

  void boilWater() {
    print('boil water');
  }

  void cook();
  void serve() {
    print('serv on table');
  }
}

class ScrambledEggs extends Breakfast {
  @override
  void cook() {
    print('cooking scramble');
  }
}

class Oatmeal extends Breakfast {
  @override
  void cook() {
    print('coocking oatmeal');
  }
}

void main() {
  Breakfast breakfast1 = ScrambledEggs();
  breakfast1.prepareBreakfast();

  print('---');

  Breakfast breakfast2 = Oatmeal();
  breakfast2.prepareBreakfast();
}
