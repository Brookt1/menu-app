import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final String fontFamily;
  final TextDecoration? decoration;
  final int maxLines;

  const CustomText({
    super.key,
    required this.text,
    this.color = Colors.black,
    this.fontSize = 14.0,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.left,
    this.fontFamily = '',
    this.decoration,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
        decoration: decoration,
      ),
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
    );
  }
}
