import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/p_colors.dart';


TextStyle getTextStyle({
  double? fontSize,
  FontWeight? fontWeight,
  Color? color,
  double? letterSpacing,
  double? height,
  TextDecoration? decoration,
}) {
  return GoogleFonts.getFont('Poppins',
      color: color??Colors.black,
      fontSize: fontSize,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      height: height,
      decoration: decoration);
}


TextStyle getShadowsIntoLightTextStyle({
 
  double fontSize = 28,
 FontWeight fontWeight = FontWeight.w900,
  Color? color,
  double? letterSpacing,
  double? height,
  TextDecoration? decoration,
}) {
  return GoogleFonts.indieFlower(
    fontSize: fontSize,
   fontWeight: fontWeight,
    color: color ??PColors.primaryColor,
    letterSpacing: letterSpacing,
    height: height,
    decoration: decoration,
  );
}

