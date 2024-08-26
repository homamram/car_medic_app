import 'package:car_medic/ui/shared/custom_widget/custom_text.dart';
import 'package:car_medic/ui/shared/extension_sizebox.dart';
import 'package:car_medic/ui/views/home/repair_view/reapair_widget/custom_container_problem.dart';
import 'package:car_medic/ui/views/home/repair_view/main_reapair_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ChooseProblemTypeView extends StatelessWidget {
  const ChooseProblemTypeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        (30.h).ph,
        const CustomText(
            text: 'Select Your problem Type', textType: TextStyleType.title),
        (70.h).ph,
        GetBuilder<MainRepairController>(builder: (controller) {
          return Wrap(
            alignment: WrapAlignment.center,
            children: List.generate(
                controller.problemsType.length,
                (index) => Padding(
                      padding: EdgeInsetsDirectional.only(
                          end: index == 0 || index % 2 == 0
                              ? (index + 1 != controller.problemsType.length
                                  ? 40.w
                                  : 0)
                              : 0),
                      child: CustomContainerProblem(
                        onTap: () {
                          controller.handleClickContainer(
                              nameProblem: controller.problemsType[index],
                              isProblem: false);
                        },
                        nameProblem: controller.problemsType[index],
                        isClick: controller.chooseProblemType ==
                            controller.problemsType[index],
                      ),
                    )),
          );
        })
      ],
    );
  }
}
