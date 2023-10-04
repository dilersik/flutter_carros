import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _formKey = GlobalKey<FormState>();
  final _tUser = TextEditingController(text: "diler");
  final _tPwd = TextEditingController(text: "1234");

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
    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            _textFormField(
              "Username",
              "Type your Login name",
              _validateUser,
              _tUser,
            ),
            const SizedBox(
              height: 10,
            ),
            _textFormField(
              "Password",
              "Type your Password",
              _validatePwd,
              _tPwd,
              password: true,
            ),
            const SizedBox(
              height: 20,
            ),
            _elevatedButton("Login", () => _onClickLogin())
          ],
        ),
      ),
    );
  }

  String? _validatePwd(String? text) {
    if (text == null || text.isEmpty == true) {
      return "Pwd required.";
    }
    if (text.length < 4) {
      return "Pwd requires at least 4 chars.";
    }
    return null;
  }

  String? _validateUser(String? text) {
    if (text?.isEmpty == true) {
      return "Required.";
    }
    return null;
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

  _textFormField(String label, String hint,
      FormFieldValidator<String?> validator, TextEditingController controller,
      {password = false}) {
    return TextFormField(
      controller: controller,
      obscureText: password,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
      ),
    );
  }

  _onClickLogin() {
    if (_formKey.currentState?.validate() != true) {
      return;
    }

    String user = _tUser.text;
    String pwd = _tPwd.text;
    print("$user ; $pwd");
  }
}
