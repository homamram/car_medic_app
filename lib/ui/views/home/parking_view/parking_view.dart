import 'package:car_medic/core/translation/app_translation.dart';
import 'package:car_medic/ui/shared/colors.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_app_bar.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_button.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_text.dart';
import 'package:car_medic/ui/shared/extension_sizebox.dart';
import 'package:car_medic/ui/views/home/parking_view/parking_view_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ParkingView extends StatelessWidget {
  ParkingView({super.key});


  @override
  Widget build(BuildContext context) {
    ParkingViewController controller = Get.put(ParkingViewController());

    return ListView(children: [
      CustomAppBar(
        title: tr('Parking'),
        iconSetting: true,
      ),
      (30.h).ph,
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
             Center(
              child: CustomText(
                text: tr('Choose  a'),
                textType: TextStyleType.title,
                textColor: AppColors.blackColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Center(
              child: CustomText(
                text: tr('parking place'),
                textType: TextStyleType.title,
                textColor: AppColors.mainColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            (70.h).ph,
            GestureDetector(
              onTap: () async {
                await controller.getClosestPark();
              },
              child: Container(
                height: 250.h,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.mainColor),
                    borderRadius: BorderRadius.all(Radius.circular(15.r)),
                    image: const DecorationImage(
                        image: AssetImage('assets/images/maps.png'),
                        fit: BoxFit.fill)),
              ),
            ),
            (25.h).ph,
            GestureDetector(
              onTap: () async {
                await controller.getClosestPark();
              },
              child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
                  width: 1.sw,
                  height: 55.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.mainColor),
                    borderRadius: BorderRadius.all(Radius.circular(15.r)),
                  ),
                  child: GetBuilder<ParkingViewController>(
                    builder: (cont) {
                      return CustomText(
                        text: controller.selectedPark == null
                            ? tr('No Location Selected')
                            : controller.selectedPark!,
                        textType: controller.selectedPark == null
                            ? TextStyleType.bodyBig
                            : TextStyleType.subtitle,
                        fontWeight: FontWeight.bold,
                        isTextAlign: TextAlign.center,
                        textColor: controller.selectedPark == null
                            ? AppColors.grayColor
                            : AppColors.mainColor,
                      );
                    },
                  )),
            ),
            (25.h).ph,
            CustomButton(
              onPressed: () {
                if (controller.selectedPark != null) {
                  controller.choosePark(parkNumber: controller.parkNumber!);
                }
              },
              text: tr('Next'),
              buttonTypeEnum: ButtonTypeEnum.big,
              height: 45.h,
              width: 1.sw,
            )
          ],
        ),
      ),
    ]);
  }
}
