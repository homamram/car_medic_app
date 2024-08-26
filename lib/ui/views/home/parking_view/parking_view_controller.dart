import 'dart:developer';
import 'package:car_medic/core/data/models/api/parking_model.dart';
import 'package:car_medic/core/data/repositories/park_repositories.dart';
import 'package:car_medic/core/enums/message_type.dart';
import 'package:car_medic/core/services/base_controller.dart';
import 'package:car_medic/core/utils/general_util.dart';
import 'package:car_medic/ui/shared/custom_widget/custom_toast.dart';
import 'package:car_medic/ui/views/home/map/map_view.dart';
import 'package:car_medic/ui/views/home/parking_view/park_spot/park_spot_view.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

class ParkingViewController extends BaseController {
  String? selectedPark;
  String? parkNumber;
  late double price;
  List<ParkingSpot> parkingSpot = [];
  LocationData? currentLocation;
  late List<ChooseParkingModel> parkingList;

  Future<void> getClosestPark() async {
    if (currentLocation != null) {
      await runFullLoadingFutureFunction(
          function: ParkRepository()
              .getClosestPark(
        long: currentLocation!.longitude.toString(),
        lat: currentLocation!.latitude.toString(),
      )
              .then((value) {
        value.fold((l) {
          CustomToast.showMessage(
              message: l, messageType: MessageType.REJECTED);
        }, (r) {
          parkingList = r;
          log(parkingList.toString());
          List<LocationPark> locationPark = [];
          parkingList.forEach((value) {
            locationPark.add(value.location!);
          });
          Get.to(() => MapView(
                currentLocation: currentLocation!,
                locationPark: locationPark,isPark: true,
              ));
        });
      }));
    } else {
      currentLocation =
          await locationService.getUserCurrentLocation(hideLoader: true);
      if (currentLocation != null) {
        getClosestPark();
      }
    }
  }

  Future<void> choosePark({required String parkNumber}) async {
    await runFullLoadingFutureFunction(
        function: ParkRepository()
            .choosePark(ParkingNumber: parkNumber)
            .then((value) {
      value.fold((l) {
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
      }, (r) {
        for (dynamic spots in r['park']) {
          parkingSpot.add(ParkingSpot.fromJson(spots));
        }
        price = double.parse(r['location']['Price'].toString());
        log(price.toString());
        Get.to(() => ParkSpotView(
              parkingSpot: parkingSpot,
              selectedPark: selectedPark!,
              price: price,
            ));
      });
    }));
  }
}
