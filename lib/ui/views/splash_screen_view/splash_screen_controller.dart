import 'dart:developer';

import 'package:car_medic/core/utils/general_util.dart';
import 'package:car_medic/ui/admin_view/admin_profile_view/admin_profile_view.dart';
import 'package:car_medic/ui/views/login_view/login_view.dart';
import 'package:car_medic/ui/views/main_view/main_view.dart';
import 'package:get/get.dart';

import '../../../core/data/repositories/user_repositories.dart';
import '../../../core/enums/message_type.dart';
import '../../admin_view/admin_dashboard/admin_dashboard.dart';
import '../../shared/custom_widget/custom_toast.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    log(storage.getTokenInfo);
    Future.delayed(const Duration(seconds: 5)).then((value) {
      if (storage.getTokenInfo == '') {
        Get.off(() => LoginView());
      } else {
        if (storage.getRole == "user") {
          Get.off(() => MainView(currentIndex: 2,));

        } else if (storage.getRole == "admin") {
          Get.off(() => AdminDashboardView());
        } else {
          Get.off(() => LoginView());
        }
      }
    });
    super.onInit();
  }

  // Future<void> getapplang() async {
  //   await  UserRepository()
  //           .getapplanguges()
  //           .then((value) {
  //         value.fold((l) {
  //           CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
  //         }, (r) async {
  //           CustomToast.showMessage(message: r, messageType: MessageType.REJECTED);
  //
  //           update();
  //         });
  //       });
  // }


}
