import 'package:car_medic/ui/shared/colors.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_text.dart';
import 'package:car_medic/ui/views/home/home_view/home_view_controller.dart';
import 'package:car_medic/ui/views/home/home_view/home_widget/qr_item_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

showDialogOrderQRPark() {
  HomeViewController controller = Get.find();
  showGeneralDialog(
    barrierLabel: '',
    barrierDismissible: true,
    context: Get.context!,
    transitionDuration: const Duration(milliseconds: 500),
    pageBuilder: (context, anim1, anim2) {
      return AnimatedPadding(
        padding: EdgeInsets.zero,
        duration: Duration.zero,
        child: MediaQuery.removeViewInsets(
          removeLeft: true,
          removeTop: true,
          removeRight: true,
          removeBottom: true,
          context: context,
          child: Align(
            alignment: Alignment.center,
            child: Material(
              borderRadius: BorderRadius.circular(20.r),
              color: AppColors.mainColor,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 30.w, horizontal: 30.w),
                child: SizedBox(
                  width: Get.width * 0.6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      QrItemInfo(
                        title: "Park Name : ",
                        value: controller.qrParkDetails[0].toString(),
                      ),
                      SizedBox(height: 20.h),
                      QrItemInfo(
                        title: "Spot Name : ",
                        value: controller.qrParkDetails[1].toString(),
                      ),
                      SizedBox(height: 20.h),
                      QrItemInfo(
                        title: "Price : ",
                        value: controller.qrParkDetails[2].toString(),
                      ),
                      Divider(
                        color: AppColors.whiteColor,
                      ),
                      CustomText(
                        text: 'Please input number hours for parking',
                        textColor: AppColors.whiteColor,
                        textType: TextStyleType.bodyBig,
                        fontWeight: FontWeight.normal,
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              controller.changePrice(dec: false);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.whiteColor,
                                ),
                                borderRadius: BorderRadius.circular(15.r),
                              ),
                              width: 40.w,
                              height: 40.w,
                              child: CustomText(
                                isTextAlign: TextAlign.center,
                                textType: TextStyleType.bodyBig,
                                textColor: AppColors.whiteColor,
                                text: '-',
                              ),
                            ),
                          ),
                          GetBuilder<HomeViewController>(builder: (s) {
                            return Container(
                              alignment: Alignment.center,
                              width: 40.w,
                              height: 40.w,
                              child: CustomText(
                                isTextAlign: TextAlign.center,
                                textType: TextStyleType.bodyBig,
                                textColor: AppColors.whiteColor,
                                text: controller.numberHoursPark.toString(),
                              ),
                            );
                          }),
                          InkWell(
                            onTap: () {
                              controller.changePrice(dec: true);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.whiteColor,
                                ),
                                borderRadius: BorderRadius.circular(15.r),
                              ),
                              width: 40.w,
                              height: 40.w,
                              child: CustomText(
                                isTextAlign: TextAlign.center,
                                textType: TextStyleType.bodyBig,
                                textColor: AppColors.whiteColor,
                                text: '+',
                              ),
                            ),
                          ),
                          const Spacer(),
                          GetBuilder<HomeViewController>(builder: (c) {
                            return Container(
                              alignment: Alignment.center,
                              // width: 200.w,
                              height: 40.h,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.mainColor,
                                ),
                                borderRadius: BorderRadius.circular(15.r),
                              ),
                              child: CustomText(
                                isTextAlign: TextAlign.center,
                                textType: TextStyleType.body,
                                textColor: AppColors.whiteColor,
                                text:
                                'Total Price : ${controller.checkPrice.toString()}',
                              ),
                            );
                          })
                        ],
                      ),
                      SizedBox(height: 20.h),
                      CustomText(
                        text: 'Are you sure you have completed the Process?',
                        textColor: AppColors.whiteColor,
                        textType: TextStyleType.bodyBig,
                        fontSize: 18.sp,
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Get.back();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              padding: EdgeInsets.symmetric(
                                horizontal: 40.w,
                              ),
                              // foregroundColor: AppColors.kTextColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.r),
                                side: const BorderSide(
                                  color: Colors.white,
                                  width: 1,
                                ),
                              ),
                            ),
                            child: Text(
                              'Back'.tr,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 30.w,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              controller.chooseTimeSpot(duration: controller.numberHoursPark.value,

                                date:DateFormat.Hm().format(DateTime.now()) ,

                                Spot: controller.qrParkDetails[1],
                                parkingName: controller.qrParkDetails[0].toString(),);
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(horizontal: 40.w),
                              // backgroundColor:
                              // AppColors.buttonColor,
                              foregroundColor: AppColors.mainColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                            ),
                            child: Text(
                              'Yes'.tr,
                              style: TextStyle(
                                fontSize: 25.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}
