import 'package:car_medic/ui/admin_view/all_order_detiels/all_order_controller.dart';
import 'package:car_medic/ui/shared/colors.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_button.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_text.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_text_field.dart';
import 'package:car_medic/ui/views/home/history_view/history_widget/alert_dialog_delete_history.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../core/enums/message_type.dart';
import '../../../../../core/translation/app_translation.dart';
import '../../../shared/custom_widget/custom_toast.dart';

showAlertEditRepair({required String id}) {
  AllOrderController controller = Get.find();
  Get.dialog(Dialog(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(35.r))),
    backgroundColor: AppColors.whiteColor,
    insetPadding: const EdgeInsets.only(),
    child: IntrinsicHeight(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(35.r)),
          color: AppColors.whiteColor,
        ),
        width: 460.w,
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 15.h,
              ),
              Row(
                children: [
                  SizedBox(
                      width: 30.w,
                      height: 30.w,
                      child: SvgPicture.asset(
                        'assets/images/ic_edit.svg',
                        color: AppColors.blackColor,
                      )),
                  Padding(
                    padding: EdgeInsetsDirectional.only(top: 5.h, start: 5.w),
                    child: CustomText(
                      textType: TextStyleType.title,
                      fontSize: 22.sp,
                      text: 'Update Or Delete Order Repair',
                      fontWeight: FontWeight.bold,
                      textColor: AppColors.secondColorMain,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    buttonTypeEnum: ButtonTypeEnum.medium,
                    backgroundColor: AppColors.mainColor,
                    onPressed: () {
                      Get.back();
                      showAlertUpdateRepair(id: id);
                    },
                    text: 'Update',
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomButton(
                    buttonTypeEnum: ButtonTypeEnum.medium,
                    backgroundColor: AppColors.whiteColor,
                    borderColor: AppColors.secondColorMain,
                    textColor: AppColors.mainColor,
                    onPressed: () {
                      Get.back();
                      showAlertDelete(
                        text: 'Sure Delete History Info',
                        onTap: () {
                          controller.deleteOrderProblem(orderId: id);
                          controller.adminDashboardController
                              .getHistoryProblems();
                          controller.problemHistory = controller
                              .adminDashboardController.problemHistory;
                          Get.back();
                        },
                      );
                    },
                    text: 'Delete',
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
            ],
          ),
        ),
      ),
    ),
  ));
}

showAlertUpdateRepair({required String id}) {
  AllOrderController controller = Get.find();
  final GlobalKey<FormState> _formKey = GlobalKey();
  Get.dialog(Dialog(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(35.r))),
    backgroundColor: AppColors.whiteColor,
    insetPadding: const EdgeInsets.only(),
    child: Form(
      key: _formKey,
      child: IntrinsicHeight(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(35.r)),
            color: AppColors.whiteColor,
          ),
          width: 460.w,
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SizedBox(
                        width: 30.w,
                        height: 30.w,
                        child: const Icon(Icons.update_sharp)),
                    Padding(
                      padding: EdgeInsetsDirectional.only(start: 5.w),
                      child: CustomText(
                        textType: TextStyleType.title,
                        fontSize: 26.sp,
                        text: 'Update Order Repair',
                        fontWeight: FontWeight.bold,
                        textColor: AppColors.secondColorMain,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                CustomTextFormField(
                    hintText: "new price",
                    controller: controller.priceController,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return tr('should not be empty');
                      }
                      return null;
                    }),
                SizedBox(
                  height: 15.h,
                ),
                Obx(
                  () => InkWell(
                    onTap: () {
                      controller.selectDate();
                    },
                    child: Container(
                      width: 1.sw,
                      height: 50.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border:
                              Border.all(width: 1, color: AppColors.mainColor)),
                      child: Center(
                        child: CustomText(
                          isTextAlign: TextAlign.center,
                          textType: TextStyleType.body,
                          text: controller.birthDay.value,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      buttonTypeEnum: ButtonTypeEnum.small,
                      backgroundColor: AppColors.whiteColor,
                      borderColor: AppColors.secondColorMain,
                      textColor: AppColors.mainColor,
                      onPressed: () {
                        Get.back();
                      },
                      text: 'Cancel',
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    CustomButton(
                      buttonTypeEnum: ButtonTypeEnum.small,
                      backgroundColor: AppColors.mainColor,
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          if (controller.birthDay.value == 'no date') {
                            CustomToast.showMessage(
                                message: "please select date",
                                messageType: MessageType.WARNING);
                          } else {
                            await controller.updateOrderProblem(
                                orderId: id,
                                price:
                                    int.parse(controller.priceController.text));
                            await controller.adminDashboardController
                                .getHistoryProblems();
                            controller.problemHistory = controller
                                .adminDashboardController.problemHistory;
                            Get.back();
                            controller.priceController.clear();
                            controller.birthDay.value = 'no date';
                          }
                        }
                      },
                      text: 'Ok',
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  ));
}
