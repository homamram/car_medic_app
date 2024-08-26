import 'package:car_medic/ui/shared/custom_widget/custom_text.dart';
import 'package:car_medic/ui/shared/extension_sizebox.dart';
import 'package:car_medic/ui/views/home/repair_view/main_reapair_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../shared/custom_widget/custom_order_continer.dart';

// ignore: must_be_immutable
class OrderDetailsView extends StatelessWidget {
   OrderDetailsView({super.key});
  MainRepairController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/done.png"),
        (0.04.sh).ph,
        CustomText(
          text: 'Your Problem Has been Placed Sucessfuly',
          textType: TextStyleType.subtitle,
          fontWeight: FontWeight.bold,
          fontSize: 25.sp,
        ),
        (0.05.sh).ph,
         CustomOrderContainer(
            location:controller.orderDetails.location! ,
            yourProblem: controller.orderDetails.problem! ,
            img: controller.orderDetails.image!,
            price:controller.orderDetails.price!.toString(),
            estimatedTime: controller.orderDetails.estimatedTime!.toString())
      ],
    );
  }
}
