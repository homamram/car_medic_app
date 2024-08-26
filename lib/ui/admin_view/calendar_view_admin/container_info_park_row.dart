import 'package:animate_do/animate_do.dart';
import 'package:car_medic/ui/shared/colors.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_text.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class ContainerRowInfoPark extends StatelessWidget {
  const ContainerRowInfoPark(
      {super.key,
      required this.title1,
      required this.title2,
      required this.body1,
      required this.body2});

  final String title1;
  final String title2;
  final String body1;
  final String body2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 235.w,
              child: Center(
                child: CustomText(
                  text: title1,
                  textType: TextStyleType.bodyBig,
                  textColor: AppColors.mainColor,
                ),
              ),
            ),
            // const Spacer(),
            SizedBox(
              width: 235.w,
              child: Center(
                child: CustomText(
                  // startPadding: 110.w,
                  text: title2,
                  textType: TextStyleType.bodyBig,
                  textColor: AppColors.mainColor,
                ),
              ),
            ),
          ],
        ),
        Container(
          width: 1.sw,
          height: 100.h,
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.mainColor, width: 2)),
          child: ZoomIn(
            duration: const Duration(milliseconds: 300),
            delay:const Duration(milliseconds: 300),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 232.w,
                  child: Center(
                    child: CustomText(
                      text: body1,
                      textType: TextStyleType.bodyBig,
                      textColor: AppColors.blackColor,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                SizedBox(
                  width: 232.w,
                  child: Center(
                    child: CustomText(
                      // startPadding: 140.w,
                      text: body2,
                      textType: TextStyleType.bodyBig,
                      textColor: AppColors.blackColor,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
