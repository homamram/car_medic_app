import 'package:car_medic/ui/shared/colors.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_app_bar.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_button.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_text.dart';
import 'package:car_medic/ui/shared/extension_sizebox.dart';
import 'package:car_medic/ui/views/home/billing_view/billing_widget/custom_container_payment.dart';
import 'package:car_medic/ui/views/home/repair_view/choose_place_view/choose_place_view.dart';
import 'package:car_medic/ui/views/home/repair_view/choose_problem_type_view/choose_problem_type_view.dart';
import 'package:car_medic/ui/views/home/repair_view/choose_problem_view/choose_problem_view.dart';
import 'package:car_medic/ui/views/home/repair_view/main_reapair_controller.dart';
import 'package:car_medic/ui/views/home/repair_view/oreder_details_view/order_details_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_stepindicator/flutter_stepindicator.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class MainRepairView extends StatelessWidget {
  MainRepairView({super.key});


  @override
  Widget build(BuildContext context) {
    MainRepairController controller = Get.put(MainRepairController());

    return PopScope(
      canPop: false,
      child: ListView(physics: const NeverScrollableScrollPhysics(), children: [
        const CustomAppBar(
          title: 'Rpeair',
          iconSetting: true,
        ),
        (10.h).ph,
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: GetBuilder<MainRepairController>(
              builder: (s) {
                return SizedBox(
                  height: 0.8.sh,
                  child: ListView(
                    children: [
                      FlutterStepIndicator(
                        height: 60.w,
                        paddingLine: const EdgeInsets.symmetric(horizontal: 0),
                        positiveColor: AppColors.mainColor,
                        progressColor: const Color(0xFFEA9C00),
                        negativeColor: const Color(0xFFD5D5D5),
                        padding: EdgeInsets.all(4.w),
                        list: controller.list,
                        division: controller.counter,
                        onChange: (i) {},
                        page: controller.page,
                        onClickItem: (p0) {},
                      ),
                      (20.h).ph,
                      if (controller.page == 0) const ChooseProblemTypeView(),
                      if (controller.page == 1) const ChooseProblemView(),
                      if (controller.page == 2) RepairChoosePlaceView(),
                      if (controller.page == 3) OrderDetailsView(),
                      const Spacer(),
                      Column(
                        children: [
                          controller.isLoading
                              ? SpinKitCircle(
                                  color: AppColors.mainColor,
                                  size: 80.w,
                                )
                              : Padding(
                                  padding: EdgeInsets.only(top: 10.h),
                                  child: CustomButton(
                                    onPressed: () {
                                      controller.handleButtonPress(
                                          isIncrease: true);
                                    },
                                    text: controller.page == 3
                                        ? 'Finish'
                                        : 'Next',
                                    buttonTypeEnum: ButtonTypeEnum.medium,
                                    width: 240.w,
                                    height: 55.h,
                                  ),
                                ),
                          (20.h).ph,
                          if (controller.page != 0 &&controller.page!=3)
                            GestureDetector(
                                onTap: () {
                                  controller.handleStepValue(isIncrease: false);
                                },
                                child: CustomText(
                                  text: 'Back',
                                  textType: TextStyleType.bodyBig,
                                  textColor: AppColors.mainColor,
                                )),
                        ],
                      ),
                      (20.h).ph,
                    ],
                  ),
                );
              },
            )),
      ]),
    );
  }
}
