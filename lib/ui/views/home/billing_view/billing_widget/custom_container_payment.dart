import 'package:animate_do/animate_do.dart';
import 'package:car_medic/ui/shared/colors.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_text.dart';
import 'package:car_medic/ui/shared/extension_sizebox.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../billing_view_controller.dart';

class CustomContainerPayment extends StatelessWidget {
  CustomContainerPayment({super.key, required this.indexes});

  final BillingViewController controller = Get.put(BillingViewController());
  final int indexes;

  @override
  Widget build(BuildContext context) {
    return ZoomIn(
      child: CarouselSlider.builder(
        carouselController: controller.buttonCarouselController,
        itemBuilder: (context, index, realIndex) {
          return GestureDetector(
            onTap: () {
              controller.showOTB = false;
              controller.isLoading = false;
              controller.number.clear();
              controller.handleClickCash(
                  title: controller.cash[indexes][index]);
            },
            child: Padding(
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
                    SingleChildScrollView(
                      child: Column(children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.only(
                                  start: 28.w, top: 5.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: 'Id Cash',
                                    textType: TextStyleType.bodyBig,
                                    textColor: AppColors.whiteColor,
                                  ),
                                  (40.h).ph,
                                  CustomText(
                                    text: 'Delete Gate',
                                    textType: TextStyleType.title,
                                    textColor: AppColors.whiteColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  (50.h).ph,
                                  if (indexes != 0)
                                    Obx(() => Padding(
                                          padding: EdgeInsetsDirectional.only(
                                              start: 190.w),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: List.generate(
                                                controller.cash[indexes].length,
                                                (index) {
                                              return Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 5.w),
                                                child: CircleAvatar(
                                                  radius: 3,
                                                  backgroundColor: controller
                                                          .focusColorSlider(
                                                              index, indexes)
                                                      ? AppColors.colorBorder
                                                      : AppColors.whiteColor,
                                                ),
                                              );
                                            }),
                                          ),
                                        )),
                                ],
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding: EdgeInsets.all(30.w),
                              child: Image.asset(
                                'assets/images/${controller.cash[indexes][index]}.png',
                                width: 134.w,
                              ),
                            )
                          ],
                        ),
                      ]),
                    ),
                  ],
                )),
          );
        },
        itemCount: controller.cash[indexes].length,
        options: CarouselOptions(
          initialPage: 0,
          height: 210.h,
          enlargeCenterPage: true,
          enableInfiniteScroll: true,
          viewportFraction: 1,
          scrollPhysics:
              indexes == 0 ? const NeverScrollableScrollPhysics() : null,
          onPageChanged: indexes == 1
              ? controller.onPageChanged1
              : controller.onPageChanged2,
        ),
      ),
    );
  }
}
