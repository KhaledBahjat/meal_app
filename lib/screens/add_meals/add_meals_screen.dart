import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
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
  TextEditingController rateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  DatabaseHelper dbHelper = DatabaseHelper.instance;

  bool isLoading = false;


  File? _pickedImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _pickedImage = File(pickedFile.path);
      });
    }
  }

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
            child: isLoading
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

                      
                      Text("Meal Image", style: AppTextStyling.blackMedium16),
                      SizedBox(height: 8.h),
                      InkWell(
                        onTap: _pickImage,
                        child: _pickedImage == null
                            ? Container(
                                width: double.infinity,
                                height: 150,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Center(
                                  child: Icon(Icons.add_a_photo,
                                      size: 40, color: Colors.grey),
                                ),
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.file(
                                  _pickedImage!,
                                  width: double.infinity,
                                  height: 150,
                                  fit: BoxFit.cover,
                                ),
                              ),
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
                            return "please add description";
                          }
                          return null;
                        },
                      ),
                      const HeightSpace(70),

                      PrimayButtonWidget(
                        buttonText: "Add Meal",
                        onPress: () {
                          if (_formKey.currentState!.validate()) {
                            if (_pickedImage == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Please pick an image"),
                                ),
                              );
                              return;
                            }

                            isLoading = true;
                            setState(() {});

                            Meal meal = Meal(
                              name: mealNameController.text,
                              imageUrl: _pickedImage!
                                  .path, // 🔹 نخزن path بتاع الصورة
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
