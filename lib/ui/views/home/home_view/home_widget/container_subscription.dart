import 'package:car_medic/core/translation/app_translation.dart';
import 'package:car_medic/ui/shared/colors.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_text.dart';
import 'package:car_medic/ui/shared/extension_sizebox.dart';
import 'package:car_medic/ui/views/home/profile_view/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ContainerSubscription extends StatelessWidget {
  ContainerSubscription({super.key});

  ProfileController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        width: 1.sw,
        padding: EdgeInsetsDirectional.all(10.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15.r)),
          color: AppColors.whiteColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1.0,
              blurRadius: 5.0,
              offset: const Offset(0, 0),
            ),
          ],
          // borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric( vertical: 10.h),
          child: Column(
            children: [
              Row(
                children: [
                  const Spacer(),
                  CustomText(
                    text: tr("Free"),
                    textColor: AppColors.mainColor,
                    textType: TextStyleType.body,
                  ),
                  (20.w).pw,
                  CustomText(
                    text: tr("Premium"),
                    textColor: AppColors.mainColor,
                    textType: TextStyleType.body,
                  ),
                ],
              ),
              Divider(color: AppColors.mainColor, thickness: 0.2),
              (20.h).ph,
              ...List.generate(
                controller.proInfo.length,
                    (index) {
                  return Row(
                    children: [
                      SizedBox(
                        width: 300.w,
                        child: CustomText(
                          text: '-${controller.proInfo[index]}',
                          fontSize: 14.h,
                          fontWeight: FontWeight.bold,
                          textType: TextStyleType.body,

                          textColor: AppColors.blueColor,
                        ),
                      ),
                      (10.w).pw,
                      SizedBox(
                        width: 170.w,
                        child: Row(
                          children: [
                            SvgPicture.asset("assets/images/ph_x-bold.svg"),
                            (40.w).pw,
                            SvgPicture.asset(
                                "assets/images/icon-park-outline_correct.svg",),
                          ],
                        ),
                      )
                    ],
                  );
                },
              ),
              // Row(
              //   children: [
              //     CustomText(text: "wash your car up to 3 times a month",
              //       fontSize: 14.h,
              //       fontWeight: FontWeight.bold,
              //       textType: TextStyleType.body,textColor: AppColors.blueColor,),
              //     (40.w).pw,
              //     SvgPicture.asset("assets/images/ph_x-bold.svg"),
              //     (70.w).pw,
              //     SvgPicture.asset("assets/images/icon-park-outline_correct.svg"),
              //
              //
              //
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
