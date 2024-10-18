abstract class Prototype {
  Prototype clone();
}

class Car implements Prototype {
  String? model;
  String? color;

  Car(this.color, this.model);

  @override
  Prototype clone() {
    return Car(model, color);
  }

  @override
  String toString() {
    return 'Car(model: $model, color: $color)';
  }
}

void main() {
  Car originalCar = Car('Tesla Model S', 'Red');
  print('Original: $originalCar');

  Car clonedCar = originalCar.clone() as Car;
  print('Cloned: $clonedCar');

  clonedCar.color = 'Blue';
  print('After modifying cloned car: $clonedCar');
  print('Original car remains unchanged: $originalCar');
}
