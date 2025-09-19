import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final bool obscure;

  const CustomInput({
    super.key,
    required this.hint,
    required this.controller,
    this.obscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      style: const TextStyle(color: Color(0xFFFFFFFF)),
      decoration: InputDecoration(hintText: hint),
    );
  }
}
