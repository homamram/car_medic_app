import 'package:car_medic/core/utils/general_util.dart';
import 'package:car_medic/ui/shared/colors.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_text.dart';
import 'package:car_medic/ui/shared/extension_sizebox.dart';
import 'package:car_medic/ui/views/home/profile_view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key,
    required this.title,
    this.existContainer,
    this.existBack,
    this.positionedTop,
    this.positionedLeft,
    this.positionedRight,
    this.positionedBottom,
    this.onTapBack,
    this.iconSetting,
    this.onTapList,
    this.existBorderRadius,
    this.titleColor,
    this.backgroundColor,
    this.height,
    this.existAppBarThemeColored,
    this.borderRadius});

  final String title;
  final bool? existContainer;
  final bool? existBack;
  final bool? existAppBarThemeColored;
  final double? positionedTop;
  final double? positionedLeft;
  final double? positionedRight;
  final double? positionedBottom;
  final double? height;
  final bool? iconSetting;
  final bool? borderRadius;
  final Function()? onTapBack;
  final Function()? onTapList;
  final Color? titleColor;
  final Color? backgroundColor;
  final bool? existBorderRadius;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        AnimatedOpacity(
          duration: const Duration(milliseconds: 350),
          opacity: 1,
          child: Container(
            width: double.infinity,
            height: 70.h,
            decoration: BoxDecoration(
                color: backgroundColor ?? AppColors.mainColor,
                borderRadius: borderRadius ?? true
                    ? BorderRadius.only(
                    bottomLeft: Radius.circular(25.r),
                    bottomRight: Radius.circular(25.r))
                    : null),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20.h),
          child: Row(
            children: [
              if (existBack ?? false == true) ...[
                (30.w).pw,
                GestureDetector(
                  onTap: onTapBack ??
                          () {
                        Get.back();
                      },
                  child: SizedBox(
                    height: 20.w,
                    width: 20.w,
                    child: SvgPicture.asset('assets/images/ic_back.svg'),
                  ),
                ),
              ],
              if (existBack == null) ...[
                (30.w).pw,
                Obx(
                      () =>
                      SizedBox(
                        child: Icon(
                          Icons.wifi,
                          color: myAppController.isOnline.value
                              ? AppColors.greenColor
                              : AppColors.grayColor,
                        ),
                      ),
                ),
              ],

              Expanded(
                child: CustomText(
                    startPadding: iconSetting == true ? 60.w : 0,
                    endPadding: existBack == true ? 50.w : 0,
                    isTextAlign: TextAlign.center,
                    textType: TextStyleType.title,
                    fontWeight: FontWeight.bold,
                    text: title,
                    textColor: titleColor ?? AppColors.whiteColor),
              ),
              existBack == null ? (50.w).pw : (0.w).pw,
              Visibility(
                visible: iconSetting ?? false,
                child: InkWell(
                    onTap: () {
                      Get.to(() =>
                       ProfileView());
                    },
                    child: SizedBox(
                        width: 30.w,
                        child:
                        SvgPicture.asset('assets/images/ic_setting.svg'))),
              ),
              iconSetting ?? false ? (30.w).pw : const SizedBox()

              // (66.w).pw,
            ],
          ),
        )
      ],
    );
  }
}
