class Car {
  String? engine;
  int? seats;
  String? body;
  int? doors;
  void showDetails() {
    print('Car with engine: $engine, body: $body, doors: $doors');
  }
}

abstract class CarBuilder {
  void setEngine();
  void setSeats();
  void setBody();
  void setDoors();
  Car getCar();
}

class SportsCarBuilder implements CarBuilder {
  Car _car = Car();

  @override
  void setEngine() {
    _car.engine = 'V8 Engine';
  }

  @override
  void setBody() {
    _car.body = 'Sports Body';
  }

  @override
  void setDoors() {
    _car.doors = 2;
  }

  @override
  void setSeats() {
    _car.seats = 2;
  }

  @override
  Car getCar() {
    return _car;
  }
}

class WagonCarBuilder implements CarBuilder {
  Car _car = Car();

  @override
  void setEngine() {
    _car.engine = 'V6';
  }

  @override
  void setBody() {
    _car.body = 'Long Body';
  }

  @override
  void setDoors() {
    _car.doors = 5;
  }

  @override
  void setSeats() {
    _car.seats = 5;
  }

  @override
  Car getCar() {
    return _car;
  }
}

//mltpl director's
class Director {
  CarBuilder? _carBuilder;

  void setBuilder(CarBuilder builder) {
    _carBuilder = builder;
  }

  Car buildCar() {
    _carBuilder?.setEngine();
    _carBuilder?.setBody();
    _carBuilder?.setSeats();
    _carBuilder?.setDoors();
    return _carBuilder!.getCar();
  }
}

void main() {
  final director = Director();

  
  final sportsCarBuilder = SportsCarBuilder();
  director.setBuilder(sportsCarBuilder);
  final sportsCar = director.buildCar();
  sportsCar.showDetails();
  

  
  final wagonCarBuilder = WagonCarBuilder();
  director.setBuilder(wagonCarBuilder);
  final suvCar = director.buildCar();
  suvCar.showDetails();
  
}
