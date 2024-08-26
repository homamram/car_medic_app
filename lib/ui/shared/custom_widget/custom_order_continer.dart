import 'package:car_medic/ui/shared/colors.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_text.dart';
import 'package:car_medic/ui/shared/extension_sizebox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomOrderContainer extends StatelessWidget {
  final String location;
  final String yourProblem;
  final String img;
  final String price;

  final String estimatedTime;

  const CustomOrderContainer(
      {super.key,
      required this.location,
      required this.yourProblem,
      required this.img,
      required this.price,
      required this.estimatedTime});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.9.sw,
      height: 0.25.sh,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.mainColor, width: 3.w),
          borderRadius: BorderRadius.all(Radius.circular(20.r))),
      child: Padding(
        padding: EdgeInsetsDirectional.only(start: 10.h, top: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "Order Detials",
              textType: TextStyleType.body,
              textColor: AppColors.mainColor,
              fontSize: 20.h,
            ),
            (0.03.sh).ph,
            Row(
              children: [
                CustomText(
                  text: "Location :",
                  textType: TextStyleType.body,
                  textColor: AppColors.grayColor,
                  fontSize: 18.h,
                ),
                (0.03.sw).pw,
                CustomText(
                  text: location,
                  textType: TextStyleType.body,
                  fontSize: 18.h,
                ),
              ],
            ),
            (0.02.sh).ph,
            Row(
              children: [
                CustomText(
                  text: "Your Problem :",
                  textType: TextStyleType.body,
                  textColor: AppColors.grayColor,
                  fontSize: 17.h,
                ),
                (0.03.sw).pw,
                CustomText(
                  text: yourProblem,
                  textType: TextStyleType.body,
                  fontSize: 18.h,
                ),
                (0.04.sw).pw,
                Image.network(img)
              ],
            ),
            (0.02.sh).ph,
            Row(
              children: [
                CustomText(
                  text: "Appointment Time : ",
                  textType: TextStyleType.body,
                  textColor: AppColors.grayColor,
                  fontSize: 18.h,
                  fontWeight: FontWeight.bold,
                ),
                (0.03.sw).pw,
                CustomText(
                  text: price,
                  textType: TextStyleType.body,
                  fontSize: 18.h,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            (0.02.sh).ph,
            Row(
              children: [
                CustomText(
                  text: "Estimated Time : ",
                  textType: TextStyleType.body,
                  textColor: AppColors.grayColor,
                  fontSize: 18.h,
                ),
                (0.03.sw).pw,
                CustomText(
                  text: estimatedTime,
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
