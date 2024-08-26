import 'dart:developer';

import 'package:car_medic/core/data/models/api/parking_model.dart';
import 'package:car_medic/core/data/models/api/problem_model.dart';
import 'package:car_medic/core/data/repositories/problem_repostitories.dart';
import 'package:car_medic/core/enums/message_type.dart';
import 'package:car_medic/core/services/base_controller.dart';
import 'package:car_medic/core/utils/general_util.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_toast.dart';
import 'package:car_medic/ui/views/home/map/map_view.dart';
import 'package:car_medic/ui/views/main_view/main_view.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

class MainRepairController extends BaseController {
  String? selectedLocation;
  String? selectedPlace;
  String? placeNumber;
  int counter = 3;
  int page = 0;
  late List<ChooseParkingModel> placingList;
  late OrderDetailsModel orderDetails;
  List<ProblemModel> problems = [];
  bool isLoading = false;
  List<String> problemsType = ['Mechanical', 'Electric', 'Other'];
  String chooseProblemType = '';
  String chooseProblem = '';
  LocationData? currentLocation;
  List list = [0, 1, 2, 3];

  handleStepValue({required bool isIncrease}) {
    if (isIncrease) {
      if (page < 3) page += 1;
    } else {
      if (page >= 1) page -= 1;
    }
    update();
  }

  handleClickContainer({required String nameProblem, required bool isProblem}) {
    if (isProblem) {
      chooseProblem = nameProblem;
    } else {
      chooseProblemType = nameProblem;
    }
    update();
  }

  handleButtonPress({required bool isIncrease}) {
    switch (page) {
      case 0:
        {
          if (isIncrease && chooseProblemType != '') {
            problemTypeChoose(isIncrease: isIncrease);
          } else if (chooseProblemType == '') {
            CustomToast.showMessage(
                message: 'Please Choose before move',
                messageType: MessageType.WARNING);
          }
        }
        break;
      case 1:
        {
          if (isIncrease && chooseProblem != '') {
            handleStepValue(isIncrease: isIncrease);
          } else {
            CustomToast.showMessage(
                message: 'Please Choose before move',
                messageType: MessageType.WARNING);
          }
        }
        break;
      case 2:
        {
          if (isIncrease && selectedPlace != null) {
            choosePlace(parkNumber: placeNumber!);
          } else {
            CustomToast.showMessage(
                message: 'Please Choose before move',
                messageType: MessageType.WARNING);
          }
        }
        break;
      case 3:
        handleStepValue(isIncrease: false);
        handleStepValue(isIncrease: false);
        handleStepValue(isIncrease: false);
        Get.offAll(MainView(
          currentIndex: 4,
        ));
        break;
    }
    update();
  }

  Future<void> problemTypeChoose({required bool isIncrease}) async {
    isLoading = true;
    update();
    await runLoadingFutureFunction(
        function: ProblemRepositories()
            .chooseProblemType(
      problemType: chooseProblemType,
    )
            .then((value) {
      value.fold((l) {
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
        handleStepValue(isIncrease: false);
        isLoading = false;
      }, (r) {
        chooseProblem = '';
        problems.clear();
        problems.addAll(r);
        handleStepValue(isIncrease: isIncrease);
        isLoading = false;
      });
    }));
    update();
  }

  Future<void> getRepairPlaces() async {
    if (currentLocation != null) {
      await runFullLoadingFutureFunction(
          function: ProblemRepositories()
              .getRepairPlaces(
        userLongitude: currentLocation!.longitude.toString(),
        userLatitude: currentLocation!.latitude.toString(),
      )
              .then((value) {
        value.fold((l) {
          CustomToast.showMessage(
              message: l, messageType: MessageType.REJECTED);
        }, (r) {
          placingList = r;
          log(placingList.toString());
          List<LocationPark> locationPlace = [];
          placingList.forEach((value) {
            locationPlace.add(value.location!);
          });
          Get.to(() => MapView(
                currentLocation: currentLocation!,
                locationPark: locationPlace,
                isPark: false,
              ));
        });
      }));
    } else {
      currentLocation =
          await locationService.getUserCurrentLocation(hideLoader: true);
      if (currentLocation != null) {
        getRepairPlaces();
      }
    }
  }

  Future<void> choosePlace({required String parkNumber}) async {
    isLoading = true;
    update();

    await runFullLoadingFutureFunction(
        function: ProblemRepositories()
            .choosePlace(
      parkNumber: parkNumber,
      problem: chooseProblem,
    )
            .then((value) {
      value.fold((l) {
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
        isLoading = false;
      }, (r) {
        orderDetails = r;
        handleStepValue(isIncrease: true);
        isLoading = false;
      });
    }));
    update();
  }
}
