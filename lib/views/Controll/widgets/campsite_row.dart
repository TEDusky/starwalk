import 'package:flutter/material.dart';

class CampsiteRow extends StatelessWidget {
  final VoidCallback onMoonTap;
  const CampsiteRow({super.key, required this.onMoonTap});

  @override
  Widget build(BuildContext context) {
    const icons = [
      Icons.phone,
      Icons.local_fire_department,
      Icons.nightlight_round,
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: icons.map((icon) {
          return IconButton(
            iconSize: 36,
            splashRadius: 24,
            color: Colors.white,
            icon: Icon(icon),
            onPressed: () {
              if (icon == Icons.nightlight_round) {
                onMoonTap();
              } else {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('Tapped $icon')));
              }
            },
          );
        }).toList(),
      ),
    );
  }
}
