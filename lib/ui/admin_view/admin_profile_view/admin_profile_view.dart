import 'dart:io';
import 'package:animate_do/animate_do.dart';
import 'package:car_medic/core/translation/app_translation.dart';
import 'package:car_medic/core/utils/general_util.dart';
import 'package:car_medic/ui/admin_view/admin_dashboard/admin_dashboard_widget/custom_appbar_admin.dart';
import 'package:car_medic/ui/admin_view/admin_profile_view/profile_widget/custom_info_admin.dart';
import 'package:car_medic/ui/shared/colors.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_button.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_container.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_text.dart';
import 'package:car_medic/ui/shared/extension_sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../views/home/profile_view/profile_view.dart';
import 'admin_profile_controller.dart';
import 'edit_profile_view/admin_edit_profile_view.dart';

class AdminProfileView extends StatefulWidget {
  const AdminProfileView({super.key});

  @override
  State<AdminProfileView> createState() => _AdminProfileViewState();
}

class _AdminProfileViewState extends State<AdminProfileView> {
  @override
  Widget build(BuildContext context) {
    AdminProfileController controller = Get.put(AdminProfileController());

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBarCustom(
          title: 'Admin Profile',
        ),
        body: ListView(children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    GetBuilder<AdminProfileController>(builder: (c) {
                      return CustomContainer(
                        height: 300.h,
                        child: ZoomIn(
                          duration: const Duration(milliseconds: 800),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Stack(
                                    alignment: AlignmentDirectional.bottomEnd,
                                    children: [
                                      InkWell(
                                        onTap: controller.selectedFile.path ==
                                                ''
                                            ? () {
                                                controller.setShowOPtion(true);
                                              }
                                            : null,
                                        child: CircleAvatar(
                                            backgroundImage:
                                                controller.selectedFile.path ==
                                                        ''
                                                    ? null
                                                    : FileImage(File(controller
                                                        .selectedFile.path)),
                                            radius: 50,
                                            backgroundColor:
                                                AppColors.mainColor,
                                            child:
                                                controller.selectedFile.path ==
                                                        ''
                                                    ? controller.selectedFile
                                                                .path !=
                                                            ''
                                                        ? null
                                                        : Icon(
                                                            Icons.person,
                                                            size: 80.h,
                                                            color: AppColors
                                                                .whiteColor,
                                                          )
                                                    : null),
                                      ),
                                      Visibility(
                                          visible: controller
                                              .selectedFile.path.isNotEmpty,
                                          child: InkWell(
                                            onTap: () {
                                              controller.setShowOPtion(true);
                                            },
                                            child: CircleAvatar(
                                              radius: 15,
                                              backgroundColor:
                                                  AppColors.whiteColor,
                                              child: Icon(
                                                Icons.edit,
                                                color: AppColors.blackColor,
                                                size: 30.h,
                                              ),
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Visibility(
                                  visible: controller.showOptions,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      CustomButton(
                                        buttonTypeEnum: ButtonTypeEnum.small,
                                        text: tr('Gallery'),
                                        onPressed: () {
                                          controller
                                              .pickFile(FileTypeEnum.GALLERY)
                                              .then((value) {
                                            if (value.path != '') {
                                              controller.selectedFile = value;
                                              storage.setGallary(value.path);
                                            }
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                (10.h).ph,
                                CustomText(
                                    fontWeight: FontWeight.bold,
                                    text: '${controller.admin.username}',
                                    textType: TextStyleType.subtitle),
                                (10.h).ph,
                                CustomText(
                                    text:
                                        '${tr('Your iD')} : ${controller.admin.sId}',
                                    fontWeight: FontWeight.normal,
                                    textType: TextStyleType.bodyBig),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                    (20.h).ph,
                    GetBuilder<AdminProfileController>(builder: (c) {
                      return CustomInfoAdmin(
                        onTap: () {
                          controller.expandedContainer[0] = true;
                          controller.expandedContainer[1] = false;
                          Get.to(() => const AdminEditProfileView());
                        },
                        index: 0,
                        title: tr('Personal Info'),
                        textBody: [
                          '${tr('Name')} : ${controller.admin.username}',
                          '${tr('Email')} : ${controller.admin.email} ',
                        ],
                        suffixText: tr('Edit'),
                      );
                    }),
                    (20.h).ph,
                    GetBuilder<AdminProfileController>(builder: (c) {
                      return Column(
                          children: List.generate(
                              controller.adminparks == null
                                  ? 0
                                  : controller.adminparks!.length, (index) {
                        return Column(
                          children: [
                            CustomInfoAdmin(
                              onTap: () {
                                controller.expandedContainer[0] = false;
                                controller.expandedContainer[1] = true;
                                Get.to(() => AdminEditProfileView(
                                      parkname: controller.adminparks![index]
                                          .location!.parkingName,
                                      price: controller
                                          .adminparks![index].location!.price,
                                    ));
                              },
                              index: 1,
                              title: tr('parking Info'),
                              textBody: [
                                '${tr('Parking name')} : ${controller.adminparks![index].location!.parkingName}',
                                '${tr('Price')} :${controller.adminparks![index].location!.price} ',
                              ],
                              suffixText: tr('Edit'),
                            ),
                            (20.h).ph,
                          ],
                        );
                      }));
                    }),
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}

class FileModel {
  FileTypeEnum type;
  String path;

  FileModel(this.path, this.type);
}
