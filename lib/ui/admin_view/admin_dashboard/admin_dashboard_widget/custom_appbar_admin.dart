import 'package:car_medic/ui/admin_view/admin_profile_view/admin_profile_view.dart';
import 'package:car_medic/ui/shared/colors.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  AppBarCustom({
    this.isBack,
    super.key,
    required this.title,
    this.isDash,
    this.textType,
    this.existIconMenu,
  });

  final String title;
  final bool? existIconMenu;
  final bool? isDash;
  final RxBool? isBack;
  final TextStyleType? textType;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.mainColor,
      centerTitle: true,
      title: CustomText(
        maxLines: 2,
        text: title,
        textType: textType ?? TextStyleType.title,
        textColor: AppColors.whiteColor,
      ),
      leading: isDash ?? false
          ? GestureDetector(
              onTap: () {
                Get.to(() => const AdminProfileView());
              },
              child: Icon(
                Icons.person,
                size: 40.w,
                color: AppColors.whiteColor,
              ),
            )
          : GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.arrow_back_ios_outlined,
                size: 30.w,
                color: AppColors.whiteColor,
              ),
            ),
    );
  }

  @override
  @override
  Size get preferredSize => Size(Get.width, 75.h);
}
