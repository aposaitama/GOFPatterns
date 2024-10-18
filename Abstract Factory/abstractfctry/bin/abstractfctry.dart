abstract class CarFactory {
  Car createCar();
  Specification createSpecification();
}

abstract class Car {
  void createCar();
}

abstract class Specification {
  void createSpecification();
}

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

//конкретні продукти для Європи
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

//Конкретна фабрика для НА
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

//конкретна фабрика для Європи
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

class CreateCar {
  final CarFactory factory;

  CreateCar(this.factory);

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
  CreateCar app = CreateCar(factory);
  app.createUI();

  // Используем фабрику для Европы
  factory = EuropeCarFactory();
  app = CreateCar(factory);
  app.createUI();
}
