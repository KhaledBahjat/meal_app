import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_app/core/themes/app_colors.dart';

class CustomFloatingActcionButtonWidget extends StatelessWidget {
  const CustomFloatingActcionButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 60.w,
        height: 60.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.primary, width: 2),
        ),
        child: Icon(Icons.add, color: AppColors.primary, size: 32.sp),
      ),
    );
  }
}
