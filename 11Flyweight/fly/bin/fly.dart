class MarkerIcon {
  final String iconPath;
  final String color;

  MarkerIcon(this.iconPath, this.color);
}

class MarkerIconFactory {
  static final Map<String, MarkerIcon> _icons = {};

  static MarkerIcon getIcon(String iconPath, String color) {
    String key = '$iconPath-$color';

    if (!_icons.containsKey(key)) {
      _icons[key] = MarkerIcon(iconPath, color);
      print('Creating new marker icon: $iconPath, $color');
    } else {
      print('Reusing existing marker icon: $iconPath, $color');
    }

    return _icons[key]!;
  }
}

class MapMarker {
  final double latitude;
  final double longitude;
  final MarkerIcon icon;

  MapMarker(this.latitude, this.longitude, this.icon);

  void display() {
    print(
        'Displaying marker at ($latitude, $longitude) with icon ${icon.iconPath}, ${icon.color}');
  }
}

void main() {
  final restaurantIcon = MarkerIconFactory.getIcon('restaurant.png', 'red');
  final restaurantIcon2 = MarkerIconFactory.getIcon('restaurant.png', 'red');
  final shopIcon = MarkerIconFactory.getIcon('shop.png', 'blue');

  final marker1 = MapMarker(50.4501, 30.5234, restaurantIcon);
  final marker3 = MapMarker(50.4503, 30.5236, shopIcon);

  marker1.display();
  marker3.display();
}
