class LightFacade {
  final LightSwitch _lightSwitch;
  final LightDimmer _lightDimmer;

  LightFacade(this._lightSwitch, this._lightDimmer);

  void turnOnWithBrightness(int brightness) {
    _lightSwitch.turnOn();
    _lightDimmer.setBrightness(brightness);
  }

  void turnOff() {
    _lightSwitch.turnOff();
  }
}

class LightSwitch {
  void turnOn() => print("Light is ON");
  void turnOff() => print("Light is OFF");
}

class LightDimmer {
  void setBrightness(int level) {
    print("Light brightness set to $level%");
  }
}

void main() {
  final lightSwitch = LightSwitch();
  final lightDimmer = LightDimmer();

  final lightFacade = LightFacade(lightSwitch, lightDimmer);

  lightFacade.turnOnWithBrightness(75);

  lightFacade.turnOff();
}
