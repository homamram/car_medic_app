import 'package:animate_do/animate_do.dart';
import 'package:car_medic/core/utils/general_util.dart';
import 'package:car_medic/ui/admin_view/calendar_view_admin/calender_view_controller.dart';
import 'package:car_medic/ui/admin_view/calendar_view_admin/container_info_park_row.dart';
import 'package:car_medic/ui/shared/colors.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_app_bar.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_button.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_text.dart';
import 'package:car_medic/ui/shared/extension_sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CalendarView extends StatelessWidget {
  CalendarView({super.key});

  CalenderController calenderController = Get.put(CalenderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: ListView(children: [
        const CustomAppBar(
          title: 'Calendar',
        ),
        (10.h).ph,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              (20.h).ph,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.w),
                width: 360.w,
                height: 80.h,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.blackColor, width: 2)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const CustomText(
                          text: 'Al-Baath University Park',
                          textType: TextStyleType.bodyBig,
                          textColor: AppColors.blackColor,
                        ),
                        const Spacer(),
                        Icon(
                          Icons.arrow_downward_outlined,
                          color: AppColors.blackColor.withOpacity(0.5),
                        ),
                      ],
                    ),
                    CustomText(
                      text: 'Homs City',
                      textType: TextStyleType.body,
                      textColor: AppColors.blackColor.withOpacity(0.5),
                    ),
                  ],
                ),
              ),
              (20.h).ph,
              Row(
                children: [
                  CustomText(
                    text: 'From',
                    textType: TextStyleType.bodyBig,
                    textColor: AppColors.mainColor,
                  ),
                  (10.w).pw,
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.w),
                    width: 160.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: AppColors.mainColor, width: 2)),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: '06/03/2023',
                          textType: TextStyleType.bodyBig,
                          textColor: AppColors.blackColor,
                        ),
                      ],
                    ),
                  ),
                  (10.w).pw,
                  CustomText(
                    text: 'From',
                    textType: TextStyleType.bodyBig,
                    textColor: AppColors.mainColor,
                  ),
                  (10.w).pw,
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.w),
                    width: 160.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: AppColors.mainColor, width: 2)),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: '06/03/2023',
                          textType: TextStyleType.bodyBig,
                          textColor: AppColors.blackColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              (20.h).ph,
              Stack(children: [
                ZoomIn(
                  duration: const Duration(milliseconds: 300),
                  delay: const Duration(milliseconds: 300),
                  child: Padding(
                    padding: EdgeInsets.only(top: 22.h),
                    child: SizedBox(
                      height: 380.h,
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: VerticalDivider(
                            color: AppColors.mainColor,
                            width: 20.w,
                            thickness: 2,
                          )),
                    ),
                  ),
                ),
                Column(
                  children:
                      List.generate(calenderController.title.length, (index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          bottom: index + 1 != calenderController.title.length
                              ? 20.h
                              : 0),
                      child: ContainerRowInfoPark(
                        title1: calenderController.title[index][0],
                        title2: calenderController.title[index][1],
                        body1: 'H219-H299',
                        body2: '8877456a454',
                      ),
                    );
                  }),
                )
              ])
            ],
          ),
        ),
        (50.h).ph,
        ZoomIn(
          duration: const Duration(milliseconds: 300),
          delay: const Duration(milliseconds: 300),
          child: CustomButton(
            paddingElevatedHorizontal: defaultPadding,
            width: 1.sw,
            height: 60.h,
            buttonTypeEnum: ButtonTypeEnum.normal,
            onPressed: () {},
            text: 'Show My Park',
          ),
        ),
      ]),
    );
  }
}
