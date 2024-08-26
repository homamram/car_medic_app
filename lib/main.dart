import 'package:car_medic/core/data/repositories/hive_repositories.dart';
import 'package:car_medic/core/services/notification_service.dart';
import 'package:car_medic/core/utils/general_util.dart';
import 'package:car_medic/ui/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:car_medic/app/my_app.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService.initializeNotification();

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  Get.put(HiveRepository());
  await storage.init();
  // try {
  //   await Firebase.initializeApp(
  //     options: DefaultFirebaseOptions.currentPlatform,
  //   );
  //   Get.put(NotificationService());
  // } catch (e) {
  //   (e);
  // }
  runApp(const MyApp());
}
