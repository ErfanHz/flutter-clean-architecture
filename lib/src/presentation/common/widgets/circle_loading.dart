import 'package:clean_base/src/config/themes/app_colors.dart';
import 'package:flutter/material.dart';

Widget circleLoading({
  double? size,
}) {
  return Material(
    color: Colors.transparent,
    child: Center(
      child: SizedBox(
        width: size,
        height: size,
        child: const CircularProgressIndicator(
          color: AppColors.primary_500,
        ),
      ),
    ),
  );
}
