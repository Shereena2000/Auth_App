import 'package:flutter/material.dart';

import '../constants/text_styles.dart';
import '../utils/p_colors.dart';



class CustomElavatedTextButton extends StatelessWidget {
  const CustomElavatedTextButton({
    super.key,
    this.onPressed,
    required this.text,
    this.width,
    this.height,
    this.padverticle,
    this.padhorizondal,
    this.fontSize,
    this.bgcolor,
    this.borderRadius,
    this.textColor,
    this.borderColor,
  });

  final void Function()? onPressed;
  final String text;
  final double? width;
  final double? height;
  final double? fontSize;
  final double? padverticle;
  final double? padhorizondal;
  final Color? bgcolor;
  final double? borderRadius;
  final Color? borderColor;

  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: bgcolor ?? PColors.primaryColor,
        foregroundColor: PColors.primaryColor,
        padding: EdgeInsets.symmetric(
          vertical: padverticle ?? 8,
          horizontal: padhorizondal ?? 16,
        ),
        fixedSize: Size(width ?? size.width - 40, height ?? 45),
        maximumSize: Size(width ?? size.width - 40, height ?? 45),
        minimumSize: Size(width ?? size.width - 40, height ?? 45),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: borderColor ?? PColors.primaryColor),
          borderRadius: BorderRadius.circular(borderRadius ?? 12),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: getTextStyle(
          fontSize: fontSize ?? 14,
          color: textColor??PColors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
