abstract class Iterator {
  bool hasNext();
  String next();
}

abstract class Aggregate {
  Iterator createIterator();
}

//concreteIterator
class RainbowColorsIterator implements Iterator {
  final RainbowColors _rainbowColors;
  int _current = 0;

  RainbowColorsIterator(this._rainbowColors);

  @override
  bool hasNext() {
    return _current < _rainbowColors.colors.length;
  }

  @override
  String next() {
    return _rainbowColors.colors[_current++];
  }
}

//concreteCollection
class RainbowColors implements Aggregate {
  final List<String> colors = [
    'Red',
    'Orange',
    'Yellow',
    'Green',
    'Blue',
    'Indigo',
    'Violet'
  ];

  @override
  Iterator createIterator() {
    return RainbowColorsIterator(this);
  }
}

void main() {
  final rainbowColors = RainbowColors();

  final iterator = rainbowColors.createIterator();

  while (iterator.hasNext()) {
    print(iterator.next());
  }
}
