import 'package:animate_do/animate_do.dart';
import 'package:car_medic/ui/admin_view/all_order_detiels/all_order_controller.dart';
import 'package:car_medic/ui/shared/colors.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_text.dart';
import 'package:car_medic/ui/shared/extension_sizebox.dart';
import 'package:car_medic/ui/admin_view/all_order_detiels/all_order_widget/show_dialog_history.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomAllOrders extends StatelessWidget {
  final List? myItems;
  final int? index;
  final Function() onTap;

  const CustomAllOrders({
    super.key,
    this.myItems,
    this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    AllOrderController controller = Get.find();
    return RefreshIndicator(
      onRefresh: () {
        return controller.onInit();
      },
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: controller.problemHistory!.length,
        itemBuilder: (context, index) => Obx(
          () => SizedBox(
            height: controller.checkExpandedContainer(index) ? 200.h : 130.h,
            child: GestureDetector(
              onTap: () {
                controller.clickToShow(index);
              },
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 350),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.r),
                        ),
                        color: AppColors.whiteColor,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.mainColor,
                            offset: const Offset(0.0, 1.0),
                            blurRadius: 1.0,
                          ),
                        ],
                      ),
                      width: 480.w,
                      height: controller.checkExpandedContainer(index)
                          ? 250.h
                          : 120.h,
                      child: Row(
                          mainAxisAlignment:
                              controller.checkExpandedContainer(index)
                                  ? MainAxisAlignment.center
                                  : MainAxisAlignment.start,
                          children: [
                            Visibility(
                              visible: controller.currentIndexON.value != index,
                              child: Padding(
                                  padding:
                                      EdgeInsetsDirectional.only(start: 10.w),
                                  child: controller.index == 0
                                      ? SvgPicture.asset(
                                          'assets/images/ic_park.svg',
                                          color: AppColors.mainColor,
                                          width: 80.w,
                                        )
                                      : Image.network(controller
                                          .problemHistory![index]
                                          .carProblem!
                                          .image!)),
                            ),
                            if (controller.currentIndexON.value != index)
                              SizedBox(
                                width: 10.w,
                              ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: controller.showText.value &&
                                          controller.currentIndexON.value ==
                                              index
                                      ? 60.h
                                      : 30.h),
                              child: SingleChildScrollView(
                                physics: NeverScrollableScrollPhysics(),
                                child: Column(
                                  crossAxisAlignment:
                                      controller.checkExpandedContainer(index)
                                          ? CrossAxisAlignment.center
                                          : CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    controller.checkExpandedContainer(index)
                                        ? const SizedBox()
                                        : SizedBox(
                                            width: 210.w,
                                            height: 25.h,
                                            child: CustomText(
                                              text: controller
                                                  .problemHistory![index]
                                                  .carProblem!
                                                  .name!,
                                              overflow: TextOverflow.clip,
                                              textType: TextStyleType.bodyBig,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                    if (controller
                                        .checkExpandedContainer(index))
                                      SizedBox(
                                        width: controller
                                                .checkExpandedContainer(index)
                                            ? 320.w
                                            : 280.w,
                                        height: 20.h,
                                        child: CustomText(
                                          textType: TextStyleType.body,
                                          isTextAlign: TextAlign.center,
                                          text: 'Uniform Clothing Store',
                                          overflow: controller
                                                  .checkExpandedContainer(index)
                                              ? null
                                              : TextOverflow.ellipsis,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    CustomText(
                                      topPadding: 5.h,
                                      text: controller
                                          .problemHistory![index].orderPrice
                                          .toString(),
                                      textType: TextStyleType.body,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    (2.h).ph,
                                    controller.checkExpandedContainer(index)
                                        ? const SizedBox()
                                        : Padding(
                                            padding: EdgeInsetsDirectional.only(
                                                start: 196.w),
                                            child: CustomText(
                                              text: controller
                                                  .problemHistory![index]
                                                  .createdAt!,
                                              fontWeight: FontWeight.normal,
                                              textType: TextStyleType.bodyBig,
                                            ),
                                          ),
                                  ],
                                ),
                              ),
                            ),
                          ]),
                    ),
                  ),
                  controller.checkExpandedContainer(index)
                      ? ZoomIn(
                          child: Align(
                              alignment: Alignment.topCenter,
                              child: controller.index == 0
                                  ? SvgPicture.asset(
                                      'assets/images/ic_park.svg',
                                      color: AppColors.mainColor,
                                      width: 80.w,
                                    )
                                  : Image.network(controller
                                      .problemHistory![index]
                                      .carProblem!
                                      .image!)),
                        )
                      : const SizedBox(),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(
                          top: controller.checkExpandedContainer(index)
                              ? 50.h
                              : 30.h,
                          start: 400.w),
                      child: InkWell(
                        onTap: () => showAlertEditRepair(
                            id: controller.problemHistory![index].sId!),
                        child: SizedBox(
                            width: 28.w,
                            height: 28.w,
                            child: SvgPicture.asset(
                              'assets/images/ic_edit.svg',
                              color: AppColors.blackColor,
                            )),
                      ),
                    ),
                  ),
                  if (controller.checkExpandedContainer(index))
                    Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: EdgeInsetsDirectional.only(
                              top: 80.h, start: 50.w, end: 50.w),
                          child: Column(
                            children: [
                              CustomText(
                                text: controller.problemHistory![index]
                                    .carProblem!.problemType!,
                                textType: TextStyleType.bodyBig,
                                fontWeight: FontWeight.bold,
                              ),
                              Divider(
                                color: AppColors.textColor,
                                height: 0.1,
                              ),
                            ],
                          ),
                        ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
