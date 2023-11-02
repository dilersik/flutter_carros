import 'package:carros/api/login_api.dart';
import 'package:carros/pages/home_page.dart';
import 'package:carros/utils/alert.dart';
import 'package:carros/utils/nav.dart';
import 'package:carros/widgets/app_button.dart';
import 'package:carros/widgets/app_text.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _tUser = TextEditingController(text: "admin");
  final _tPwd = TextEditingController(text: "123");
  final _focusPwd = FocusNode();
  bool _showProgress = false;

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
            AppText(
              "Username",
              "Type your Login name",
              _validateUser,
              _tUser,
              nextFocus: _focusPwd,
            ),
            const SizedBox(
              height: 10,
            ),
            AppText(
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
            AppButton(
              "Login",
              () => _onClickLogin(),
              showProgress: _showProgress,
            ),
          ],
        ),
      ),
    );
  }

  String? _validatePwd(String? text) {
    if (text == null || text.isEmpty == true) {
      return "Pwd required.";
    }
    if (text.length < 3) {
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

  _onClickLogin() async {
    if (_formKey.currentState?.validate() != true) {
      return;
    }

    setState(() {
      _showProgress = true;
    });

    final response = await LoginApi.login(_tUser.text, _tPwd.text);
    if (response.ok) {
      final user = response.result;
      print(">>>> $user");
      if (context.mounted) {
        push(context, const HomePage(), replace: true);
      }
    } else {
      if (context.mounted) {
        alert(context, "Login failed!", response.msg);
      }
    }

    setState(() {
      _showProgress = false;
    });
  }
}
