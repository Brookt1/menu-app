import 'package:flutter/material.dart';

class BackButtonWidget extends StatelessWidget {
  final Color iconColor;
  final VoidCallback? onTap;

  const BackButtonWidget.backButtonWidget({
    super.key,
    required this.iconColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        // padding: const EdgeInsets.only(left: 8),
        width: 30,
        height: 30,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFF615554),
        ),
        child: Icon(
          Icons.arrow_back,
          color: iconColor,
          size: 20,
        ),
      ),
    );
  }
}
