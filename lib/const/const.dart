import 'package:flutter/material.dart';
// --- App Colors ---
class AppColors {
  static const Color black = Colors.black;
  static const Color white = Colors.white;
  static const Color grey = Colors.grey;
}

// --- App Text Styles ---
class AppTextStyles {
  static const TextStyle title = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );
  static const TextStyle subtitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
  );
  static const TextStyle body = TextStyle(
    fontSize: 14,
    color: AppColors.black,
  );

  static var button;

  static var largeTitle;
}