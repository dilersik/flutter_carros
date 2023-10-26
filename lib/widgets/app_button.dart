import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {

  final String label;
  final VoidCallback onPressed;

  const AppButton(this.label, this.onPressed, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        padding: const EdgeInsets.all(12),
      ),
      child: Text(label),
    );
  }
}