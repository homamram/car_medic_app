import 'package:car_medic/ui/shared/colors.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_text.dart';
import 'package:car_medic/ui/shared/extension_sizebox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/translation/app_translation.dart';

class CustomOrderDetielsContiener extends StatelessWidget {
  final String parkNumber;
  final String carNumber;
  final String bookingEndTime;
  final String parksNum;
  final String parkingName;
  final String duration;
  final String price;

  const CustomOrderDetielsContiener(
      {super.key, required this.parkNumber, required this.carNumber, required this.bookingEndTime, required this.parksNum, required this.parkingName, required this.duration, required this.price,
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 0.3.sh,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.mainColor, width: 3.w),
          borderRadius: BorderRadius.all(Radius.circular(20.r))),
      child: Padding(
        padding: EdgeInsetsDirectional.only(start: 10.h, top: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: tr("order details"),
              textType: TextStyleType.body,
              textColor: AppColors.mainColor,
              fontSize: 20.h,
            ),
            (0.02.sh).ph,
            Row(
              children: [
                CustomText(
                  text: tr("parkNumber :"),
                  textType: TextStyleType.body,
                  textColor: AppColors.grayColor,
                  fontSize: 18.h,
                ),
                (0.03.sw).pw,
                CustomText(
                  text: parkNumber,
                  textType: TextStyleType.body,
                  fontSize: 18.h,
                ),
              ],
            ),
            (0.01.sh).ph,
            Row(
              children: [
                CustomText(
                  text: tr("carNumber:"),
                  textType: TextStyleType.body,
                  textColor: AppColors.grayColor,
                  fontSize: 17.h,
                ),
                (0.03.sw).pw,
                CustomText(
                  text: carNumber,
                  textType: TextStyleType.body,
                  fontSize: 18.h,
                ),
              ],
            ),
            (0.01.sh).ph,
            Row(
              children: [
                CustomText(
                  text: tr("bookingEndTime : "),
                  textType: TextStyleType.body,
                  textColor: AppColors.grayColor,
                  fontSize: 16.h,
                  fontWeight: FontWeight.bold,
                ),
                (0.03.sw).pw,
                CustomText(
                  text: bookingEndTime,
                  textType: TextStyleType.body,
                  fontSize: 16.h,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            (0.01.sh).ph,
            Row(
              children: [
                CustomText(
                  text: tr("parkNumber :"),
                  textType: TextStyleType.body,
                  textColor: AppColors.grayColor,
                  fontSize: 18.h,
                ),
                (0.03.sw).pw,
                CustomText(
                  text: parksNum,
                  textType: TextStyleType.body,
                  fontSize: 18.h,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            (0.01.sh).ph,
            Row(
              children: [
                CustomText(
                  text: tr("parkingName: "),
                  textType: TextStyleType.body,
                  textColor: AppColors.grayColor,
                  fontSize: 18.h,
                ),
                (0.03.sw).pw,
                CustomText(
                  text: parkingName,
                  textType: TextStyleType.body,
                  fontSize: 18.h,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            (0.01.sh).ph,
            Row(
              children: [
                CustomText(
                  text: tr("duration: "),
                  textType: TextStyleType.body,
                  textColor: AppColors.grayColor,
                  fontSize: 18.h,
                ),
                (0.03.sw).pw,
                CustomText(
                  text: duration,
                  textType: TextStyleType.body,
                  fontSize: 18.h,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            (0.01.sh).ph,
            Row(
              children: [
                CustomText(
                  text: tr("price: "),
                  textType: TextStyleType.body,
                  textColor: AppColors.grayColor,
                  fontSize: 18.h,
                ),
                (0.03.sw).pw,
                CustomText(
                  text:  price,
                  textType: TextStyleType.body,
                  fontSize: 18.h,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
