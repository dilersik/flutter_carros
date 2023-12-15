import 'dart:convert';

import 'package:carros/domain/car.dart';
import 'package:http/http.dart' as http;

class CarType  {
  static const String classic = "classicos";
  static const String sport = "esportivos";
  static const String lux = "luxo";
}

class CarApi {
  static Future<List<Car>> getCars(String carType) async {
    final url = Uri.https('carros-springboot.herokuapp.com', 'api/v1/carros/tipo/$carType');
    final response = await http.get(url);

    return json.decode(response.body).map((e) => Car.fromJson(e)).toList();
  }
}
