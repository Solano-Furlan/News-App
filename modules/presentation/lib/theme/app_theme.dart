import 'package:flutter/material.dart';
import 'package:presentation/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';

final appTheme = ThemeData(
  textTheme: GoogleFonts.interTextTheme().copyWith(
    headline2: const TextStyle(
      color: Colors.black,
      fontSize: 28,
      fontWeight: FontWeight.bold,
    ),
    labelMedium: TextStyle(
      color: Colors.grey.shade100,
      fontSize: 20,
    ),
  ),
  scaffoldBackgroundColor: AppColors.white,
  primaryColor: AppColors.primaryColor,
  primaryColorLight: AppColors.primaryColor,
  primaryColorDark: AppColors.primaryColor,
  primarySwatch: AppColors.primarySwatch,
);
