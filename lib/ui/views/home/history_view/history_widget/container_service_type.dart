import 'package:animate_do/animate_do.dart';
import 'package:car_medic/core/utils/general_util.dart';
import 'package:car_medic/ui/shared/colors.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerServiceType extends StatelessWidget {
  final List<ServiceItem> myItems;
  final String? image;
  final int? index;
  final Function()? onTap;

  const ContainerServiceType({
    super.key,
    required this.myItems,
    this.image,
    this.index,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // HistoryViewController controller = Get.put(HistoryViewController());
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: myItems.length,
      itemBuilder: (context, index) => ZoomIn(
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                // color: Colors.black.withOpacity(0.1),
                color: AppColors.mainColor.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(0, 2),
              ),
            ],
            borderRadius: BorderRadius.all(
              Radius.circular(15.r),
            ),
            color: AppColors.whiteColor,
          ),
          width: 320.w,
          height: 70.h,
          margin: EdgeInsets.symmetric(
            horizontal: 50.w,
            vertical: 10.h,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20.h,
          ),
          child: InkWell(
            onTap: onTap,
            child: Row(
              children: [
                // Image.asset(image == null
                //     ? (controller.favoriteAllList[index].type == 'place'
                //         ? AppImageAsset.places
                //         : AppImageAsset.products)
                //     : image!),
                // SizedBox(
                //   width: 20.w,
                // ),
                CustomText(
                  text: myItems[index].name.toString(),
                  textType: TextStyleType.bodyBig,
                  textColor: AppColors.mainColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
