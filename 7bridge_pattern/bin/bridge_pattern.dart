abstract class Device {
  isEnabled();
  enable();
  disable();
  getVolume();
  setVolume(int percent);
}

class Radio implements Device {
  bool _enabled = false;
  int _defaultVolume = 10;

  @override
  disable() => _enabled = true;

  @override
  enable() => _enabled = false;

  @override
  getVolume() => _defaultVolume;

  @override
  isEnabled() => _enabled;

  @override
  setVolume(int percent) {
    return _defaultVolume = percent;
  }
}

class TV implements Device {
  bool _enabled = false;
  int _defaultVolume = 10;

  @override
  disable() => _enabled = true;

  @override
  enable() => _enabled = false;

  @override
  getVolume() => _defaultVolume;

  @override
  isEnabled() => _enabled;

  @override
  setVolume(int percent) {
    return _defaultVolume = percent;
  }
}

class Remote {
  final Device device;

  Remote(this.device);

  togglePower() {
    if (device.disable() == true) {
      return ('device on');
    } else {
      return ('device off');
    }
  }

  volumeDown() => device.setVolume(device.getVolume() - 10);

  volumeUP() {
    return (device.setVolume(device.getVolume() + 10));
  }
}

class AdvencedRemote extends Remote {
  AdvencedRemote(super.device);

  mute() {
    return device.setVolume(0);
  }
}

void main() {
  Device tv = TV();
  final tvRemote = Remote(tv);
  final advancedRemote = AdvencedRemote(tv);
  print(tv.setVolume(15));
  print(tvRemote.volumeDown());
  print(tvRemote.volumeUP());
  print(advancedRemote.mute());
  print(tvRemote.volumeUP());

  Device radio = Radio();
  final radioRemote = Remote(radio);
  print(radioRemote.volumeDown());
}
