import 'package:car_medic/core/data/repositories/user_repositories.dart';
import 'package:car_medic/core/translation/app_translation.dart';
import 'package:car_medic/ui/shared/colors.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_text.dart';
import 'package:car_medic/ui/shared/extension_sizebox.dart';
import 'package:car_medic/ui/views/home/home_view/home_widget/dialog_order_qr.dart';
import 'package:car_medic/ui/views/home/home_view/qr_order_detailes/qr_order_detailes_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:car_medic/core/data/repositories/park_repositories.dart';
import 'package:car_medic/core/enums/message_type.dart';
import 'package:car_medic/core/services/base_controller.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_toast.dart';
import '../../../../core/data/models/api/parking_model.dart';

class HomeViewController extends BaseController {
  ParkingTimer? parkingTimer;
  late int price;
  late CarouselController buttonCarouselController = CarouselController();

  RxInt numberHoursPark = 1.obs;
  int selectIndex = 0;
  late String qrParkChoose;
  late List qrParkDetails;
  late int checkPrice;
  late int hour;
  RxString time = ''.obs;

  selectTime() async {
    final now = DateTime.now();
    final selectedTime = await showTimePicker(
      context: Get.context!,
      initialTime: TimeOfDay.fromDateTime(now),
      helpText: tr('Select Time'),
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(),
          child: child!,
        );
      },
    );

    if (selectedTime != null) {
      hour = selectedTime.hourOfPeriod;
      final minute = selectedTime.minute;
      final period = selectedTime.period == DayPeriod.am ? 'AM' : 'PM';

      time.value = '$hour:$minute $period';
    }
    update();
  }

  late parkingorderdetails parkorderDetails;

  @override
  void onInit() async {
    await getParkingTimer();
    super.onInit();
  }

  final List<List<String>> qaution = [
    [
      'how are you today  skaljdlk asjs sldk ;asd?',
      'I am good what about you and i play football'
    ],
    [
      'how are you todayd salkd as;lk das sds  sdasdas as ?',
      'I am good what about you and i play football'
    ],
    [
      'how are you today saskad skdjskd ?',
      'I am good what about you and i play ldsak;d; ljaslkj kldasjlk jaskljd klasjkld jaslkjdkl jaskldjk ljaslkdj sa football'
    ],
  ];

  changePrice({required bool dec}) {
    if (dec) {
      if (numberHoursPark < 24) {
        numberHoursPark += 1;
        checkPrice += price;
      }
    } else {
      if (numberHoursPark > 1) {
        numberHoursPark -= 1;
        checkPrice -= price;
      }
    }
    update();
  }

  Future<void> getParkingTimer() async {
    await ParkRepository().parkingtimer().then((value) {
      value.fold((l) {
        parkingTimer = ParkingTimer(seconds: 00, hours: 00, minutes: 00);
        update();
        // CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
      }, (r) {
        parkingTimer = r;
        update();
      });
    });
  }

  Future<void> expandTime() async {
    await runFullLoadingFutureFunction(
        function: ParkRepository()
            .expandtime(duration: numberHoursPark.value)
            .then((value) {
      value.fold((l) {
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
      }, (r) {
        CustomToast.showMessage(message: r, messageType: MessageType.SUCCESS);
        getParkingTimer();
      });
    }));
  }

  Future<void> chooseQRPark() async {
    await runFullLoadingFutureFunction(
        function:
            ParkRepository().chooseQRPark(parkName: qrParkChoose).then((value) {
      value.fold((l) {
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
      }, (r) {
        qrParkDetails = r;
        checkPrice = qrParkDetails[2];
        price = qrParkDetails[2];
        update();
        numberHoursPark = 1.obs;

        showDialogOrderQRPark();
      });
    }));
  }

  Future<void> getProSub() async {
    await runFullLoadingFutureFunction(
        function: UserRepository().GetPro().then((value) {
      value.fold((l) {
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
      }, (r) {
        CustomToast.showMessage(message: r, messageType: MessageType.SUCCESS);
      });
    }));
  }

  showDialogExpandTime() {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.whiteColor,
          content:
              Text(tr('Are you sure you want to expand your parking time')),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    changePrice(dec: false);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.mainColor,
                      ),
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    width: 40.w,
                    height: 40.w,
                    child: const CustomText(
                      isTextAlign: TextAlign.center,
                      textType: TextStyleType.bodyBig,
                      text: '-',
                    ),
                  ),
                ),
                Obx(() => Container(
                      alignment: Alignment.center,
                      width: 40.w,
                      height: 40.w,
                      child: CustomText(
                        isTextAlign: TextAlign.center,
                        textType: TextStyleType.bodyBig,
                        text: numberHoursPark.value.toString(),
                      ),
                    )),
                InkWell(
                  onTap: () {
                    changePrice(dec: true);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.mainColor,
                      ),
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    width: 40.w,
                    height: 40.w,
                    child: const CustomText(
                      isTextAlign: TextAlign.center,
                      textType: TextStyleType.bodyBig,
                      text: '+',
                    ),
                  ),
                ),
              ],
            ),
            (20.h).ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(tr('Cancel')),
                ),
                TextButton(
                  onPressed: () {
                    expandTime();

                    Get.back();
                  },
                  child: Text(tr('Ok')),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  bool focusColorSlider(int index) {
    if (selectIndex == index) {
      return true;
    } else {
      return false;
    }
  }

  onPageChanged1(int index, _) {
    selectIndex = index;
    update();
  }

  Future<void> chooseTimeSpot({
    required int duration,
    required String date,
    required int Spot,
    required String parkingName,
  }) async {
    await runFullLoadingFutureFunction(
        function: ParkRepository()
            .chooseTimeSpot(
                parkingName: parkingName,
                date: date,
                duration: duration,
                Spot: Spot)
            .then((value) {
      value.fold((l) {
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
      }, (r) {
        parkorderDetails = r;
        getParkingTimer();
        update();
        Get.back();
        Get.to(() => QrParkingOrderDetiels());

        CustomToast.showMessage(
            message: 'لعيون عمك هاشم واقطع', messageType: MessageType.SUCCESS);
        // Get.to(() => ParkSpotView());
      });
    }));
  }

  Future<void> ordercanseling() async {
    ParkRepository().ordercansling().then((value) {
      value.fold((l) {
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);

        getParkingTimer();
      }, (r) {
        CustomToast.showMessage(message: r, messageType: MessageType.SUCCESS);
      });
    });

    Future.delayed(const Duration(seconds: 3), () {
      getParkingTimer();
    });
  }
}
