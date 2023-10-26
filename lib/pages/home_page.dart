import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Carros Home"),
      ),
      body: _body(),
    );
  }

  _body() {
    return const Center(
      child: Text(
        "Opa",
        style: TextStyle(
          fontSize: 22,
        ),
      ),
    );
  }
}