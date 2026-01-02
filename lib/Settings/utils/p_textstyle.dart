
import 'package:flutter/material.dart';

import '../constants/text_styles.dart';
import 'p_colors.dart';


class PTextStyles {
  static TextStyle get displayLarge => getTextStyle(
    color: PColors.white,
    fontSize: 32,
    fontWeight: FontWeight.w600,
  );
   static TextStyle get displayMedium => getTextStyle(
    color: PColors.white,
    fontSize: 26,
    fontWeight: FontWeight.w500,
  );
    static TextStyle get displaySmall => getTextStyle(
    color: PColors.white,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
   static TextStyle get headingSmall => getTextStyle(
        fontSize: 14,
        color: PColors.white,
        fontWeight: FontWeight.w500,
      );
       static TextStyle get headingMedium => getTextStyle(
        fontSize: 15,
        color: PColors.white,
        fontWeight: FontWeight.w600,
      );
       static TextStyle get bodySmall => getTextStyle(
    color: PColors.white,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
     static TextStyle get bodyMedium => getTextStyle(
        fontSize: 20,
        color: PColors.white,
        fontWeight: FontWeight.w600,
      );
}