import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle inter(double size, FontWeight weight, Color color, {double? height}) {
  return GoogleFonts.inter(
    fontSize: size,
    fontWeight: weight,
    color: color,
    height: height,
  );
}
