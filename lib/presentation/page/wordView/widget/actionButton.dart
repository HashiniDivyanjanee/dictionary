import 'package:flutter/material.dart';

class buildActionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  const buildActionButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.3), width: 1),
      ),
      child: IconButton(onPressed: onPressed, icon: Icon(icon,color: Colors.white,)),
    );
  }
}
