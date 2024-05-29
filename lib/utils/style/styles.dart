import 'package:digicala_test1/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class AppStyles {
  // ignore: constant_identifier_names
  static const TextStyle itemGrouping =
      TextStyle(fontFamily: 'SB', color: AppColors.darkApp, fontSize: 12);
  static const TextStyle itemPric = TextStyle(
    fontFamily: 'SM',
    color: AppColors.whiteApp,
    fontSize: 12,
    decoration: TextDecoration.lineThrough,
  );
  static const TextStyle itemNewPric =
      TextStyle(fontFamily: 'SM', color: AppColors.whiteApp, fontSize: 16);
  static const TextStyle customStyleFont =
      TextStyle(fontFamily: 'SM', color: AppColors.whiteApp, fontSize: 12);
}
