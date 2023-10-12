import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();
  final _tUser = TextEditingController(text: "diler");
  final _tPwd = TextEditingController(text: "1234");
  final _focusPwd = FocusNode();

  @override
  void initState() {
    super.initState();
  }

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
              nextFocus: _focusPwd,
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
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              focusNode: _focusPwd,
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

  _textFormField(String label,
      String hint,
      FormFieldValidator<String?> validator,
      TextEditingController controller, {
        password = false,
        TextInputType keyboardType = TextInputType.text,
        TextInputAction textInputAction = TextInputAction.next,
        FocusNode? focusNode,
        FocusNode? nextFocus,
      }) {
    return TextFormField(
      controller: controller,
      obscureText: password,
      validator: validator,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      focusNode: focusNode,
      onFieldSubmitted: (String text) {
        if (nextFocus != null) {
          FocusScope.of(this.context).requestFocus(_focusPwd);
        }
      },
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
