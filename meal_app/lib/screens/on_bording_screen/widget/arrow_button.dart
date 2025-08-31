import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_app/core/routing/app_routs.dart';
import 'package:meal_app/core/themes/app_colors.dart';

class ArrowButton extends StatelessWidget {
  const ArrowButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => GoRouter.of(
          context,
        ).pushReplacementNamed(AppRoutes.homeScreen),
        child: Container(
          width: 62.w,
          height: 62.h,
          decoration: BoxDecoration(
            color: AppColors.secondary,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.arrow_forward,
            color: AppColors.primary,
            size: 32.sp,
          ),
        ),
      );
  }
}
