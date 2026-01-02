import 'package:flutter/material.dart';

import '../constants/text_styles.dart';
import '../utils/p_colors.dart';


class CustomOutlineButton extends StatelessWidget {
  final String text;
  final double? width;
  final double? heigth;
  final double? borderRaduis;
  final Color? bgcolor;
  final Color? bordercolor;
  final Color? forgcolor;
  final double? padverticle;
  final double? padhorizondal;
  final Function() onPressed;
  final double? fontSize;

  // ✅ NEW
  final Widget? leading;

  const CustomOutlineButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.width,
    this.heigth,
    this.bordercolor,
    this.forgcolor,
    this.borderRaduis,
    this.padverticle,
    this.padhorizondal,
    this.bgcolor,
    this.fontSize,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return ElevatedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: bgcolor ?? const Color(0xFF261B1B),
        foregroundColor: forgcolor ?? const Color(0xFFB0999C),
        minimumSize: Size(width ?? size.width - 32, heigth ?? 45),
        side: BorderSide(width: 1, color: bordercolor ?? Color(0xFFCB3A31)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRaduis ?? 12),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (leading != null) ...[
            leading!,
            const SizedBox(width: 8),
          ],
          Text(
            text,
            style: getTextStyle(
              fontSize: fontSize ?? 13,
              color: PColors.primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
