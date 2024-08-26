import 'package:animate_do/animate_do.dart';
import 'package:car_medic/ui/shared/colors.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_app_bar.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_button.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_text.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_text_field.dart';
import 'package:car_medic/ui/shared/extension_sizebox.dart';
import 'package:car_medic/ui/views/home/profile_view/profile_widget/custom_row_info.dart';
import 'package:car_medic/ui/views/home/profile_view/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/translation/app_translation.dart';

// ignore: must_be_immutable
class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController controller = Get.find();

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                title: tr('Edit Profile'),
                onTapBack: () {
                  Get.back();
                },
              ),
              (20.h).ph,
              Padding(
                padding: EdgeInsetsDirectional.only(
                    start: 40.w, bottom: 10.h, top: 10.h),
                child: CustomText(
                  text: 'Edit personal info and car info',
                  textType: TextStyleType.bodyBig,
                  fontWeight: FontWeight.w500,
                  fontSize: 24.sp,
                ),
              ),
              (10.h).ph,
              SizedBox(
                height: 0.8.sh,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    (10.h).ph,
                    Obx(
                          () => FadeInLeft(
                        delay: const Duration(milliseconds: 200),
                        duration: const Duration(milliseconds: 400),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          height: controller.expandedContainer[0] == false
                              ? 70.h
                              : 300.h,
                          width: 1.sw,
                          margin: EdgeInsets.symmetric(horizontal: 20.w),
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadiusDirectional.circular(15.r),
                            color: AppColors.whiteColor,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.mainColor.withOpacity(0.5),
                                spreadRadius: 0.5,
                                blurRadius: 1,
                                offset: const Offset(0.5, 0.5),
                              ),
                            ],
                          ),
                          padding: EdgeInsetsDirectional.only(
                              start: 30.w,
                              end: 30.w,
                              top: 25.h,
                              bottom: controller.expandedContainer[0] == false
                                  ? 0
                                  : 27.h),
                          child: ListView(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    controller.clickToExpanded(index: 0);
                                  },
                                  child: const CustomRowInfo(
                                    isEdit: true,
                                    index: 0,
                                    title: 'Personal info',
                                  )),
                              Divider(
                                color: AppColors.blackColor,
                                height: 10.h,
                                thickness: 0.3,
                              ),
                              (10.h).ph,
                              Visibility(
                                  visible: controller.expandedContainer[0],
                                  child: ZoomIn(
                                    delay: const Duration(milliseconds: 500),
                                    duration: const Duration(milliseconds: 500),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  const CustomText(
                                                    text: 'Name:',
                                                    textType:
                                                    TextStyleType.body,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  CustomTextFormField(
                                                    keyboardType:
                                                    TextInputType.name,
                                                    widthContainer: 190.w,
                                                    controller: controller.name,
                                                    hintText: '',
                                                  ),
                                                ]),
                                            (40.w).pw,
                                            Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                const CustomText(
                                                  text: 'Family:',
                                                  textType: TextStyleType.body,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                CustomTextFormField(
                                                  widthContainer: 190.w,
                                                  controller:
                                                  controller.lastName,
                                                  keyboardType:
                                                  TextInputType.name,
                                                  hintText: '',
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        (20.h).ph,
                                        const CustomText(
                                          text: 'Email:',
                                          textType: TextStyleType.body,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        CustomTextFormField(
                                          readOnly: true,
                                          keyboardType: TextInputType.text,
                                          widthContainer: 1.sw,
                                          controller: controller.email,
                                          hintText: '',
                                        ),
                                      ],
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                    (20.h).ph,
                    Obx(
                          () => FadeInLeft(
                        delay: const Duration(milliseconds: 200),
                        duration: const Duration(milliseconds: 400),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          width: 1.sw,
                          height: controller.expandedContainer[1] == true
                              ? 400.h
                              : 80.h,
                          margin: EdgeInsets.symmetric(horizontal: 20.w),
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadiusDirectional.circular(15.r),
                            color: AppColors.whiteColor,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.mainColor.withOpacity(0.5),
                                spreadRadius: 0.5,
                                blurRadius: 1,
                                offset: const Offset(0.5, 0.5),
                              ),
                            ],
                          ),
                          padding: EdgeInsetsDirectional.only(
                              start: 30.w,
                              end: 30.w,
                              top: 25.h,
                              bottom: controller.expandedContainer[1] == true
                                  ? 27.h
                                  : 0),
                          child: ListView(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    controller.expandedContainer[1] =
                                    !controller.expandedContainer[1];
                                  },
                                  child: const CustomRowInfo(
                                    isEdit: true,
                                    index: 1,
                                    title: 'Edit Car Info',
                                  )),
                              Divider(
                                color: AppColors.blackColor,
                                height: 10.h,
                                thickness: 0.3,
                              ),
                              (10.h).ph,
                              Visibility(
                                visible: controller.expandedContainer[1],
                                child: ZoomIn(
                                  delay: const Duration(milliseconds: 500),
                                  duration: const Duration(milliseconds: 500),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            const CustomText(
                                              text: 'Car Number:',
                                              textType: TextStyleType.body,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            CustomTextFormField(
                                              keyboardType: TextInputType.text,
                                              widthContainer: 1.sw,
                                              controller: controller.carNumber,
                                              hintText: '',
                                            ),
                                            (20.h).ph,
                                            const CustomText(
                                              text: 'Car Type:',
                                              textType: TextStyleType.body,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            CustomTextFormField(
                                              keyboardType:
                                              TextInputType.emailAddress,
                                              widthContainer: 1.sw,
                                              controller: controller.carType,
                                              hintText: '',
                                            ),
                                            (20.h).ph,
                                            const CustomText(
                                              text: 'Car Model:',
                                              textType: TextStyleType.body,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            CustomTextFormField(
                                              keyboardType:
                                              TextInputType.emailAddress,
                                              widthContainer: 1.sw,
                                              controller: controller.carModel,
                                              hintText: '',
                                            ),
                                          ]),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    (20.h).ph,
                    ZoomIn(
                      delay: const Duration(milliseconds: 300),
                      duration: const Duration(milliseconds: 500),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Center(
                          child: SizedBox(
                              height: 50.h,
                              child: CustomButton(
                                  onPressed: () {
                                    controller.editProfile();
                                  },
                                  text: 'Submit',
                                  buttonTypeEnum: ButtonTypeEnum.big)),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
