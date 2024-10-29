abstract class Command {
  void execute();
}

class Light {
  void turnOn() {
    print('light is on');
  }

  void turnOff() {
    print('light is off');
  }
}

class TurnOnLightCommand implements Command {
  final Light light;

  TurnOnLightCommand(this.light);

  @override
  void execute() {
    light.turnOn();
  }
}

class TurnOffLightCommand implements Command {
  final Light light;

  TurnOffLightCommand(this.light);

  @override
  void execute() {
    light.turnOff();
  }
}

class RemoteControl {
  Command? command;

  void setCommand(Command command) {
    this.command = command;
  }

  void pressButton() {
    command?.execute();
  }
}

void main() {
  final light = Light();

  final turnOnLight = TurnOnLightCommand(light);
  final turnOffLight = TurnOffLightCommand(light);

  final remote = RemoteControl();

  remote.setCommand(turnOnLight);
  remote.pressButton();

  remote.setCommand(turnOffLight);
  remote.pressButton();
}
