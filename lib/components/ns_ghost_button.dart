import 'package:flutter/material.dart';

class NSGhostButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color foregroundColor;

  const NSGhostButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
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
