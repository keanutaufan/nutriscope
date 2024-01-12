import 'package:flutter/material.dart';

class TwoSwitcher extends StatelessWidget {
  final String firstLabel;
  final String secondLabel;
  final int activeIndex;
  final VoidCallback onFirstPressed;
  final VoidCallback onSecondPressed;

  const TwoSwitcher({
    super.key,
    required this.firstLabel,
    required this.secondLabel,
    required this.activeIndex,
    required this.onFirstPressed,
    required this.onSecondPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      width: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onFirstPressed,
            child: Container(
              width: 120,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: activeIndex == 0
                    ? Theme.of(context).primaryColor
                    : Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                "Daftar",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: activeIndex == 0
                      ? Colors.white
                      : Theme.of(context).primaryColor,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: onSecondPressed,
            child: Container(
              width: 120,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: activeIndex == 1
                    ? Theme.of(context).primaryColor
                    : Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                "Masuk",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: activeIndex == 1
                      ? Colors.white
                      : Theme.of(context).primaryColor,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
