import 'package:car_medic/core/enums/type_cash.dart';
import 'package:car_medic/ui/shared/colors.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_app_bar.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_button.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_container.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_text.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_text_field.dart';
import 'package:car_medic/ui/shared/extension_sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../../core/translation/app_translation.dart';
import '../billing_view_controller.dart';

class CustomCashView extends StatelessWidget {
  const CustomCashView({super.key, required this.typeCash});

  final TypeCash typeCash;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          CustomAppBar(
            backgroundColor: typeCash == TypeCash.syriatel
                ? AppColors.redColorSyriatel
                : AppColors.mtnYellowColor,
            title: tr('Parking'),
            existBack: true,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
                padding: EdgeInsets.only(top: 100.h, left: 20.w, right: 20.w),
                child: GetBuilder<BillingViewController>(
                    init: BillingViewController(),
                    builder: (controller) {
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            CustomContainer(
                              backgroundColor: AppColors.whiteColor,
                              height: 185.h,
                              width: double.infinity,
                              borderRadius: 23.r,
                              child: Padding(
                                padding: EdgeInsetsDirectional.only(
                                    start: 20.w, top: 20.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Row(
                                      children: [
                                        CustomText(
                                          text: 'Select service',
                                          textType: TextStyleType.subtitle,
                                          textColor: AppColors.mtnBrownColor,
                                          fontWeight: FontWeight.normal,
                                        ),
                                        CustomText(
                                          text: 'sad as sad',
                                          textType: TextStyleType.subtitle,
                                          textColor: AppColors.mtnBrownColor,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ],
                                    ),
                                    (14.h).ph,
                                    const Row(
                                      children: [
                                        CustomText(
                                          text: 'Service Cost',
                                          textType: TextStyleType.subtitle,
                                          textColor: AppColors.mtnBrownColor,
                                          fontWeight: FontWeight.normal,
                                        ),
                                        CustomText(
                                          text: '150 000',
                                          textType: TextStyleType.subtitle,
                                          textColor: AppColors.mtnBrownColor,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ],
                                    ),
                                    (14.h).ph,
                                    const Row(
                                      children: [
                                        CustomText(
                                          text: 'Service Date',
                                          textType: TextStyleType.subtitle,
                                          textColor: AppColors.mtnBrownColor,
                                          fontWeight: FontWeight.normal,
                                        ),
                                        CustomText(
                                          text: '22-11-2023',
                                          textType: TextStyleType.subtitle,
                                          textColor: AppColors.mtnBrownColor,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            (25.h).ph,
                            CustomContainer(
                              backgroundColor: AppColors.whiteColor,
                              borderRadius: 23.r,
                              height: 195.h,
                              width: double.infinity,
                              child: Padding(
                                padding: EdgeInsetsDirectional.only(
                                    start: 20.w, top: 20.h, end: 20.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const CustomText(
                                        text: 'Enter your number',
                                        textType: TextStyleType.subtitle,
                                        textColor: AppColors.mtnBrownColor,
                                        fontWeight: FontWeight.normal),
                                    (10.h).ph,
                                    CustomTextFormField(
                                      controller: controller.number,
                                      heightContainer: 45.h,
                                      colorBorder: AppColors.mtnBrownColor,
                                      hintText: '',
                                    ),
                                    (20.h).ph,
                                    controller.isLoading == true
                                        ? Center(
                                            child: SizedBox(
                                              width: 35.w,
                                              height: 35.w,
                                              child: CircularProgressIndicator(
                                                color: typeCash ==
                                                        TypeCash.syriatel
                                                    ? AppColors.redColorSyriatel
                                                    : AppColors.mtnYellowColor,
                                                backgroundColor:
                                                    AppColors.whiteColor,
                                              ),
                                            ),
                                          )
                                        : Center(
                                            child: CustomButton(
                                                borderColor: typeCash ==
                                                        TypeCash.syriatel
                                                    ? AppColors.redColorSyriatel
                                                    : AppColors.mtnYellowColor,
                                                textColor: AppColors.whiteColor,
                                                backgroundColor: typeCash ==
                                                        TypeCash.syriatel
                                                    ? AppColors.redColorSyriatel
                                                    : AppColors.mtnYellowColor,
                                                text: controller.showOTB
                                                    ? 'Resend'
                                                    : 'Send',
                                                onPressed: () {
                                                  controller
                                                      .handleClickNumber();
                                                },
                                                buttonTypeEnum:
                                                    ButtonTypeEnum.small)),
                                    (18.h).ph,
                                  ],
                                ),
                              ),
                            ),
                            if (controller.showOTB) ...[
                              (25.h).ph,
                              CustomContainer(
                                backgroundColor: AppColors.whiteColor,
                                borderRadius: 23.r,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.only(
                                      start: 20.w, top: 20.h),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const CustomText(
                                          text: 'Enter number OTP',
                                          textType: TextStyleType.subtitle,
                                          textColor: AppColors.mtnBrownColor,
                                          fontWeight: FontWeight.bold),
                                      (10.h).ph,
                                      PinCodeTextField(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        appContext: context,
                                        length: 6,
                                        obscuringCharacter: '*',
                                        obscureText: true,
                                        animationType: AnimationType.fade,
                                        keyboardType: TextInputType.number,
                                        pinTheme: PinTheme(
                                          inactiveBorderWidth: 1.5.w,
                                          fieldOuterPadding:
                                              EdgeInsets.symmetric(
                                                  horizontal: 3.w),
                                          errorBorderColor:
                                              AppColors.mtnBrownColor,
                                          shape: PinCodeFieldShape.box,
                                          activeColor: AppColors.mtnBrownColor,
                                          borderWidth: 0.2,
                                          activeFillColor: AppColors.whiteColor,
                                          inactiveColor:
                                              AppColors.mtnBrownColor,
                                          selectedColor: AppColors.whiteColor,
                                          inactiveFillColor:
                                              AppColors.whiteColor,
                                          selectedFillColor:
                                              AppColors.mtnBrownColor,
                                          borderRadius:
                                              BorderRadius.circular(14.r),
                                          fieldHeight: 50.w,
                                          fieldWidth: 50.w,
                                        ),
                                        animationDuration:
                                            const Duration(milliseconds: 300),
                                        enableActiveFill: true,
                                        onCompleted: (v) {
                                          "Completed";
                                        },
                                        beforeTextPaste: (text) {
                                          "Allowing to paste $text";
                                          return true;
                                        },
                                      ),
                                      (10.h).ph,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CustomButton(
                                              borderColor: typeCash ==
                                                      TypeCash.syriatel
                                                  ? AppColors.redColorSyriatel
                                                  : AppColors.mtnYellowColor,
                                              textColor: AppColors.whiteColor,
                                              backgroundColor: typeCash ==
                                                      TypeCash.syriatel
                                                  ? AppColors.redColorSyriatel
                                                  : AppColors.mtnYellowColor,
                                              text: "Ok",
                                              onPressed: () {
                                                controller.showOTB = false;
                                                controller.number.clear();
                                                Get.back();
                                              },
                                              buttonTypeEnum:
                                                  ButtonTypeEnum.small),
                                          (20.w).pw,
                                          CustomButton(
                                            borderColor:
                                                typeCash == TypeCash.syriatel
                                                    ? AppColors.redColorSyriatel
                                                    : AppColors.mtnYellowColor,
                                            text: 'Cancel',
                                            backgroundColor:
                                                AppColors.whiteColor,
                                            buttonTypeEnum:
                                                ButtonTypeEnum.small,
                                            textColor:
                                                typeCash == TypeCash.syriatel
                                                    ? AppColors.blackColor
                                                    : AppColors.mtnBrownColor,
                                            onPressed: () {
                                              controller.showOTB = false;
                                              controller.number.clear();
                                              controller.update();
                                            },
                                          ),
                                        ],
                                      ),
                                      (20.h).ph,
                                    ],
                                  ),
                                ),
                              ),
                            ]
                          ],
                        ),
                      );
                    })),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.all(30.w),
              child: Image.asset(
                typeCash == TypeCash.syriatel
                    ? 'assets/images/syriatel.png'
                    : 'assets/images/mtn.png',
                width: 70.w,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
