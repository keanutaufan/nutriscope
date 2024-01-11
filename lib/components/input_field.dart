import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String placeholder;
  final IconData icon;
  final bool? obscureText;
  final TextEditingController? controller;

  const InputField({
    super.key,
    required this.placeholder,
    required this.icon,
    this.obscureText,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 1,
      controller: controller,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        hintText: placeholder,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: EdgeInsets.zero,
        prefixIcon: Icon(icon),
        prefixIconColor: const Color.fromRGBO(194, 194, 194, 1),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
