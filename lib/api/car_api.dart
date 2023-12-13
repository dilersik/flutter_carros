import 'package:carros/domain/car.dart';

class CarApi {
  static Future<List<Car>> getCars() async {
    final cars = List<Car>.empty(growable: true);

    await Future.delayed(const Duration(seconds: 2));

    cars.add(Car(name: "Tucker 1948", photoUrl: "https://storage.googleapis.com/carros-flutterweb.appspot.com/tucker-1948.jpeg"));
    cars.add(Car(name: "Chevrolet Bel-Air", photoUrl: "https://storage.googleapis.com/carros-flutterweb.appspot.com/tucker-1948.jpeg"));
    cars.add(Car(name: "Maserati Grancabrio Sport", photoUrl: "https://storage.googleapis.com/carros-flutterweb.appspot.com/tucker-1948.jpeg"));
    return cars;
  }
}