import 'package:animate_do/animate_do.dart';
import 'package:car_medic/ui/shared/colors.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_text.dart';
import 'package:car_medic/ui/shared/extension_sizebox.dart';
import 'package:car_medic/ui/views/home/home_view/home_view_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomContainerQution extends StatelessWidget {
  CustomContainerQution({super.key, required this.indexes});

  final HomeViewController controller = Get.find();
  final int indexes;

  @override
  Widget build(BuildContext context) {
    return ZoomIn(
      child: CarouselSlider.builder(
        carouselController: controller.buttonCarouselController,
        itemBuilder: (context, index, realIndex) {
          return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 350.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(25.r),
                            bottomRight: Radius.circular(25.r)),
                        gradient: LinearGradient(
                          colors: [
                            AppColors.colorBorder,
                            AppColors.mainColor,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 375.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(220.r),
                            bottomLeft: Radius.circular(25.r),
                            topLeft: Radius.circular(25.r)),
                        gradient: LinearGradient(
                          colors: [
                            AppColors.mainColor,
                            AppColors.mainColor,
                            AppColors.mainColor,
                            AppColors.mainColor,
                            AppColors.mainColor.withOpacity(0),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                    ),
                  ),
                  Column(children: [
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.only(
                            top: 20.h,
                            start: 20.w,
                            end: 20.w,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: controller.qaution[index][0],
                                textType: TextStyleType.subtitle,
                                textColor: AppColors.whiteColor,
                                fontWeight: FontWeight.bold,
                              ),
                              (10.h).ph,
                              CustomText(
                                text: controller.qaution[index][1],
                                textType: TextStyleType.bodyBig,
                                textColor: AppColors.whiteColor,
                                fontWeight: FontWeight.normal,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    GetBuilder<HomeViewController>(builder: (c) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                            List.generate(controller.qaution.length, (index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: CircleAvatar(
                              radius: 4.5,
                              backgroundColor:
                                  controller.focusColorSlider(index)
                                      ? AppColors.colorBorder
                                      : AppColors.whiteColor,
                            ),
                          );
                        }),
                      );
                    }),
                    (20.h).ph
                  ]),
                ],
              ));
        },
        itemCount: controller.qaution.length,
        options: CarouselOptions(
          initialPage: 0,
          height: 210.h,
          enlargeCenterPage: true,
          enableInfiniteScroll: true,
          viewportFraction: 1,
          onPageChanged: controller.onPageChanged1,
        ),
      ),
    );
  }
}
