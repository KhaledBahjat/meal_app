import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:meal_app/core/themes/app_text_styling.dart';
import 'package:meal_app/screens/home/data/db_helper/db_helper.dart';
import 'package:meal_app/screens/home/widget/custom_floating_actcion_button_widget.dart';
import 'package:meal_app/screens/home/widget/custom_top_home_part.dart';
import 'package:meal_app/screens/home/widget/food_menu.dart';

DatabaseHelper dbHelper = DatabaseHelper.instance;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomTopHomePartWidget(),
          SizedBox(height: 25.sp),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.sp),
                    child: Text(
                      "Your Food",
                      style: AppTextStyling.blackMedium16,
                    ),
                  ),
                  SizedBox(height: 25.h),
                  FoodMenu(),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: CustomFloatingActcionButtonWidget(),
    );
  }
}


