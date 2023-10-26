import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool password;
  final FormFieldValidator<String?> validator;
  final String hint;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;

  const AppText(
    this.label,
    this.hint,
    this.validator,
    this.controller, {
    super.key,
    this.focusNode,
    this.nextFocus,
    this.password = true,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: password,
      validator: validator,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      focusNode: focusNode,
      onFieldSubmitted: (String text) {
        if (nextFocus != null) {
          FocusScope.of(context).requestFocus(nextFocus);
        }
      },
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
      ),
    );
  }
}
