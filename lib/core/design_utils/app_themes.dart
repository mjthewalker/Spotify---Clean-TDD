



import 'package:flutter/material.dart';
import 'package:spotify/core/design_utils/app_colors.dart';

enum AppTheme{
    Light,
    Dark,
    SystemDefault
}

final appThemeData = {
  AppTheme.Light :ThemeData(
        primaryColor: AppColors.spotifyGreen,
        scaffoldBackgroundColor: AppColors.spotifyWhite,
  ),
  AppTheme.Dark :ThemeData(
    primaryColor: AppColors.spotifyGreen,
    scaffoldBackgroundColor: AppColors.spotifyDark,
  )
};