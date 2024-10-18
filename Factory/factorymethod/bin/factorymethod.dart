//created general interface

abstract class Delivery {
  void deliveryMethod();
}

class Truck implements Delivery {
  @override
  void deliveryMethod() {
    print('delivery by road');
  }
}

class Plane implements Delivery {
  @override
  void deliveryMethod() {
    print('delivery by air');
  }
}

class Ship implements Delivery {
  @override
  void deliveryMethod() {
    print('delivety by water');
  }
}

abstract class Logistics {
  Delivery createDeliviryMethod();

  void planDelivery() {
    final delivery = createDeliviryMethod();
    delivery.deliveryMethod();
  }
}

class RoadLogistics extends Logistics {
  @override
  Delivery createDeliviryMethod() {
    return Truck();
  }
}

class AirLogistics extends Logistics {
  @override
  Delivery createDeliviryMethod() {
    return Plane();
  }
}

class WaterLogistics extends Logistics {
  @override
  Delivery createDeliviryMethod() {
    return Ship();
  }
}

void main() {
  Logistics logistics;
  logistics = AirLogistics();
  logistics.planDelivery();
}
