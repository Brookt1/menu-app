import 'package:flutter/material.dart';

class CustomIconsButton extends StatelessWidget {
  final Color iconColor;
  final VoidCallback? onTap;
  final Icon icon;

  const CustomIconsButton({
    super.key,
    required this.iconColor,
    this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 45,
        height: 45,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: icon, // Centered by default within the Container
      ),
    );
  }
}
