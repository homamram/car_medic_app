import 'dart:async';
import 'package:car_medic/core/data/models/api/parking_model.dart';
import 'package:car_medic/core/utils/map_util.dart';
import 'package:car_medic/ui/views/home/parking_view/parking_view_controller.dart';
import 'package:car_medic/ui/views/home/repair_view/main_reapair_controller.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:car_medic/core/services/base_controller.dart';

class MapController extends BaseController {
  MapController(this.currentLocation, this.locationPark, this.isPark);

  late ParkingViewController parkingViewController = Get.find();
  late MainRepairController mainRepairController = Get.find();
  late LocationData currentLocation;
  late bool isPark;
  late List<LocationPark> locationPark;
  final Completer<GoogleMapController> controller =
      Completer<GoogleMapController>();
  late CameraPosition currentPosition;
  RxSet<Marker> markers = <Marker>{}.obs;
  late LatLng selectLocation;
  RxString streetName = ''.obs;
  double lat = 34.779027;
  double long = 36.719289;
  static const CameraPosition kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  List<LocationPark> countryList = [];

  @override
  void onInit() async {
    currentPosition = CameraPosition(
      target: LatLng(
          currentLocation.latitude ?? lat, currentLocation.longitude ?? long),
      zoom: 15,
    );
    selectLocation = LatLng(
        currentLocation.latitude ?? lat, currentLocation.longitude ?? long);
    super.onInit();
  }

  void addMarker({
    required LatLng position,
    required String id,
    String? name,
    String? imageName,
    String? imageUrl,
  }) async {
    BitmapDescriptor markerIcon = imageName != null
        ? await MapUtil.getImageFromAsset(imageName: imageName)
        : imageUrl != null
            ? await MapUtil.getImageFromNetwork(imageUrl: imageUrl)
            : BitmapDescriptor.defaultMarker;

    markers.add(Marker(
      infoWindow: InfoWindow(
          title: name,
          onTap: () {
            if (isPark) {
              parkingViewController.selectedPark = name;
              parkingViewController.parkNumber = id;
              parkingViewController.update();
            } else {
              mainRepairController.selectedPlace = name;
              mainRepairController.placeNumber = id;
              mainRepairController.update();
            }
            Get.back();
          }),
      markerId: MarkerId(id),
      position: position,
      icon: markerIcon,
    ));
    update();
  }

// void getStreetName() async {
//   runLoadingFutureFunction(
//       function: locationService
//           .getAddressInfo(
//               showLoader: false,
//               LocationData.fromMap({
//                 'latitude': selecteLocation.latitude,
//                 'longitude': selecteLocation.longitude
//               }))
//           .then((value) {
//     streetName.value = value?.street ?? 'No Info Found';
//     update();
//   }));
// }
}
