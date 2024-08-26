import 'package:bot_toast/bot_toast.dart';
import 'package:car_medic/app/my_app_controller.dart';
import 'package:car_medic/core/services/connectivity_service.dart';
import 'package:car_medic/core/services/location_services/location_services.dart';
import 'package:car_medic/core/utils/general_util.dart';
import 'package:car_medic/ui/views/splash_screen_view/splash_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:car_medic/core/translation/app_translation.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(540, 960),
      ensureScreenSize: true,
      minTextAdapt: true,
      splitScreenMode: false,
      child: GetMaterialApp(
        defaultTransition: GetPlatform.isAndroid
            ? Transition.leftToRight
            : Transition.cupertino,
        transitionDuration: const Duration(microseconds: 300),
        translations: AppTranslation(),
        builder: BotToastInit(),
        locale: getLocal(),
        navigatorObservers: [BotToastNavigatorObserver()],
        debugShowCheckedModeBanner: false,
        onReady: () async {
          Get.put(ConnectivityService());
          Get.put(MyAppController());

          Get.put(LocationService());
        },
        title: 'Car Services',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreenView(),
      ),
    );
  }
}

Locale getLocal() {
  if (storage.getAppLanguage == 'ar') {
    return const Locale('ar', 'SA');
  } else if (storage.getAppLanguage == 'en') {
    return const Locale('en', 'en');
  } else {
    return const Locale('en', 'US');
  }
}
