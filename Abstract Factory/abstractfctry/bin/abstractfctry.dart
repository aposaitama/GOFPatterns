// Абстрактная фабрика
abstract class CarFactory {
  Car createCar();
  Specification createSpecification();
}

// Абстрактные продукты
abstract class Car {
  void createCar();
}

abstract class Specification {
  void createSpecification();
}

// Конкретные продукты для Северной Америки
class NorthAmericaCar implements Car {
  @override
  void createCar() {
    print("North America car has been created");
  }
}

class NorthAmericaSpecification implements Specification {
  @override
  void createSpecification() {
    print("North America car specs have been created");
  }
}

// Конкретные продукты для Европы
class EuropeCar implements Car {
  @override
  void createCar() {
    print("Europe car has been created");
  }
}

class EuropeSpecification implements Specification {
  @override
  void createSpecification() {
    print("Europe car specs have been created");
  }
}

// Конкретная фабрика для Северной Америки
class NorthAmericaCarFactory implements CarFactory {
  @override
  Car createCar() {
    return NorthAmericaCar();
  }

  @override
  Specification createSpecification() {
    return NorthAmericaSpecification();
  }
}

// Конкретная фабрика для Европы
class EuropeCarFactory implements CarFactory {
  @override
  Car createCar() {
    return EuropeCar();
  }

  @override
  Specification createSpecification() {
    return EuropeSpecification();
  }
}

// Класс Application, который использует абстрактную фабрику
class Application {
  final CarFactory factory;

  Application(this.factory);

  void createUI() {
    Car car = factory.createCar();
    Specification spec = factory.createSpecification();

    car.createCar();
    spec.createSpecification();
  }
}

void main() {
  // Используем фабрику для Северной Америки
  CarFactory factory = NorthAmericaCarFactory();
  Application app = Application(factory);
  app.createUI();

  // Используем фабрику для Европы
  factory = EuropeCarFactory();
  app = Application(factory);
  app.createUI();
}
