abstract class WeatherObserver {
  void update(double temperature, double humidity);
}

class WeatherStation {
  final List<WeatherObserver> _observers = [];
  double _temperature = 0.0;
  double _humidity = 0.0;

  void addObserver(WeatherObserver observer) {
    _observers.add(observer);
  }

  void removeObserver(WeatherObserver observer) {
    _observers.remove(observer);
  }

  void notifyObservers() {
    for (final observer in _observers) {
      observer.update(_temperature, _humidity);
    }
  }

  void setWeatherData(double temperature, double humidity) {
    _temperature = temperature;
    _humidity = humidity;
    notifyObservers();
  }
}

class MobileApp implements WeatherObserver {
  final String appName;

  MobileApp(this.appName);

  @override
  void update(double temperature, double humidity) {
    print('$appName: Temperature is $temperature°C, Humidity is $humidity%');
  }
}

class Display implements WeatherObserver {
  @override
  void update(double temperature, double humidity) {
    print('Display: Temperature is $temperature°C, Humidity is $humidity%');
  }
}

void main() {
  final weatherStation = WeatherStation();

  final mobileApp = MobileApp('Weather App');
  final display = Display();

  weatherStation.addObserver(mobileApp);
  weatherStation.addObserver(display);

  weatherStation.setWeatherData(25.0, 60.0);
  weatherStation.setWeatherData(30.0, 50.0);
}
