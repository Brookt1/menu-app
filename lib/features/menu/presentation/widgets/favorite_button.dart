import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  final Color iconColor;
  final VoidCallback? onTap;
  final double width;
  final double height;

  const FavoriteButton.favoriteButton(
      {super.key,
      required this.iconColor,
      this.onTap,
      this.width = 30,
      this.height = 30});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(8),
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Icon(
          Icons.favorite_border_outlined,
          color: iconColor,
          size: 20,
        ),
      ),
    );
  }
}
