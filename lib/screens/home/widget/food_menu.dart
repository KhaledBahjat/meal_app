import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_app/core/routing/app_routs.dart';
import 'package:meal_app/core/themes/app_colors.dart';
import 'package:meal_app/core/themes/app_text_styling.dart';
import 'package:meal_app/screens/home/data/model/meal_model.dart';
import 'package:meal_app/screens/home/home_screen.dart';
import 'package:meal_app/screens/home/widget/food_item_widget.dart';

class FoodMenu extends StatelessWidget {
  const FoodMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: dbHelper.getMeals(),
        builder: (context, snapshot) {
          if (snapshot.connectionState ==
              ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            );
          } else if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              return Center(
                child: Text(
                  "No Meals Found",
                  style: AppTextStyling.blackMedium16,
                ),
              );
            }
            return GridView.builder(
              itemCount: snapshot.data!.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 22.sp,
                    crossAxisSpacing: 16.sp,
                    childAspectRatio: 0.9,
                  ),
              itemBuilder: (context, index) {
                Meal meal = snapshot.data![index];
                return FoodItemWidget(
                  imageUrl: meal.imageUrl,
                  name: meal.name,
                  rate: meal.rate,
                  time: meal.time,
                  onTap: () {
                    GoRouter.of(context).pushNamed(
                      AppRoutes.detailsScreen,
                      extra: meal,
                    );
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"));
          }
    
          return Container();
        },
      ),
    );
  }
}