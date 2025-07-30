import 'package:flutter/material.dart';

class SkyRow extends StatelessWidget {
  final VoidCallback onTap;
  const SkyRow({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: IconButton(
        iconSize: 36,
        splashRadius: 24,
        color: Colors.white,
        icon: const Icon(Icons.star),
        onPressed: onTap,
      ),
    );
  }
}
