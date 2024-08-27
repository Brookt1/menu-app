import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton(
      {super.key,
      required this.text,
      this.width = 170,
      this.height = 50,
      this.color = Colors.white,
      this.backgroundColor = const Color(0xFFFF6347),
      this.onPressed});
  final String text;
  final Color color;
  final double width;
  final double height;
  final Color backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith(
          (states) {
            return backgroundColor;
          },
        ),
        side: WidgetStateProperty.resolveWith(
          (states) {
            return BorderSide(color: color);
          },
        ),
        foregroundColor: WidgetStateProperty.resolveWith(
          (states) {
            return color;
          },
        ),
        shape: WidgetStateProperty.resolveWith<OutlinedBorder>((states) {
          return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          );
        }),
        fixedSize: WidgetStateProperty.resolveWith(
          (state) {
            return Size(width, height);
          },
        ),
      ),
      child: Row(children: [
        Icon(Icons.shopify_rounded),
        Text(
          text,
        ),
      ]),
    );
  }
}
