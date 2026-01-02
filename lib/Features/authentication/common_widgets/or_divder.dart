import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  final String text;
  final Color? color;
  final double thickness;
  final double fontSize;
  final double spacing;

  const OrDivider({
    super.key,
    this.text = "Or",
    this.color=const Color(0xFF9C9FA6),
    this.thickness = 1,
    this.fontSize = 12,
    this.spacing = 8,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: color,
            thickness: thickness,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: spacing),
          child: Text(
            text,
            style: TextStyle(
              color: color,
              fontSize: fontSize,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: color,
            thickness: thickness,
          ),
        ),
      ],
    );
  }
}
