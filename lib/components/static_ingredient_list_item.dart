import 'package:flutter/material.dart';

class StaticIngredientListItem extends StatelessWidget {
  final String label;
  final String id;
  final int status;

  final VoidCallback? onTapInfo;

  const StaticIngredientListItem({
    super.key,
    required this.id,
    required this.label,
    required this.status,
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
              // Status
              Icon(
                status == 0 ? Icons.check_circle : Icons.warning,
                color: (status == 0)
                    ? const Color.fromRGBO(27, 68, 49, 1)
                    : const Color.fromRGBO(255, 215, 0, 1),
              ),

              const SizedBox(width: 10),

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
