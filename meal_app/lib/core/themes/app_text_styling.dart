import 'package:flutter/widgets.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_app/core/themes/app_colors.dart';

class AppTextStyling {
  static  TextStyle headLineTitle = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.secondary,
  );
  static TextStyle blackMedium16 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor,
  );
  static TextStyle whiteRegular14 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.secondary,
  );
}
