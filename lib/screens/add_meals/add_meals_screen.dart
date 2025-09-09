import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_app/core/themes/app_colors.dart';
import 'package:meal_app/core/themes/app_text_styling.dart';

class AddMealsScreen extends StatefulWidget {
  const AddMealsScreen({super.key});

  @override
  State<AddMealsScreen> createState() => _AddMealsScreenState();
}

class _AddMealsScreenState extends State<AddMealsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: CustomTitleWidget(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Meal Name', style: AppTextStyling.blackMedium16),
              SizedBox(height: 8.sp),
              CustomTextField(),
              SizedBox(height: 12.h),
              Text('Image URL', style: AppTextStyling.blackMedium16),
              SizedBox(height: 8.sp),
              CustomTextField(contentPadding: EdgeInsets.all(32.sp)),
              SizedBox(height: 12.h),
              Text('Rate', style: AppTextStyling.blackMedium16),
              SizedBox(height: 8.sp),
              CustomTextField(),
              SizedBox(height: 12.h),
              Text('Time', style: AppTextStyling.blackMedium16),
              SizedBox(height: 8.sp),
              CustomTextField(),
              SizedBox(height: 12.h),
              Text('Description', style: AppTextStyling.blackMedium16),
              SizedBox(height: 8.sp),
              CustomTextField(contentPadding: EdgeInsets.all(32.sp)),
              SizedBox(height: 70.h),
              Container(
                width: 327.w,
                height: 52.h,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: Center(
                  child: Text('Add Meal', style: AppTextStyling.whiteRegular14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, this.contentPadding, this.hintText});
  final EdgeInsetsGeometry? contentPadding;
  final String? hintText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: contentPadding,
        hintText: hintText,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffEDEDED)),
          borderRadius: BorderRadius.circular(12.r),
        ),
        // focusColor: AppColors.primary,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary),
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
    );
  }
}

class CustomTitleWidget extends StatelessWidget {
  const CustomTitleWidget({super.key});

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
