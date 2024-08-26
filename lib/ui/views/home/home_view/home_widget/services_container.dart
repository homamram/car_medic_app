import 'package:car_medic/core/enums/message_type.dart';
import 'package:car_medic/core/translation/app_translation.dart';
import 'package:car_medic/core/utils/general_util.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_text.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_toast.dart';
import 'package:car_medic/ui/shared/extension_sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:get/get.dart';
import '../../../../shared/colors.dart';
import '../../../../shared/custom_widget/custom_button.dart';
import '../home_view_controller.dart';

class ServicesContainer extends StatelessWidget {
  ServicesContainer({super.key});

  HomeViewController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewController>(builder: (c) {
      return IntrinsicHeight(
        child: Container(
          width: 1.sw,
          // height: 0.18.sh,
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            boxShadow: [
              BoxShadow(
                color: AppColors.mainColor.withOpacity(0.4),
                spreadRadius: 2,
                blurRadius: 1,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(10.h),
            child: Column(
              children: [
                Row(
                  children: [
                    CustomText(
                      text: tr("Going On Services"),
                      textType: TextStyleType.bodyBig,
                      textColor: AppColors.blueColor,
                    )
                  ],
                ),
                (15.h).ph,
                if (controller.parkingTimer == null)
                  SpinKitCircle(
                    color: AppColors.mainColor,
                  )
                else if ((controller.parkingTimer!.hours == 00 &&
                    controller.parkingTimer!.minutes != 00) ||
                    (controller.parkingTimer!.hours != 00 &&
                        controller.parkingTimer!.minutes == 00) ||
                    (controller.parkingTimer!.hours != 00 &&
                        controller.parkingTimer!.minutes != 00)) ...[
                  Row(
                    children: [
                      CustomText(
                        text: tr("Parking Timer"),
                        textType: TextStyleType.body,
                        fontSize: 16.h,
                      ),
                      IconButton(
                        onPressed: () {
                            controller.showDialogExpandTime();

                        },
                        icon: Icon(Icons.add, color: AppColors.mainColor),
                      ),
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: AppColors.whiteColor,
                                content: Text(tr(
                                    'Are you sure you want to delete this park')),
                                actions: <Widget>[
                                  Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: CustomText(
                                          textType: TextStyleType.subtitle,
                                          text: tr("Cancel"),
                                          textColor: AppColors.mainColor,
                                        ),
                                      ),
                                      (60.w).pw,
                                      CustomButton(
                                        buttonTypeEnum: ButtonTypeEnum.small,
                                        onPressed: () {
                                          controller.ordercanseling();
                                          Navigator.of(context).pop();
                                        },
                                        text: tr("ok"),
                                        backgroundColor: AppColors.mainColor,
                                      )
                                    ],
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        icon: Icon(Icons.cancel_rounded,
                            color: AppColors.mainColor),
                      ),
                      TimerCountdown(
                        spacerWidth: 5.h,
                        timeTextStyle: const TextStyle(
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.bold),
                        format: CountDownTimerFormat.hoursMinutesSeconds,
                        endTime: DateTime.now().add(
                          Duration(
                            hours: controller.parkingTimer!.hours ?? 0,
                            minutes: controller.parkingTimer!.minutes ?? 0,
                            seconds: controller.parkingTimer!.seconds ?? 0,
                          ),
                        ),
                        onEnd: () {
                          controller.getParkingTimer();
                        },
                      ),
                    ],
                  ),
                ] else ...[
                  CustomText(
                    text: tr("No Parking exist active"),
                    textType: TextStyleType.bodyBig,
                  ),
                ]
              ],
            ),
          ),
        ),
      );
    });
  }
}
