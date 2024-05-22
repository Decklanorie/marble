import 'package:google_fonts/google_fonts.dart';
import 'package:marble/src/core/utils/size_utils.dart';
import 'package:flutter/material.dart';
import '../colors.dart';

class MarbleTypography {
  MarbleTypography._();
  static const String? primaryfontName = null;
  static TextStyle normalTextStyle = GoogleFonts.poppins(
      textStyle: TextStyle(
    fontFamily: primaryfontName,
    fontSize: 16.fSize,
      letterSpacing: .03,
    color: MarbleColors.black,
    fontWeight: FontWeight.w600
  ));
  static TextStyle introTextStyle = GoogleFonts.poppins(
      textStyle: TextStyle(
    fontFamily: primaryfontName,
    fontSize: 26.fSize,
      letterSpacing: .03,
    color: MarbleColors.grey,
    fontWeight: FontWeight.w400
  ));
  static TextStyle bigIntroTextStyle = GoogleFonts.poppins(
     textStyle: TextStyle(
          fontFamily: primaryfontName,
          fontSize: 36.fSize,
          letterSpacing: .03,
          color: MarbleColors.black,
          fontWeight: FontWeight.w400,
          height: 1.2
      )
  );
  static TextStyle titleTextStyle = GoogleFonts.poppins(
      textStyle: TextStyle(
      fontFamily: primaryfontName,
      color: MarbleColors.grey,
      fontSize: 16.fSize,
      fontWeight: FontWeight.w600
  ));
  static TextStyle titleTextStyle2 = GoogleFonts.poppins(
      textStyle: TextStyle(
      fontFamily: primaryfontName,
      color: MarbleColors.grey,
      fontSize: 16.fSize,
      fontWeight: FontWeight.w600,
    letterSpacing: .03
  ));

}
