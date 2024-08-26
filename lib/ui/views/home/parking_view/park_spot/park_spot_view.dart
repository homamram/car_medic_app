import 'package:car_medic/core/translation/app_translation.dart';
import 'package:car_medic/ui/shared/colors.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_app_bar.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_button.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_text.dart';
import 'package:car_medic/ui/shared/extension_sizebox.dart';
import 'package:car_medic/ui/views/home/parking_view/park_spot/dotted_line.dart';
import 'package:car_medic/ui/views/home/parking_view/park_spot/park_spot_view_controller.dart';
import 'package:car_medic/ui/views/home/parking_view/park_spot/spot_widget/dialog_choose_park_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../core/data/models/api/parking_model.dart';

// ignore: must_be_immutable
class ParkSpotView extends StatelessWidget {
  final List<ParkingSpot> parkingSpot;
  final String selectedPark;
  final double price;

  const ParkSpotView(
      {super.key,
      required this.parkingSpot,
      required this.selectedPark,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.whiteColor,
          body: GetBuilder(
            init: ParkSpotViewController(parkingSpot, selectedPark, price),
            builder: (controller) {
              return ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    CustomAppBar(
                      title: tr('Parking'),
                      borderRadius: false,
                      existBack: true,
                    ),
                    // (30.h).ph,
                    Divider(
                      color: AppColors.whiteColor,
                      height: 0.5,
                    ),
                    Container(
                      width: 1.sw,
                      height: 140.h,
                      decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(25.r),
                              bottomRight: Radius.circular(25.r))),
                      child: Column(
                        children: [
                          (10.h).ph,
                          CustomText(
                            text: tr('Your Spot is'),
                            textType: TextStyleType.title,
                            textColor: AppColors.whiteColor,
                            fontWeight: FontWeight.normal,
                          ),
                          (20.h).ph,
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                     CustomText(
                                      text: tr('Parking Lot'),
                                      textType: TextStyleType.bodyBig,
                                      textColor: AppColors.blackColor,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    (10.h).ph,
                                    CustomText(
                                      text: controller
                                          .parkingSpot[controller.indexSpot]
                                          .parkNumber
                                          .toString(),
                                      textType: TextStyleType.body,
                                      textColor: AppColors.whiteColor,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ],
                                ),
                                CustomText(
                                  text: selectedPark,
                                  textType: TextStyleType.bodyBig,
                                  textColor: AppColors.blackColor,
                                  fontWeight: FontWeight.bold,
                                  endPadding: 20.w,
                                ),
                                Column(
                                  children: [
                                     CustomText(
                                      text: tr('Status'),
                                      textType: TextStyleType.bodyBig,
                                      textColor: AppColors.blackColor,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    (10.h).ph,
                                     CustomText(
                                      text: tr('Available'),
                                      textType: TextStyleType.body,
                                      textColor: AppColors.greenColor,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Stack(
                            children: [
                              SvgPicture.asset('assets/images/from_park.svg',
                                  height: 0.69.sh),
                              ...List.generate(
                                  5,
                                  (index) => Padding(
                                        padding: EdgeInsetsDirectional.only(
                                            top: index == 0
                                                ? 110.h
                                                : index == 1
                                                    ? 200.h
                                                    : index == 2
                                                        ? 290.h
                                                        : index == 3
                                                            ? 380.h
                                                            : 470.h,
                                            start: 10.w),
                                        child: Column(children: [
                                          if (controller.handleCarExist(
                                              index: index))
                                            Transform.flip(
                                                flipX: true,
                                                child: Image.asset(
                                                  'assets/images/ic_car.png',
                                                  width: 115.w,
                                                )),
                                          if (controller.indexSpot == index)
                                            CustomButton(
                                              text: 'Your Spot',
                                              buttonTypeEnum:
                                                  ButtonTypeEnum.small,
                                              backgroundColor:
                                                  AppColors.greenColor,
                                              height: 50.h,
                                              borderColor: AppColors.whiteColor,
                                            ),
                                          CustomText(
                                            text: controller
                                                .parkingSpot[index].parkNumber
                                                .toString(),
                                            textType: TextStyleType.small,
                                            endPadding: 10.w,
                                            topPadding:
                                                controller.handleCarExist(
                                                            index: index) ||
                                                        controller.indexSpot ==
                                                            index
                                                    ? 5.h
                                                    : 20.h,
                                            startPadding:
                                                controller.handleCarExist(
                                                            index: index) ||
                                                        controller.indexSpot ==
                                                            index
                                                    ? 0
                                                    : 50.w,
                                          )
                                        ]),
                                      ))
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Column(children: [
                                    (100.h).ph,
                                    SvgPicture.asset(
                                      'assets/images/ic_arrow.svg',
                                      width: 25.w,
                                    ),
                                    (200.h).ph,
                                    SvgPicture.asset(
                                      'assets/images/ic_arrow.svg',
                                      width: 25.w,
                                    ),
                                  ]),
                                  (40.w).pw,
                                  SizedBox(
                                      width: 1.w,
                                      height: 0.59.sh,
                                      child: CustomPaint(
                                        painter: DottedLinePainter(),
                                      )),
                                  (40.w).pw,
                                  Column(children: [
                                    (100.h).ph,
                                    Transform.flip(
                                      flipY: true,
                                      child: SvgPicture.asset(
                                        'assets/images/ic_arrow.svg',
                                        width: 25.w,
                                      ),
                                    ),
                                    (200.h).ph,
                                    Transform.flip(
                                      flipY: true,
                                      child: SvgPicture.asset(
                                        'assets/images/ic_arrow.svg',
                                        width: 25.w,
                                      ),
                                    ),
                                  ]),
                                ],
                              ),
                              (10.h).ph,
                              CustomText(
                                text: 'Entrance',
                                textType: TextStyleType.title,
                                textColor: AppColors.mainColor,
                              ),
                              (10.h).ph,
                              CustomButton(
                                onPressed: () {
                                  controller.clearData();
                                  showDialogDatePark(
                                      controller: controller,
                                      nameSpot: controller
                                          .parkingSpot[controller.indexSpot]
                                          .parkNumber
                                          .toString());
                                  // Get.to(() => ParkingTimerView());
                                },
                                text: 'Next',
                                buttonTypeEnum: ButtonTypeEnum.normal,
                                width: 200.w,
                                height: 50.h,
                              )
                            ],
                          ),
                          Stack(
                            children: [
                              SvgPicture.asset('assets/images/to_park.svg',
                                  height: 0.69.sh),
                              ...List.generate(5, (index) {
                                index = index + 5;
                                return Padding(
                                  padding: EdgeInsetsDirectional.only(
                                    top: index == 5
                                        ? 105.h
                                        : index == 6
                                            ? 195.h
                                            : index == 7
                                                ? 290.h
                                                : index == 8
                                                    ? 380.h
                                                    : 470.h,
                                  ),
                                  child: Column(children: [
                                    if (controller.handleCarExist(index: index))
                                      Image.asset(
                                        'assets/images/ic_car.png',
                                        width: 115.w,
                                      ),
                                    if (controller.indexSpot == index)
                                      CustomButton(
                                        text: 'Your Spot',
                                        buttonTypeEnum: ButtonTypeEnum.small,
                                        backgroundColor: AppColors.greenColor,
                                        height: 50.h,
                                        borderColor: AppColors.whiteColor,
                                      ),
                                    CustomText(
                                      text: controller
                                          .parkingSpot[index].parkNumber
                                          .toString(),
                                      textType: TextStyleType.small,
                                      endPadding: 10.w,
                                      topPadding: controller.handleCarExist(
                                                  index: index) ||
                                              controller.indexSpot == index
                                          ? 5.h
                                          : 20.h,
                                      startPadding: controller.handleCarExist(
                                                  index: index) ||
                                              controller.indexSpot == index
                                          ? 0
                                          : 50.w,
                                    )
                                  ]),
                                );
                              }),
                            ],
                          ),
                        ],
                      ),
                    )
                  ]);
            },
          )),
    );
  }
}
