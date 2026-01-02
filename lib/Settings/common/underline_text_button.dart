import 'package:flutter/material.dart';

import '../utils/p_colors.dart';

class UnderlineTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? color;
  final double fontSize;

  const UnderlineTextButton({
    super.key,
    required this.text,
    required this.onTap,
    this.color,
    this.fontSize = 12,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          color: color ?? PColors.primaryColor,
          decoration: TextDecoration.underline,
          decorationColor: color ?? PColors.primaryColor,
        ),
      ),
    );
  }
}
