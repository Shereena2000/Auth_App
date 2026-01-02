import 'package:flutter/material.dart';

import '../../../Settings/utils/p_colors.dart';

class AuthSwitchText extends StatelessWidget {
  final String prefixText;
  final String actionText;
  final VoidCallback onTap;
  final Color? prefixColor;
  final Color? actionColor;

  const AuthSwitchText({
    super.key,
    required this.prefixText,
    required this.actionText,
    required this.onTap,
    this.prefixColor,
    this.actionColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          prefixText,
          style: TextStyle(
            color: prefixColor ?? Colors.grey,
          ),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            actionText,
            style: TextStyle(
              color: actionColor ?? PColors.primaryColor,
              decoration: TextDecoration.underline,
              decorationColor:
                  actionColor ?? PColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
