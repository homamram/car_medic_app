import 'package:car_medic/core/translation/app_translation.dart';
import 'package:car_medic/ui/shared/colors.dart';
import 'package:car_medic/ui/views/home/billing_view/billing_view.dart';
import 'package:car_medic/ui/views/home/history_view/history_view.dart';
import 'package:car_medic/ui/views/home/parking_view/parking_view.dart';
import 'package:car_medic/ui/views/home/repair_view/main_repair_home.dart';
import 'package:car_medic/ui/views/main_view/main_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:fancy_bottom_navigation_plus/fancy_bottom_navigation_plus.dart';
import '../home/home_view/home_view.dart';

// ignore: must_be_immutable
class MainView extends StatelessWidget {
  MainView({
    super.key,
    required this.currentIndex,
  });

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetView = [
      ParkingView(),
      const BillingView(),
      HomeView(),
      const HistoryView(),
      MainRepairView()
    ];
    return SafeArea(
        child: GetBuilder(
      init: MainController(page: currentIndex),
      builder: (controller) {
        return Scaffold(
            backgroundColor: AppColors.whiteColor,
            body: widgetView[controller.page],
            bottomNavigationBar: FancyBottomNavigationPlus(
              barBackgroundColor: AppColors.mainColor,
              initialSelection: controller.page,
              titleStyle: TextStyle(
                  color: AppColors.whiteColor, fontFamily: 'BalooBhaijaan2'),
              circleColor: AppColors.mainColor,
              tabs: [
                TabData(
                    icon: Padding(
                      padding: EdgeInsets.all(10.w),
                      child: SvgPicture.asset(
                        'assets/bottom_bar/ic_parking.svg',
                      ),
                    ),
                    title: tr("Parking")),
                TabData(
                    icon: Padding(
                      padding: EdgeInsets.all(20.w),
                      child:
                          SvgPicture.asset('assets/bottom_bar/ic_billing.svg'),
                    ),
                    title: tr("Billing")),
                TabData(
                    icon: Padding(
                        padding: EdgeInsets.all(10.w),
                        child:
                            SvgPicture.asset('assets/bottom_bar/ic_home.svg')),
                    title: tr("Home")),
                TabData(
                    icon: Padding(
                        padding: EdgeInsets.all(20.w),
                        child: SvgPicture.asset(
                            'assets/bottom_bar/ic_history.svg')),
                    title: tr("History")),
                TabData(
                    icon: Padding(
                        padding: EdgeInsets.all(20.w),
                        child: SvgPicture.asset(
                            'assets/bottom_bar/ic_maintance.svg')),
                    title: tr("Repair")),
              ],
              onTabChangedListener: (int position) {
                controller.page = position;
                controller.update();
                // switch (position) {
                //   case 0:
                //     controller.animatedToPage(
                //         BottomNavigationEnum.parking, position);
                //   case 1:
                //     controller.animatedToPage(
                //         BottomNavigationEnum.billing, position);
                //   case 2:
                //     controller.animatedToPage(
                //         BottomNavigationEnum.home, position);
                //   case 3:
                //     controller.animatedToPage(
                //         BottomNavigationEnum.history, position);
                //   case 4:
                //     controller.animatedToPage(
                //         BottomNavigationEnum.repair, position);
                // }
              },
            ));
      },
    ));
  }
}
