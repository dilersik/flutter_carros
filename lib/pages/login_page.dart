import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _tUser = TextEditingController();
  final _tPwd = TextEditingController();

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
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          _textFormField("Username", "Type your Login name",
              controller: _tUser),
          const SizedBox(
            height: 10,
          ),
          _textFormField("Password", "Type your Password",
              password: true, controller: _tPwd),
          const SizedBox(
            height: 20,
          ),
          _elevatedButton("Login", () => _onClickLogin())
        ],
      ),
    );
  }

  _elevatedButton(String label, onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        padding: const EdgeInsets.all(12),
      ),
      child: Text(label),
    );
  }

  _textFormField(String label, String hint, {password = false, controller}) {
    return TextFormField(
      controller: controller,
      obscureText: password,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
      ),
    );
  }

  _onClickLogin() {
    String user = _tUser.text;
    String pwd = _tPwd.text;
    print("$user ; $pwd");
  }
}
