import 'package:flutter/material.dart';

class NSOutlineButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color outlineColor;
  final Color foregroundColor;

  const NSOutlineButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.outlineColor,
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
            side: BorderSide(
              color: outlineColor,
              width: 1,
            ),
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
