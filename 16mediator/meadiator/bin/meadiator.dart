abstract class ParkingMediator {
  void parkCar(Car car);
  void leaveCar(Car car);
}

//conc mediator
class ParkingLot implements ParkingMediator {
  final List<Car> _parkedCars = [];

  @override
  void parkCar(Car car) {
    if (_parkedCars.contains(car)) {
      print('${car.name} already parked');
    } else {
      _parkedCars.add(car);
      print('${car.name} уsuccessfully parked ');
    }
  }

  @override
  void leaveCar(Car car) {
    if (_parkedCars.contains(car)) {
      _parkedCars.remove(car);
      print('${car.name} leave parking');
    } else {
      print('${car.name} is not parked');
    }
  }
}

//component
class Car {
  final String name;
  final ParkingMediator mediator;

  Car(this.name, this.mediator);

  void park() {
    mediator.parkCar(this);
  }

  void leave() {
    mediator.leaveCar(this);
  }
}

void main() {
  final parkingLot = ParkingLot();

  final car1 = Car('car1', parkingLot);
  final car2 = Car('car2', parkingLot);

  car1.park();
  car2.park();
  car1.park();
  car2.leave();
  car2.leave();
}
