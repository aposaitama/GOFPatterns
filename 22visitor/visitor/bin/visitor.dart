abstract class CarService {
  void visitSedan(Sedan sedan);
  void visitTruck(Truck truck);
}

abstract class Car {
  void accept(CarService service);
}

class InspectionService implements CarService {
  @override
  void visitSedan(Sedan sedan) {
    print("Sedan inspection");
  }

  @override
  void visitTruck(Truck truck) {
    print("Truck inspection");
  }
}

class CarWashService implements CarService {
  @override
  void visitSedan(Sedan sedan) {
    print("Sedan wash");
  }

  @override
  void visitTruck(Truck truck) {
    print("Truck wash");
  }
}

class Sedan implements Car {
  @override
  void accept(CarService service) {
    service.visitSedan(this);
  }
}

class Truck implements Car {
  @override
  void accept(CarService service) {
    service.visitTruck(this);
  }
}

void main() {
  final sedan = Sedan();
  final truck = Truck();

  final inspection = InspectionService();
  final carWash = CarWashService();

  sedan.accept(inspection);
  truck.accept(inspection);

  print("---");

  sedan.accept(carWash);
  truck.accept(carWash);
}
