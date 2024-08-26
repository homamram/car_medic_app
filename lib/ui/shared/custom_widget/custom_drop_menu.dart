import 'package:car_medic/core/translation/app_translation.dart';
import 'package:car_medic/ui/admin_view/admin_profile_view/admin_profile_view.dart';
import 'package:car_medic/ui/shared/colors.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_text.dart';
import 'package:car_medic/ui/shared/extension_sizebox.dart';
import 'package:car_medic/ui/views/sign_up_view/sign_up_view_controller.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CustomDropMenu extends StatelessWidget {
  CustomDropMenu({
    super.key,
    required this.items,
    this.onSaved,
    required this.hint,
    this.validator,
    this.colorBorder,
    this.borderRadTop, this.onChanged,
  });

  final List<String> items;
  final String hint;
  final double? borderRadTop;
  final Color? colorBorder;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChanged;
  final Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      style: TextStyle(color: AppColors.mainColor),
      alignment: Alignment.center,
      decoration: InputDecoration(
        contentPadding: EdgeInsetsDirectional.only(start: 10.w, end: 0.w),
        hintText: hint,
        hintStyle: TextStyle(color: AppColors.grayColor),
        fillColor: AppColors.blackColor.withOpacity(0.02),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(borderRadTop ?? 15.r),
              topRight: Radius.circular(borderRadTop ?? 15.r),
              bottomRight: Radius.circular(15.r),
              bottomLeft: Radius.circular(15.r)),
          borderSide: BorderSide(
              color: colorBorder ?? AppColors.mainColor,
              width: borderRadTop != null ? 0.3 : 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(borderRadTop ?? 15.r),
              topRight: Radius.circular(borderRadTop ?? 15.r),
              bottomRight: Radius.circular(15.r),
              bottomLeft: Radius.circular(15.r)),
          borderSide: BorderSide(
              color: colorBorder ?? AppColors.mainColor,
              width: borderRadTop != null ? 0.3 : 1.0),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(borderRadTop ?? 15.r),
              topRight: Radius.circular(borderRadTop ?? 15.r),
              bottomRight: Radius.circular(15.r),
              bottomLeft: Radius.circular(15.r)),
          borderSide: BorderSide(
              color: colorBorder ?? AppColors.mainColor,
              width: borderRadTop != null ? 0.3 : 1.0),
        ),
      ),
      items: items.map<DropdownMenuItem<String>>((value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                startPadding: 10.w,
                text: value,
                textColor: AppColors.blackColor,
                textType: TextStyleType.body,
                fontWeight: FontWeight.normal,
              ),
              Visibility(
                visible: items.last != value,
                child: const Divider(
                  color: AppColors.blackColor,
                  indent: 10.0,
                  endIndent: 10.0,
                ),
              ),
              if (items.last != value) (2.h).ph,
            ],
          ),
        );
      }).toList(),
      selectedItemBuilder: (BuildContext context) {
        return items.map<Widget>((String value) {
          return SizedBox(
            width: 130.w,
            child: CustomText(
              text: value,
              textType: TextStyleType.body,
              fontWeight: FontWeight.normal,
            ),
          );
        }).toList();
      },
      validator: validator,
      onChanged: onChanged,
      onSaved: onSaved,
      iconStyleData: IconStyleData(
          icon: Icon(
            Icons.arrow_drop_down,
            size: 30.w,
          )),
      dropdownStyleData: DropdownStyleData(
        maxHeight: 200.h,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(15.r),
        ),
      ),
      menuItemStyleData: MenuItemStyleData(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
      ),
    );
  }
}
