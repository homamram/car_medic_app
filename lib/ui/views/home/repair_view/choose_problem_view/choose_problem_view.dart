import 'package:car_medic/ui/shared/colors.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_text.dart';
import 'package:car_medic/ui/views/home/repair_view/reapair_widget/custom_container_problem.dart';
import 'package:car_medic/ui/views/home/repair_view/main_reapair_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ChooseProblemView extends StatelessWidget {
  const ChooseProblemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: GetBuilder<MainRepairController>(
          builder: (controller) {
            return Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 0.2, color: AppColors.mainColor),
                    borderRadius: BorderRadius.all(Radius.circular(20.r))),
                height: 0.6.sh,
                width: 1.sw,
                child: Scrollbar(
                  child: ListView(children: [
                    controller.problems.isEmpty && controller.isLoading
                        ? Padding(
                            padding: EdgeInsets.only(top: 0.25.sh),
                            child: SpinKitCircle(
                              color: AppColors.mainColor,
                              size: 100.w,
                            ),
                          )
                        : controller.problems.isEmpty &&
                                controller.isLoading == false
                            ? Center(
                                child: CustomText(
                                    topPadding: 0.28.sh,
                                    text: 'No Service Exist Now',
                                    textType: TextStyleType.title),
                              )
                            : Padding(
                                padding: EdgeInsets.only(top: 20.w),
                                child: Wrap(
                                  alignment: WrapAlignment.center,
                                  children: List.generate(
                                      controller.problems.length,
                                      (index) => Padding(
                                            padding: EdgeInsetsDirectional.only(
                                                end:
                                                    index == 0 || index % 2 == 0
                                                        ? (index + 1 !=
                                                                controller
                                                                    .problems
                                                                    .length
                                                            ? 40.w
                                                            : 0)
                                                        : 0),
                                            child: CustomContainerProblem(
                                              pathImage: controller
                                                  .problems[index].image!,
                                              onTap: () {
                                                controller.handleClickContainer(
                                                    nameProblem: controller
                                                        .problems[index].name!,
                                                    isProblem: true);
                                              },
                                              nameProblem: controller
                                                  .problems[index].name!,
                                              isClick:
                                                  controller.chooseProblem ==
                                                      controller
                                                          .problems[index].name,
                                            ),
                                          )),
                                ),
                              )
                  ]),
                ));
          },
        ));
  }
}
