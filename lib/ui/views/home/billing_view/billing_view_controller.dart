import 'package:car_medic/core/enums/type_cash.dart';
import 'package:car_medic/ui/shared/colors.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_text.dart';
import 'package:car_medic/ui/views/home/billing_view/billing_widget/custom_cash_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BillingViewController extends GetxController {
  late CarouselController buttonCarouselController = CarouselController();
  late TextEditingController number = TextEditingController();
  bool isLoading = false;
  String titleCash = '';
  bool showOTB = false;
  RxList<int> selectedImageIndex = [0, 0, 0].obs;
  final List<List<String>> cash = [
    ['ic_splash'],
    ['syriatel', 'mtn'],
    ['baraka', 'bemo']
  ];

  onPageChanged1(int index, _) {
    selectedImageIndex[1] = index;
  }

  onPageChanged2(int index, _) {
    selectedImageIndex[2] = index;
  }

  bool focusColorSlider(int index, int indexContainer) {
    if (selectedImageIndex[indexContainer] == index) {
      return true;
    } else {
      return false;
    }
  }

  handleClickNumber() {
    if (showOTB) {
    } else {
      if (number.text.isEmpty) {
        Get.snackbar(
          '',
          '',
          duration: const Duration(seconds: 2),
          titleText: Center(
            child: CustomText(
              text: 'Please Enter The Number',
              textType: TextStyleType.title,
              fontWeight: FontWeight.bold,
              textColor: titleCash == 'syriatel'
                  ? AppColors.redColorSyriatel
                  : AppColors.mtnYellowColor,
            ),
          ),
          messageText: const Center(
            child: CustomText(
              text: 'please enter the number,then click to send',
              textType: TextStyleType.bodyBig,
              isTextAlign: TextAlign.center,
              textColor: AppColors.mtnBrownColor,
            ),
          ),
          snackPosition: SnackPosition.BOTTOM,
          backgroundGradient: LinearGradient(
            colors: [
              AppColors.colorBorder,
              AppColors.mainColor,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        );
      } else {
        isLoading = true;
        update();
        Future.delayed(const Duration(milliseconds: 800), () {
          isLoading = false;
          showOTB = true;
          update();
        });
      }
    }
  }

  handleClickCash({required String title}) {
    if (title == 'syriatel') {
      titleCash = 'syriatel';
      Get.to(() => const CustomCashView(typeCash: TypeCash.syriatel));
    } else if (title == 'mtn') {
      titleCash = 'mtn';
      Get.to(() => const CustomCashView(typeCash: TypeCash.mtn));
    }
  }

  @override
  void dispose() {
    number.dispose();
    super.dispose();
  }
}
