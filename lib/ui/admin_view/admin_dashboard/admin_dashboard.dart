import 'package:car_medic/ui/admin_view/admin_dashboard/admin_dashboard_controller.dart';
import 'package:car_medic/ui/admin_view/admin_dashboard/admin_dashboard_widget/container_action_admin.dart';
import 'package:car_medic/ui/admin_view/admin_dashboard/admin_dashboard_widget/custom_appbar_admin.dart';
import 'package:car_medic/ui/admin_view/admin_dashboard/admin_dashboard_widget/total_order_service_statistic.dart';
import 'package:car_medic/ui/admin_view/admin_dashboard/admin_dashboard_widget/total_park_service_statistic.dart';
import 'package:car_medic/ui/admin_view/admin_dashboard/admin_dashboard_widget/total_revenue_service_statistic.dart';
import 'package:car_medic/ui/shared/colors.dart';
import 'package:car_medic/ui/shared/extension_sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AdminDashboardView extends GetView<AdminDashboardController> {
  AdminDashboardView({super.key});

  AdminDashboardController adminDashboardController =
      Get.put(AdminDashboardController());

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await adminDashboardController.onRefresh();
      },
      child: PopScope(
        canPop: false,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.whiteColor,
            appBar: AppBarCustom(
              title: 'Dashboard',
              isDash: true,
            ),
            body: Padding(
              padding: EdgeInsetsDirectional.only(start: 20.w, end: 20.w),
              child: ListView(
                primary: true,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  (20.h).ph,
                  GetBuilder<AdminDashboardController>(builder: (c) {
                    return Wrap(
                      runSpacing: 20.w,
                      spacing: 20.w,
                      alignment: WrapAlignment.center,
                      children:
                          List.generate(controller.titleAction.length, (index) {
                        return CustomContainerDashAndroid(
                            onTap: () {
                              controller.handleClickAction(index: index);
                              // if (text1[index] == 'Projects') {
                              //   Get.to(() => ProjectsAllDash(
                              //         adminDashboardController:
                              //             admindashboardController,
                              //       ));
                              // } else if (text1[index] == 'Employees Status') {
                              //   Get.to(() => EmployeesStatusAndroid());
                              // }
                            },
                            width: 200.w,
                            height: 120.w,
                            titleAction: controller.titleAction[index],
                            numberInAction: index == 0
                                ? controller.allorderparking.length.toString()
                                : index == 1
                                    ? controller.problemHistory.length
                                        .toString()
                                    : '');
                      }),
                    );
                  }),
                  (20.h).ph,
                  GetBuilder<AdminDashboardController>(builder: (c) {
                    return TotalParkStatisticDashBoard();
                  }),
                  (20.h).ph,
                  GetBuilder<AdminDashboardController>(builder: (c) {
                    return TotalRevenueStatisticDashBoard();
                  }),
                  (20.h).ph,
                  GetBuilder<AdminDashboardController>(builder: (c) {
                    return TotalOrderServiceStatistic();
                  }),
                  (20.h).ph,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
