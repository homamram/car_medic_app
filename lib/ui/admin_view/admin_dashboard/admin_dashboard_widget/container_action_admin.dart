import 'package:car_medic/core/translation/app_translation.dart';
import 'package:car_medic/ui/admin_view/admin_dashboard/admin_dashboard_controller.dart';
import 'package:car_medic/ui/shared/colors.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_text.dart';
import 'package:car_medic/ui/shared/extension_sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore_for_file: must_be_immutable
class CustomContainerDashAndroid extends StatelessWidget {
  final String titleAction;
  final String numberInAction;
  final Function()? onTap;
  final double? width;
  final double? height;
  final double? textSize;
  final BorderDirectional? borderDirectional;

  CustomContainerDashAndroid({
    this.onTap,
    this.width,
    this.height,
    this.borderDirectional,
    required this.titleAction,
    required this.numberInAction,
    this.textSize,
  });

  AdminDashboardController adminDashboardController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.mainColor.withOpacity(0.4),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(1, 1),
            ),
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(18.r),
          ),
          color: AppColors.whiteColor,
        ),
        width: width,
        height: height,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: tr(titleAction),
                textColor: AppColors.textColor,
                textType: TextStyleType.subtitle,
                fontSize: textSize,
              ),
              if (numberInAction != '') ...[
                (15.h).ph,
                CustomText(
                  text: numberInAction,
                  textColor: AppColors.textColor,
                  textType: TextStyleType.subtitle,
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
