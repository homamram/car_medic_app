import 'package:car_medic/ui/shared/colors.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_text.dart';
import 'package:car_medic/ui/shared/extension_sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomRowService extends StatelessWidget {
  const CustomRowService({
    super.key,
    required this.item,
  });

  final List<String> item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
      decoration: BoxDecoration(
        border: const Border(
            bottom: BorderSide(color: AppColors.blackColor, width: 0.5),
            top: BorderSide(color: AppColors.blackColor, width: 0.5)),
        color: AppColors.whiteColor,
      ),
      width: 1.sw,
      child: Row(
        children: [
          Container(
              padding: EdgeInsets.all(12.w),
              height: 50.w,
              width: 50.w,
              decoration: BoxDecoration(
                  color: AppColors.grayColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(100.r)),
              child: SvgPicture.asset(item[1],color: AppColors.blackColor,)),
          (10.w).pw,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: item[0],
                textType: TextStyleType.subtitle,
                fontWeight: FontWeight.bold,
              ),
              (10.h).ph,
              const CustomText(
                text: 'daskj kas',
                textType: TextStyleType.bodyBig,
              ),
            ],
          )
        ],
      ),
    );
  }
}
