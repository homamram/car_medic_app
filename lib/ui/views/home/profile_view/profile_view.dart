import 'dart:io';
import 'package:animate_do/animate_do.dart';
import 'package:car_medic/core/data/models/api/user_info_model.dart';
import 'package:car_medic/core/translation/app_translation.dart';
import 'package:car_medic/core/utils/general_util.dart';
import 'package:car_medic/ui/shared/colors.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_app_bar.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_container.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_text.dart';
import 'package:car_medic/ui/shared/extension_sizebox.dart';
import 'package:car_medic/ui/views/home/home_view/home_widget/container_subscription.dart';
import 'package:car_medic/ui/views/home/profile_view/profile_widget/custom_info.dart';
import 'package:car_medic/ui/views/home/profile_view/edit_profile_view/edit_profile_view.dart';
import 'package:car_medic/ui/views/home/profile_view/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:social_media_flutter/social_media_flutter.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    ProfileController controller = Get.put(ProfileController());
    UserInfo userInfo = storage.getUserInfo()!;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: Column(children: [
          CustomAppBar(
            title: tr('Setting'),
            onTapBack: () {
              Get.back();
            },
          ),
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: 0.86.sh,
              child: ListView(
                padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
                children: [
                  GetBuilder<ProfileController>(builder: (c) {
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
                                      onTap: () {},
                                      child: CircleAvatar(
                                          backgroundImage:
                                          controller.selectedFile.path == ''
                                              ? null
                                              : FileImage(File(controller
                                              .selectedFile.path)),
                                          radius: 50,
                                          backgroundColor: AppColors.mainColor,
                                          child: controller.selectedFile.path ==
                                              ''
                                              ? controller.selectedFile.path !=
                                              ''
                                              ? null
                                              : Icon(
                                            Icons.person,
                                            size: 80.h,
                                            color:
                                            AppColors.whiteColor,
                                          )
                                              : null),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        controller
                                            .pickFile(FileTypeEnum.GALLERY)
                                            .then((value) {
                                          if (value.path != '') {
                                            controller.selectedFile = value;
                                            storage.setGallary(value.path);
                                          }
                                        });
                                      },
                                      child: CircleAvatar(
                                        radius: 15,
                                        backgroundColor: AppColors.whiteColor,
                                        child: Icon(
                                          Icons.edit,
                                          color: AppColors.blackColor,
                                          size: 22.h,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              (10.h).ph,
                              CustomText(
                                  fontWeight: FontWeight.bold,
                                  text:
                                  '${storage.getUserInfo()!.firstName} ${storage.getUserInfo()!.lastName}',
                                  textType: TextStyleType.subtitle),
                              (5.h).ph,
                              CustomText(
                                  text: storage.getUserInfo()!.sId!.toString(),
                                  fontWeight: FontWeight.normal,
                                  textType: TextStyleType.bodyBig),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                  (20.h).ph,
                  CustomInfo(
                    index: 0,
                    title: tr('Personal Info'),
                    textBody: [
                      '${tr('Name')} : ${userInfo.username}',
                      '${tr('Email')} : ${userInfo.email} ',
                    ],
                    suffixText: tr('Edit'),
                    onTap: () {
                      controller.expandedContainer[0] = true;
                      controller.expandedContainer[1] = false;
                      Get.to(() => const EditProfileView());
                    },
                  ),
                  (20.h).ph,
                  CustomInfo(
                    index: 1,
                    title: tr('Car Info'),
                    textBody: [
                      '${tr('Car Number')} : ${userInfo.car!.carNumber!}',
                      '${tr('Car Type')} : ${userInfo.car!.carType} ',
                      '${tr('Car Model')} : ${userInfo.car!.carModel} ',
                    ],
                    suffixText: tr('Edit'),
                    onTap: () {
                      controller.expandedContainer[0] = false;
                      controller.expandedContainer[1] = true;
                      Get.to(() => const EditProfileView());
                    },
                  ),
                  (20.h).ph,
                  GetBuilder<ProfileController>(builder: (c) {
                    return ContainerSubscription();
                  }),
                  (20.h).ph,
                  CustomInfo(
                    index: 1,
                    title: tr('Contact Information'),
                    textBody: [
                      '${tr('Email')} : car_medic@gmail.com',
                      '${tr('Mobile')} : 0988122888',
                      '${tr('Website')} : www.carService.com',
                    ],
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.expandContainer.value =
                          !controller.expandContainer.value;
                        },
                        child: Obx(
                              () => Center(
                            child: ZoomIn(
                              duration: Duration(milliseconds: 800),
                              child: AnimatedRotation(
                                duration: Duration(milliseconds: 500),
                                turns:
                                controller.expandContainer.value ? 90 : 2,
                                child: Icon(
                                  Icons.call,
                                  color: AppColors.mainColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      (10.h).ph,
                      Obx(() => AnimatedContainer(
                        height: 50.h,
                        onEnd: () {
                          if (controller.expandContainer.value) {
                            controller.showIcons.value = true;
                          } else {
                            controller.showIcons.value = false;
                          }
                        },
                        duration: Duration(milliseconds: 1000),
                        width: controller.expandContainer.value ? 1.sw : 0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(
                              controller.showIcons.value ? 10.r : 0)),
                          color: AppColors.whiteColor,
                          boxShadow: controller.expandContainer.value
                              ? [
                            BoxShadow(
                              color: AppColors.mainColor
                                  .withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: Offset(0.5, 0.5),
                            ),
                          ]
                              : null,
                        ),
                        child: Center(
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            children: [
                              FadeInLeft(
                                animate: controller.showIcons.value &&
                                    controller.expandContainer.value,
                                duration: Duration(milliseconds: 400),
                                delay: Duration(milliseconds: 500),
                                child: GestureDetector(
                                  onTap: () async {
                                    await url_launcher.launchUrl(Uri.parse(
                                        'https://www.facebook.com/profile.php?id=61554822892511&mibextid=vk8aRt'));
                                  },
                                  child: SocialWidget(
                                    placeholderText: '',
                                    iconData: SocialIconsFlutter.facebook,
                                    iconColor: Colors.blue,
                                    link:
                                    'https://www.instagram.com/akshitmadan_/',
                                    placeholderStyle: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  ),
                                ),
                              ),
                              (5.w).pw,
                              FadeInUp(
                                animate: controller.showIcons.value &&
                                    controller.expandContainer.value,
                                duration: Duration(milliseconds: 400),
                                delay: Duration(milliseconds: 900),
                                child: GestureDetector(
                                  onTap: () async {
                                    await url_launcher.launchUrl(Uri.parse(
                                        'https://www.instagram.com/ican.aleppo?igshid=MmVlMjlkMTBhMg'));
                                  },
                                  child: SocialWidget(
                                    placeholderText: '',
                                    iconData: SocialIconsFlutter.instagram,
                                    iconColor: Colors.pink,
                                    link:
                                    'https://www.instagram.com/akshitmadan_/',
                                    placeholderStyle: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  ),
                                ),
                              ),
                              (5.w).pw,
                              FadeInUp(
                                animate: controller.showIcons.value &&
                                    controller.expandContainer.value,
                                duration: Duration(milliseconds: 400),
                                delay: Duration(milliseconds: 1300),
                                child: GestureDetector(
                                  onTap: () async {
                                    await url_launcher.launchUrl(Uri.parse(
                                        'https://www.linkedin.com/company/ican-aleppo/'));
                                  },
                                  child: SocialWidget(
                                    placeholderText: '',
                                    iconData: SocialIconsFlutter.linkedin,
                                    iconColor: Colors.blue,
                                    link:
                                    'https://www.instagram.com/akshitmadan_/',
                                    placeholderStyle: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  ),
                                ),
                              ),
                              (5.w).pw,
                              FadeInRight(
                                animate: controller.showIcons.value &&
                                    controller.expandContainer.value,
                                duration: Duration(milliseconds: 400),
                                delay: Duration(milliseconds: 1700),
                                child: GestureDetector(
                                  onTap: () async {
                                    await url_launcher.launchUrl(Uri.parse(
                                        'https://www.youtube.com/@icanaleppo'));
                                  },
                                  child: SocialWidget(
                                    placeholderText: '',
                                    iconData: SocialIconsFlutter.youtube,
                                    iconColor: Colors.red,
                                    link:
                                    'https://www.instagram.com/akshitmadan_/',
                                    placeholderStyle: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ))
                    ],
                  ),
                  (20.h).ph,
                ],
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

enum FileTypeEnum { CAMERA, GALLERY, FILE }
