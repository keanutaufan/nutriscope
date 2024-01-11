import 'package:flutter/material.dart';

class IngredientListItem extends StatelessWidget {
  final String label;
  final int status;

  final VoidCallback? onTapAllow;
  final VoidCallback? onTapWarn;
  final VoidCallback? onTapInfo;

  const IngredientListItem({
    super.key,
    required this.label,
    required this.status,
    this.onTapAllow,
    this.onTapWarn,
    this.onTapInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: const Color.fromRGBO(194, 194, 194, 1),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Label
          Text(
            label,
            style: const TextStyle(
              color: Colors.black,
              fontFamily: "Montserrat",
              fontSize: 16,
            ),
          ),

          // Buttons
          Row(
            children: [
              // Allow
              GestureDetector(
                onTap: onTapAllow,
                child: Icon(
                  Icons.check_circle,
                  color: (status == 0)
                      ? const Color.fromRGBO(27, 68, 49, 1)
                      : const Color.fromRGBO(194, 194, 194, 1),
                ),
              ),

              const SizedBox(width: 8),

              // Warn
              GestureDetector(
                onTap: onTapWarn,
                child: Icon(
                  Icons.warning,
                  color: (status == 1)
                      ? const Color.fromRGBO(27, 68, 49, 1)
                      : const Color.fromRGBO(194, 194, 194, 1),
                ),
              ),

              const SizedBox(width: 8),

              // Info
              GestureDetector(
                onTap: onTapInfo,
                child: const Icon(
                  Icons.info_outline,
                  color: Color.fromRGBO(25, 80, 87, 1),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
