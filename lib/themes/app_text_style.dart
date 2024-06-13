import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './app_colors.dart';

class AppTextStyles {
  // Colors configurations

  static textStyleNormal1(double fontSize) {
    return TextStyle(
      color: const Color(0xff7589a2),
      fontWeight: FontWeight.normal,
      fontSize: fontSize,
    );
  }

  static titleNormal(Color color, double fontSize) {
    return GoogleFonts.poppins(
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
      color: color,
    );
  }

  static titleMedium(Color color, double fontSize) {
    return GoogleFonts.poppins(
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
      color: color,
    );
  }

  static titleSemiBold(Color color, double fontSize) {
    return GoogleFonts.poppins(
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static titleBold(Color color, double fontSize) {
    return GoogleFonts.poppins(
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color: color,
    );
  }

  static final titleHome = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.heading,
  );

  static final titleRegular = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.heading,
  );

  static final secondaryTitle = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.hintText,
  );

  static final secondaryTitleWithe = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );

  static final titleRegular13 = GoogleFonts.poppins(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.heading,
  );

  static final titleRegular12 = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: AppColors.heading,
  );

  static final iconTitle = GoogleFonts.poppins(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: AppColors.input,
  );
  static final primaryIconTitle = GoogleFonts.poppins(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: AppColors.primary,
  );

  static final primaryTitle = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.primary,
  );

  static final titlelabelwithe10 = GoogleFonts.poppins(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: AppColors.background,
  );

  static final titleRegularWithe = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.background,
  );

  static final titleRegularWitheBold = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColors.background,
  );

  static final titleRegularprimaryShape = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryShape,
  );

  static final titleRegularBlackBold = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.blackShape2,
  );

  static final titleRegularBlack13 = GoogleFonts.poppins(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.blackShape2,
  );

  static final titleRegularShape = GoogleFonts.poppins(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.shape,
  );

  static final titleBoldBackground = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.background,
  );

  static final titleBoldBlack = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    color: AppColors.blackShape1,
  );

  static final tabTitxeRegularOn = GoogleFonts.poppins(
      fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.primary);

  static final tabTitxeRegularOf = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.shape2,
  );
}
