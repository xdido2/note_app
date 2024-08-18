import 'package:flutter/material.dart';
import 'package:note_app/ui/theme/app_colors.dart';

abstract final class AppTextStyle {
  static const TextStyle noteTitle = TextStyle(
    color: AppColors.primaryTextColor,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 19 / 16,
  );
  static const TextStyle noteDate = TextStyle(
    color: Color.fromRGBO(202, 196, 208, 1),
    fontSize: 14,
    height: 20 / 14,
  );
  static const TextStyle noteDescr = TextStyle(
    color: AppColors.secondaryTextColor,
    fontSize: 14,
  );
}
