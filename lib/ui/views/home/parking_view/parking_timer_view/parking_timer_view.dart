import 'package:car_medic/core/translation/app_translation.dart';
import 'package:car_medic/ui/shared/colors.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_app_bar.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_button.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_text.dart';
import 'package:car_medic/ui/shared/extension_sizebox.dart';
import 'package:car_medic/ui/views/home/parking_view/parking_view_controller.dart';
import 'package:car_medic/ui/views/main_view/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';

// ignore: must_be_immutable
class ParkingTimerView extends StatelessWidget {
  ParkingTimerView({super.key});

  ParkingViewController controller = Get.put(ParkingViewController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(children: [
          CustomAppBar(
            title: tr('Parking Timer'),
            iconSetting: true,
          ),
          (20.h).ph,
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  (10.h).ph,
                  CircularPercentIndicator(
                    radius: 180.0,
                    animation: true,
                    animationDuration: 5000,
                    backgroundWidth: 20,
                    lineWidth: 20.0,
                    percent: 1,
                    center: CustomText(
                      text: '03 : 25 : 55',
                      textType: TextStyleType.title,
                      fontSize: 45.sp,
                      textColor: AppColors.mainColor,
                    ),
                    circularStrokeCap: CircularStrokeCap.round,
                    backgroundColor: AppColors.grayColor.withOpacity(0.2),
                    progressColor: AppColors.mainColor,
                  ),
                ],
              )),
          (30.h).ph,
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            width: 200.w,
            height: 280.h,
            decoration: BoxDecoration(
                color: AppColors.grayColor.withOpacity(0.5),
                borderRadius: BorderRadius.all(Radius.circular(30.r))),
            child: const Row(
              children: [
                Column(
                  children: [],
                ),
                Column(
                  children: [],
                ),
              ],
            ),
          ),
          (20.h).ph,
          GestureDetector(
            onTap: () {
              Get.offAll(MainView(currentIndex: 0,));
            },
            child: CustomText(
              text: tr('Return To parking Page'),
              textType: TextStyleType.title,
              isTextAlign: TextAlign.center,
              textColor: AppColors.mainColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          (20.h).ph,
          CustomButton(
              paddingElevatedHorizontal: 20.w,
              onPressed: () {
                Get.back();
              },
              text: 'Cancel',
              buttonTypeEnum: ButtonTypeEnum.normal,
              width: 200.w,
              height: 60.h)
        ]),
      ),
    );
  }
}
