// class MetricSystem {
//   final double distanceInMeter;

//   MetricSystem(this.distanceInMeter);

//   getDinaceInMeters() {
//     return distanceInMeter;
//   }
// }

// class ImperialSystem {
//   final double distanceInFt;

//   ImperialSystem(this.distanceInFt);

//   getDinaceInFt() {
//     return distanceInFt;
//   }
// }

// class FeetToMeterAdapter {
//   final ImperialSystem imperialSystem;

//   FeetToMeterAdapter(this.imperialSystem);

//   double getDinaceInMeters() {
//     return imperialSystem.getDinaceInFt() / 3.2808;
//   }
// }

// void main() {
//   final metric = MetricSystem(100);
//   print(metric.getDinaceInMeters());
//   final imperial = ImperialSystem(50);
//   print(imperial.getDinaceInFt());
//   final adapter = FeetToMeterAdapter(imperial);
//   print(adapter.getDinaceInMeters());
// }

abstract class User {
  void getName();
  void getAge();
}

class FirstUserFromApi {
  final String name;
  final int age;

  FirstUserFromApi({required this.name, required this.age});
}

class SecondUserFromApi {
  final String fullName;
  final int yearsOld;

  SecondUserFromApi({required this.fullName, required this.yearsOld});
}

class FirstUserFromApiAdapter implements User {
  final FirstUserFromApi user;

  FirstUserFromApiAdapter(this.user);

  @override
  int getAge() {
    return user.age;
  }

  @override
  String getName() {
    return user.name;
  }
}

class SecondUserFromApiAdapter implements User {
  final SecondUserFromApi user;

  SecondUserFromApiAdapter(this.user);

  @override
  int getAge() {
    return user.yearsOld;
  }

  @override
  String getName() {
    return user.fullName;
  }
}

void main() {
  final api1 = FirstUserFromApi(age: 10, name: 'Asos Sosa');
  final api2 = SecondUserFromApi(fullName: 'Sosa Asos', yearsOld: 15);

  final api1Adapter = FirstUserFromApiAdapter(api1);
  final api2Adapter = SecondUserFromApiAdapter(api2);

  print(api1Adapter.getAge());
  print(api2Adapter.getAge());
}
