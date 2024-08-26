import 'package:car_medic/core/translation/app_translation.dart';
import 'package:car_medic/ui/shared/colors.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_text.dart';
import 'package:car_medic/ui/shared/extension_sizebox.dart';
import 'package:car_medic/ui/views/home/repair_view/main_reapair_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class RepairChoosePlaceView extends StatelessWidget {
  RepairChoosePlaceView({super.key});

  MainRepairController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: CustomText(
            text: 'Choose  a',
            textType: TextStyleType.title,
            textColor: AppColors.blackColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Center(
          child: CustomText(
            text: 'Mechanic Place',
            textType: TextStyleType.title,
            textColor: AppColors.mainColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        (70.h).ph,
        GestureDetector(
          onTap: () async {
            await controller.getRepairPlaces();
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
        GestureDetector(onTap: () async {
          await controller.getRepairPlaces();
        }, child: GetBuilder<MainRepairController>(
          builder: (controller) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
              width: 1.sw,
              height: 55.h,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.mainColor),
                borderRadius: BorderRadius.all(Radius.circular(15.r)),
              ),
              child: CustomText(
                text: controller.selectedPlace == null
                    ? tr('No Location Selected')
                    : controller.selectedPlace!,
                textType: controller.selectedPlace == null
                    ? TextStyleType.bodyBig
                    : TextStyleType.subtitle,
                fontWeight: FontWeight.bold,
                isTextAlign: TextAlign.center,
                textColor: controller.selectedPlace == null
                    ? AppColors.grayColor
                    : AppColors.mainColor,
              ),
            );
          },
        )),
      ],
    );
  }
}
