import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_app/core/routing/app_routs.dart';
import 'package:meal_app/core/themes/app_colors.dart';
import 'package:meal_app/core/themes/app_text_styling.dart';
import 'package:meal_app/core/widget/spacing.dart';
import 'package:meal_app/screens/add_meals/widget/add_meal_button.dart';
import 'package:meal_app/screens/add_meals/widget/custom_text_field.dart';
import 'package:meal_app/screens/add_meals/widget/custom_title.dart';
import 'package:meal_app/screens/home/data/db_helper/db_helper.dart';
import 'package:meal_app/screens/home/data/model/meal_model.dart';

class AddMealScreen extends StatefulWidget {
  const AddMealScreen({super.key});

  @override
  State<AddMealScreen> createState() => _AddMealScreenState();
}

class _AddMealScreenState extends State<AddMealScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController mealNameController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  DatabaseHelper dbHelper = DatabaseHelper.instance;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: CustomTitleWidget(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Form(
            key: _formKey,
            child: isLoading == true
                ? SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    child: Center(
                      child: SizedBox(
                        width: 40.sp,
                        height: 40.sp,
                        child: const CircularProgressIndicator(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Meal Name", style: AppTextStyling.blackMedium16),
                      SizedBox(height: 8.h),
                      CustomTextField(
                        controller: mealNameController,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "please add meal name";
                          } else if (val.length < 3) {
                            return "please add more than 3 characters";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.h),
                      Text("Image URl", style: AppTextStyling.blackMedium16),
                      const HeightSpace(8),
                      CustomTextField(
                        controller: imageUrlController,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "please add image url ";
                          }
                          return null;
                        },
                      ),
                      const HeightSpace(16),
                      Text("Rate", style: AppTextStyling.blackMedium16),
                      const HeightSpace(8),
                      CustomTextField(
                        controller: rateController,
                        keyboardType: TextInputType.number,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "please add rate";
                          }
                          return null;
                        },
                      ),
                      const HeightSpace(16),
                      Text("Time", style: AppTextStyling.blackMedium16),
                      const HeightSpace(8),
                      CustomTextField(
                        controller: timeController,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "please add Time for Meal";
                          }
                          return null;
                        },
                      ),
                      const HeightSpace(16),
                      Text("Description", style: AppTextStyling.blackMedium16),
                      const HeightSpace(8),
                      CustomTextField(
                        controller: descriptionController,
                        maxLines: 4,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "please add Time for Meal";
                          }
                          return null;
                        },
                      ),
                      const HeightSpace(70),
                      PrimayButtonWidget(
                        buttonText: "Add Meal",
                        onPress: () {
                          if (_formKey.currentState!.validate()) {
                            isLoading = true;
                            setState(() {});
                            Meal meal = Meal(
                              name: mealNameController.text,
                              imageUrl: imageUrlController.text,
                              rate: double.parse(rateController.text),
                              description: descriptionController.text,
                              time: timeController.text,
                            );

                            dbHelper.insertMeal(meal).then((value) {
                              GoRouter.of(
                                context,
                              ).pushReplacementNamed(AppRoutes.homeScreen);
                            });
                          }
                        },
                      ),
                      const HeightSpace(20),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
