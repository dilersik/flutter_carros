import 'dart:convert';

import 'package:carros/domain/car.dart';
import 'package:http/http.dart' as http;

class CarApi {
  static Future<List<Car>> getCars() async {
    final url = Uri.https('carros-springboot.herokuapp.com', 'api/v1/carros');
    final response = await http.get(url);

    final List list = json.decode(response.body);
    final cars = List<Car>.empty(growable: true);

    for (Map map in list) {
      Car c = Car.fromJson(map);
      cars.add(c);
    }

    return cars;
  }
}
