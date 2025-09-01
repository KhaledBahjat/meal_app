import 'package:flutter/material.dart';
import 'package:meal_app/core/themes/app_text_styling.dart';
import 'package:meal_app/screens/home/widget/custom_top_home_part.dart';
import 'package:meal_app/screens/home/widget/food_item_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTopHomePartWidget(),
            SizedBox(height: 25.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8.sp),
                  child: Text(
                    'Your Food',
                    style: AppTextStyling.blackMedium16.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 25.h),
                FoodItem(rate: '4.9', time: '20-30', title: 'Cheese Burger'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
