import 'package:animate_do/animate_do.dart';
import 'package:car_medic/ui/admin_view/admin_profile_view/admin_profile_controller.dart';
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

// ignore: must_be_immutable
class AdminEditProfileView extends StatelessWidget {
  final String? parkname;
  final int? price;

  const AdminEditProfileView({super.key, this.parkname, this.price});

  @override
  Widget build(BuildContext context) {
    AdminProfileController controller = Get.find();

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                title: 'Edit Profile',
                onTapBack: () {
                  Get.back();
                },
              ),
              (20.h).ph,
              Padding(
                padding: EdgeInsetsDirectional.only(
                    start: 40.w, bottom: 10.h, top: 10.h),
                child: CustomText(
                  text: 'Edit personal info and park info',
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
                    (20.h).ph,
                    Obx(
                      () => FadeInLeft(
                        delay: const Duration(milliseconds: 200),
                        duration: const Duration(milliseconds: 400),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          width: 1.sw,
                          height: controller.expandedContainer[1] == true
                              ? 365.h
                              : 365.h,
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
                                  : 23.h),
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              // GestureDetector(
                              //     onTap: () {
                              //       controller.expandedContainer[1] =
                              //       !controller.expandedContainer[1];
                              //     },
                              //     child: const CustomRowInfo(
                              //       isEdit: true,
                              //       index: 1,
                              //       title: 'Edit Car Info',
                              //     )),
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
                                              text: 'price',
                                              textType: TextStyleType.body,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            CustomTextFormField(
                                              keyboardType: TextInputType.text,
                                              widthContainer: 1.sw,
                                              controller: controller.newprice,
                                              hintText: '',
                                            ),
                                            (20.h).ph,
                                            const CustomText(
                                              text: 'newParkinNmae',
                                              textType: TextStyleType.body,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            CustomTextFormField(
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                              widthContainer: 1.sw,
                                              controller:
                                                  controller.newParkinNmae,
                                              hintText: '',
                                            ),
                                            (20.h).ph,
                                          ]),
                                    ],
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: controller.expandedContainer[0],
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
                                              text: 'new email',
                                              textType: TextStyleType.body,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            CustomTextFormField(
                                              keyboardType: TextInputType.text,
                                              widthContainer: 1.sw,
                                              controller: controller.email,
                                              hintText: '',
                                            ),
                                            (20.h).ph,
                                            const CustomText(
                                              text: 'new name',
                                              textType: TextStyleType.body,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            CustomTextFormField(
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                              widthContainer: 1.sw,
                                              controller: controller.name,
                                              hintText: '',
                                            ),
                                            (20.h).ph,
                                          ]),
                                    ],
                                  ),
                                ),
                              ),
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
                                    if (controller.expandedContainer[1] ==
                                        true) {
                                      controller.editepark(
                                          ParkingName: parkname.toString(),
                                          Price: price ?? 2500);
                                      controller.getParking();
                                    }
                                    if (controller.expandedContainer[0] ==
                                        true) {
                                      controller.setting();
                                    }
                                    Get.back();
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
