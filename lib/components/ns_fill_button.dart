import 'package:flutter/material.dart';

class NSFillButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color foregroundColor;

  const NSFillButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
    required this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateColor.resolveWith(
          (states) => backgroundColor,
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: foregroundColor,
          fontFamily: "Montserrat",
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
