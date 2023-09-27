import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final List<Shadow> shadows;
  final String text;
  final double fontSize;
  const CustomText({
    super.key,
    required this.text,
    required this.fontSize,
    required this.shadows,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: fontSize,
        shadows: shadows,
      ),
    );
  }
}
