import 'package:car_medic/core/translation/app_translation.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:car_medic/ui/shared/colors.dart';
import 'package:car_medic/ui/shared/extension_sizebox.dart';
import 'package:car_medic/ui/views/splash_screen_view/splash_screen_controller.dart';

// ignore: must_be_immutable
class SplashScreenView extends StatelessWidget {
  SplashScreenView({super.key});

  SplashScreenController controller = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: Column(
          children: [
            (200.h).ph,
            Image.asset(
              'assets/images/ic_splash.png',
              scale: 4,
            ),
            const Spacer(),
            SpinKitThreeBounce(color: AppColors.mainColor),
            (30.h).ph,
            CustomText(
              startPadding: 20.w,
              endPadding: 20.w,
              text: tr(
                  'Welcome to our Car Services, your one-stop destination for all your automotive needs'),
              textType: TextStyleType.title,
              isTextAlign: TextAlign.center,
              fontWeight: FontWeight.bold,
              textColor: AppColors.mainColor,
            ),
            (130.h).ph,
          ],
        ));
  }
}
