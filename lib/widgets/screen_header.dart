import 'package:flutter/material.dart';

class ScreenHeader extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final MaterialColor color; // Se cambia el tipo de dato a MaterialColor

  const ScreenHeader({
    Key? key,
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            color.shade50, // Ahora funciona
            Colors.white,
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.shade200), // Ahora funciona
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: 48,
            color: color.shade600, // Ahora funciona
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: color.shade700, // Ahora funciona
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade600,
              height: 1.4,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}