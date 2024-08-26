import 'dart:developer';
import 'package:car_medic/core/data/repositories/user_repositories.dart';
import 'package:car_medic/core/enums/message_type.dart';
import 'package:car_medic/core/services/base_controller.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_toast.dart';
import 'package:car_medic/ui/views/forget_password_view/reset_password_view/reset_password_view.dart';
import 'package:car_medic/ui/views/forget_password_view/verify_view/verify_view.dart';
import 'package:car_medic/ui/views/login_view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgePasswordController extends BaseController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController verifyCodeController = TextEditingController();

  Future<void> forget() async {
    log(emailController.text);
    await runLoadingFutureFunction(
        function: UserRepository()
            .forgetPassword(email: emailController.text)
            .then((value) {
      value.fold((l) {
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
      }, (r) {
        CustomToast.showMessage(
            message: 'the code have been sent',
            messageType: MessageType.SUCCESS);
        Get.to(() => VerifyForgetPassView());
      });
    }));
  }

  Future<void> resetPassVerify() async {
    await runLoadingFutureFunction(
        function: UserRepository()
            .verifyResetPassword(
                code: verifyCodeController.text, email: emailController.text)
            .then((value) {
      value.fold((l) {
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
      }, (r) {
        CustomToast.showMessage(message: r, messageType: MessageType.SUCCESS);
        Get.to(() => ResetPasswordView());
      });
    }));
  }

  Future<void> resetPassword() async {
    await runLoadingFutureFunction(
        function: UserRepository()
            .resetPassword(
                confirmPassword: passwordController.text,
                newPassword: confirmPasswordController.text,
                email: emailController.text)
            .then((value) {
      value.fold((l) {
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
      }, (r) {
        CustomToast.showMessage(message: r, messageType: MessageType.SUCCESS);

        Get.off(() => LoginView());
      });
    }));
  }
}
