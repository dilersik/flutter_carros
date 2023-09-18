import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Cars",
          ),
          centerTitle: true,
        ),
        body: _body());
  }

  _body() {
    return Container(
      color: Colors.white,
    );
  }
}
