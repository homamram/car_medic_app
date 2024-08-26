import 'package:animate_do/animate_do.dart';
import 'package:car_medic/ui/admin_view/all_order_detiels/all_order_widget/custom_all_orders.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_text.dart';
import 'package:car_medic/ui/shared/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'all_order_controller.dart';

class AllOrderView extends StatelessWidget {
  const AllOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    AllOrderController controller = Get.put(AllOrderController());

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: ListView(children: [
          const CustomAppBar(
            title: 'All Orders',
            iconSetting: true,
          ),
          ZoomIn(
            child: Padding(
                padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                child: GetBuilder<AllOrderController>(
                  builder: (c) {
                    return controller.problemHistory == null
                        ? Center(
                            child: SpinKitCircle(
                              color: AppColors.mainColor,
                              size: 100.w,
                            ),
                          )
                        : controller.problemHistory!.isEmpty
                            ? const Center(
                                child: CustomText(
                                    text: 'No Data',
                                    textType: TextStyleType.title),
                              )
                            : CustomAllOrders(
                              onTap: () {},
                            );
                  },
                )),
          )
        ]),
      ),
    );
  }
}
