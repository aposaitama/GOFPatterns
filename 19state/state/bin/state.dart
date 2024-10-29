abstract class LightState {
  void pressSwitch(LightContext context);
}

//conc state
class OffState implements LightState {
  @override
  void pressSwitch(LightContext context) {
    print("Лампочка увімкнена.");
    context.state = OnState();
  }
}

//conc state
class OnState implements LightState {
  @override
  void pressSwitch(LightContext context) {
    print("Лампочка вимкнена.");
    context.state = OffState();
  }
}

//context
class LightContext {
  LightState state;

  LightContext(this.state);

  void pressSwitch() {
    state.pressSwitch(this);
  }
}

void main() {
  final light = LightContext(OffState());

  light.pressSwitch();
  light.pressSwitch();
  light.pressSwitch();
}
