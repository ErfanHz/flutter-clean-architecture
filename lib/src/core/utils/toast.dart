import 'package:clean_base/src/config/themes/app_colors.dart';
import 'package:clean_base/src/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(
  BuildContext context,
  String txt,
) {
  FToast fToast = FToast();
  fToast.init(context);

  Widget toast = Align(
    alignment: Alignment.center,
    child: Container(
      constraints: const BoxConstraints(minWidth: 150),
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Text(
        txt,
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
        style: const TextStyle(
          color: AppColors.whiteColor,
          height: 1.4,
        ),
      ),
    ),
  );

  fToast.showToast(
    child: toast,
    gravity: ToastGravity.TOP,
    toastDuration: const Duration(milliseconds: Constants.toastDuration),
  );
}
