import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_app/core/themes/app_text_styling.dart';

class CustomTitleWidget extends StatelessWidget {
   CustomTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => GoRouter.of(context).pop(),
          child: Container(
            width: 36.w,
            height: 36.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(color: Color(0xffEDEDED), width: 1),
            ),
            child: Icon(Icons.arrow_back, color: Colors.black, size: 25.sp),
          ),
        ),
        SizedBox(width: 91.w),

        Text('Add Meal', style: AppTextStyling.blackMedium16),
      ],
    );
  }
}
