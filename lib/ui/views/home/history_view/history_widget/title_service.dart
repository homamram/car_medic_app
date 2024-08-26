import 'package:car_medic/ui/shared/custom_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceTitle extends StatelessWidget {
  final String title;
  final Color selectedContainer;
  final Color titleContainer;
  final Function() onTap;
  final double? width;
  final bool onClick;

  const ServiceTitle({
    super.key,
    required this.title,
    required this.selectedContainer,
    required this.titleContainer,
    required this.onTap,
    this.width,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(23.r),
          ),
          color: selectedContainer,
        ),
        width: width ?? 235.w,
        height: 80.h,
        child: Center(
          child: CustomText(
            text: title,
            textColor: titleContainer,
            textType: TextStyleType.bodyBig,
          ),
        ),
      ),
    );
  }
}
