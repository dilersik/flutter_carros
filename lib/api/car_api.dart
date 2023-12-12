import 'package:carros/domain/car.dart';

class CarApi {
  static List<Car> getCars() {
    final cars = List<Car>.empty(growable: true);
    cars.add(Car(name: "Tucker 1948", photoUrl: "https://storage.googleapis.com/carros-flutterweb.appspot.com/tucker-1948.jpeg"));
    cars.add(Car(name: "Chevrolet Bel-Air", photoUrl: "https://storage.googleapis.com/carros-flutterweb.appspot.com/tucker-1948.jpeg"));
    cars.add(Car(name: "Maserati Grancabrio Sport", photoUrl: "https://storage.googleapis.com/carros-flutterweb.appspot.com/tucker-1948.jpeg"));
    return cars;
  }
}