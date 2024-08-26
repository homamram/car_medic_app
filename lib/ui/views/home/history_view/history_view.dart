import 'package:animate_do/animate_do.dart';
import 'package:car_medic/ui/shared/colors.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_app_bar.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_text.dart';
import 'package:car_medic/ui/views/home/history_view/history_view_controller.dart';
import 'package:car_medic/ui/views/home/history_view/history_widget/container_history.dart';
import 'package:car_medic/ui/views/home/history_view/history_widget/title_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    HistoryViewController historyViewController =
    Get.put(HistoryViewController());
    return ListView(children: [
      const CustomAppBar(
        title: 'History',
        iconSetting: true,
      ),
      Padding(
          padding:
          EdgeInsets.only(right: 30.w, left: 30.w, bottom: 10.h, top: 20.h),
          child: GetBuilder<HistoryViewController>(builder: (s) {
            return Container(
              width: 516.w,
              height: 60.h,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: const Offset(0, 2),
                  ),
                ],
                border: Border.all(color: AppColors.whiteColor),
                borderRadius: BorderRadius.all(
                  Radius.circular(25.r),
                ),
                color: AppColors.whiteColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ServiceTitle(
                    onTap: () {
                      historyViewController.handleClickFilter(serviceIndex: 0);
                    },
                    onClick: historyViewController.index == 0 ? true : false,
                    selectedContainer: (historyViewController.index == 0)
                        ? AppColors.mainColor
                        : Colors.transparent,
                    title: 'Parking',
                    titleContainer: (historyViewController.index == 0)
                        ? AppColors.whiteColor
                        : AppColors.colorBorder,
                  ),
                  ServiceTitle(
                    onTap: () {
                      historyViewController.handleClickFilter(serviceIndex: 1);
                    },
                    onClick: historyViewController.index == 1 ? true : false,
                    selectedContainer: (historyViewController.index == 1)
                        ? AppColors.mainColor
                        : Colors.transparent,
                    title: 'Repairs',
                    titleContainer: (historyViewController.index == 1)
                        ? AppColors.whiteColor
                        : AppColors.colorBorder,
                  ),
                ],
              ),
            );
          })),
      ZoomIn(
        child: SizedBox(
          height: 1.sh,
          child: Padding(
              padding: EdgeInsets.only(top: 10.h, bottom: 290.h),
              child: GetBuilder<HistoryViewController>(
                builder: (c) {
                  return historyViewController.index == 0
                      ? (historyViewController.parkingHistory == null
                      ? Center(
                    child: SpinKitCircle(
                      color: AppColors.mainColor,
                      size: 100.w,
                    ),
                  )
                      : historyViewController.parkingHistory!.isEmpty
                      ? const Center(
                    child: CustomText(
                        text: 'No Data',
                        textType: TextStyleType.title),
                  )
                      : ContainerHistory(
                    onTap: () {},
                  ))
                      : (historyViewController.problemHistory == null
                      ? Center(
                    child: SpinKitCircle(
                      color: AppColors.mainColor,
                      size: 100.w,
                    ),
                  )
                      : historyViewController.problemHistory!.isEmpty
                      ? const Center(
                    child: CustomText(
                        text: 'No Data',
                        textType: TextStyleType.title),
                  )
                      : ContainerHistory(
                    onTap: () {},
                  ));
                },
              )),
        ),
      )
    ]);
  }
}
