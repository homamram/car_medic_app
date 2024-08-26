import 'package:car_medic/core/data/models/api/parking_model.dart';
import 'package:car_medic/core/data/models/api/problem_model.dart';
import 'package:car_medic/core/enums/message_type.dart';
import 'package:car_medic/core/services/base_controller.dart';
import 'package:car_medic/ui/admin_view/admin_dashboard/admin_dashboard_controller.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/data/repositories/admin_repositories.dart';

class AllOrderController extends BaseController {
  RxString birthDay = 'no date'.obs;
  TextEditingController priceController = TextEditingController();
  AdminDashboardController adminDashboardController = Get.find();
  int index = 1;
  List<ProblemHistoryModel>? problemHistory;

  handleClickFilter({required int serviceIndex}) {
    index = serviceIndex;
    update();
  }

  RxInt currentIndexON = (-1).obs;
  RxBool showText = false.obs;

  selectDate() async {
    final selectedDate = await showDatePicker(
      onDatePickerModeChange: (DatePickerEntryMode value) {
        Navigator.of(Get.context!).pop(value);
      },
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(
        days: 2,
      )),
    );
    if (selectedDate != null) {
      birthDay.value = selectedDate.toString().substring(0, 10);
    }
    update();
  }

  void clickToShow(int index) {
    if (index == currentIndexON.value) {
      currentIndexON.value = -1;
      showText.value = false;
    } else {
      currentIndexON.value = index;
      showText.value = true;
    }
  }

  bool checkExpandedContainer(int index) {
    if (currentIndexON.value == index && showText.value == true) {
      return true;
    } else {
      return false;
    }
  }

  // Future<void> getHistoryProblems() async {
  //   await runLoadingFutureFunction(
  //       function: AdminRepositories().getHistoryProblem().then((value) {
  //     value.fold((l) {
  //       CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
  //     }, (r) {
  //       problemHistory = r;
  //       for (int i = 0; i < problemHistory!.length; i++) {
  //         problemHistory![i].createdAt =
  //             problemHistory![i].createdAt!.substring(0, 10);
  //       }
  //       update();
  //     });
  //   }));
  // }

  Future<void> updateOrderProblem(
      {required int price, required String orderId}) async {
    await runLoadingFutureFunction(
        function: AdminRepositories()
            .updateOrderProblem(
                orderId: orderId, price: price, date: birthDay.value)
            .then((value) {
      value.fold((l) {
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
      }, (r) {
        CustomToast.showMessage(message: r, messageType: MessageType.SUCCESS);
        adminDashboardController.getHistoryProblems();
        problemHistory = adminDashboardController.problemHistory;
        update();
      });
    }));
  }

  Future<void> deleteOrderProblem({required String orderId}) async {
    await runLoadingFutureFunction(
        function: AdminRepositories()
            .DeletOrderProblem(orderId: orderId)
            .then((value) {
      value.fold((l) {
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
      }, (r) {
        CustomToast.showMessage(message: r, messageType: MessageType.SUCCESS);
        adminDashboardController.getHistoryProblems();
        problemHistory = adminDashboardController.problemHistory;
        update();
      });
    }));
  }

  @override
  Future<void> onInit() async {
    problemHistory = adminDashboardController.problemHistory;
    update();
    super.onInit();
  }
}
