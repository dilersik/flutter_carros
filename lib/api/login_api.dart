import 'dart:convert';
import 'package:carros/domain/user.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  static Future<User?> login(String user, String pwd) async {
    // final url = Uri.https('carros.free.beeceptor.com', 'login');
    final url = Uri.https('carros-springboot.herokuapp.com', 'api/v2/login');
    final headers = {"Content-Type": "application/json"};
    final params = {'username': user, 'password': pwd};
    final string = json.encode(params);
    print("Request: $string");

    var response = await http.post(url, body: string, headers: headers);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    final mapResponse = json.decode(response.body);

    if (response.statusCode == 200) {
      return User.fromMap(mapResponse);
    } else {
      return null;
    }
  }
}
