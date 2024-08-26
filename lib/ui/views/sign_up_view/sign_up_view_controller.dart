import 'dart:developer';

import 'package:car_medic/core/data/repositories/user_repositories.dart';
import 'package:car_medic/core/enums/message_type.dart';
import 'package:car_medic/core/services/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shared/custom_widget/custom_toast.dart';
import '../main_view/main_view.dart';

class SignUpViewController extends BaseController {
  RxInt currentIndex = 0.obs;
  List<String> imageSignUp = ['verfiy', 'emailcheck', 'right'];
  List<String> listCarType = [
    'Sedan',
    'SUV (Sports Utility Vehicle)',
    'Coupe',
    'Convertible',
    'Hatchback',
    'Minivan',
    'Pickup Truck',
    'Crossover',
    'Electric Vehicle (EV)',
    'Hybrid Car'
  ];
  RxString carType = ''.obs;
  late String email;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController verifyCodeController = TextEditingController();

  TextEditingController confirmController = TextEditingController();

  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController carNumberController = TextEditingController();

  TextEditingController carModelController = TextEditingController();

  Future<void> register() async {
    await runFullLoadingFutureFunction(
        function: UserRepository()
            .register(
                email: emailController.text,
                password: passwordController.text,
                confirmPassword: confirmController.text,
                carModel: carModelController.text,
                carNumber: carNumberController.text,
                carType: carType.value,
                firstName: firstNameController.text,
                lastName: lastNameController.text)
            .then((value) {
      value.fold((l) {
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
      }, (r) async {
        Get.back();
        email = emailController.text;
        CustomToast.showMessage(message: r, messageType: MessageType.SUCCESS);

        currentIndex.value++;
        // await verify();
        update();
      });
    }));
  }

  Future<void> verify() async {
    await runFullLoadingFutureFunction(
        function:
            UserRepository().verify(email: emailController.text).then((value) {
      value.fold((l) {
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
      }, (r) {
        CustomToast.showMessage(
            message: r,
            messageType: MessageType.SUCCESS);
      });
    }));
  }

  Future<void> sendCode() async {
    log(verifyCodeController.text);
    await runFullLoadingFutureFunction(
        function: UserRepository()
            .sendCode(
                code: verifyCodeController.text, email: emailController.text)
            .then((value) {
      value.fold((l) {
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
      }, (r) {
        CustomToast.showMessage(
            message: r, messageType: MessageType.SUCCESS);
        Get.off(() => MainView(currentIndex: 2,));
      });
    }));
  }
}
