import 'package:car_medic/core/translation/app_translation.dart';
import 'package:car_medic/ui/shared/colors.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_app_bar.dart';
import 'package:car_medic/ui/views/home/billing_view/billing_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'billing_widget/custom_container_payment.dart';

class BillingView extends StatelessWidget {
  const BillingView({super.key, this.existAppBar});

  final bool? existAppBar;

  @override
  Widget build(BuildContext context) {
    BillingViewController controller = Get.put(BillingViewController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: ListView(children: [
          CustomAppBar(
            existBack: existAppBar,
            iconSetting: true,
            title: tr(  'Billing' ),
          ),
          Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  top: 40.h,
                ),
                child: Column(
                  children: List.generate(controller.cash.length, (index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 30.h),
                      child: CustomContainerPayment(
                        indexes: index,
                      ),
                    );
                  }),
                ),
              ))
        ]),
      ),
    );
  }
}
