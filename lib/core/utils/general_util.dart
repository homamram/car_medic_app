import 'package:car_medic/core/enums/connectivity_status.dart';
import 'package:car_medic/core/enums/type_service.dart';
import 'package:car_medic/core/services/location_services/location_services.dart';
import 'package:car_medic/ui/shared/utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:car_medic/core/data/repositories/hive_repositories.dart';
import 'package:car_medic/core/services/connectivity_service.dart';
import 'package:car_medic/app/my_app_controller.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:socket_io_client/socket_io_client.dart' as socket_io;

HiveRepository get storage => Get.find<HiveRepository>();

ConnectivityService get connectivityService => Get.find<ConnectivityService>();

MyAppController get myAppController => Get.find<MyAppController>();

LocationService get locationService => Get.find<LocationService>();

// LocationService get locationService => Get.find<LocationService>();
double get sizeTextTitle => 30.sp; //30  // title home view

double get sizeTextSupHeader => 27.sp; //25   // profile name

double get sizeTextBodyBig => 22.sp; //20

double get sizeTextBody => 20.sp; //18  //menu

double get defaultSizeSmall => 18.sp; //16

double get defaultPadding => 35.w; //16
// CartServices get cartServices => Get.find<CartServices>();

bool get isOnline =>
    Get.find<MyAppController>().connectivityStatus == ConnectivityStatus.ONLINE;

bool get isOffline =>
    myAppController.connectivityStatus == ConnectivityStatus.OFFLINE;

void checkConnection(Function function) {
  if (isOnline) {
    function();
  } else {
    showNoConnectionMessage();
  }
}

class ServiceItem {
  final TypeServices? typeService;
  final String? name;
  final String? image;
  final String? servicesAvailable;
  final List<String>? services;

  ServiceItem({
    this.typeService,
    this.name,
    this.image,
    this.servicesAvailable,
    this.services,
  });
}

List<ServiceItem> serviceItem = [
  ServiceItem(
    name: "service 1",
    typeService: TypeServices.mechanic,
  ),
  ServiceItem(
    name: "service 2",
    typeService: TypeServices.electric,
  ),
  ServiceItem(
    name: "service 3",
    typeService: TypeServices.all,
  ),
  ServiceItem(
    name: "service 4",
    typeService: TypeServices.mechanic,
  ),
  ServiceItem(
    name: "service 5",
    typeService: TypeServices.electric,
  ),
  ServiceItem(
    name: "service 6",
    typeService: TypeServices.mechanic,
  ),
];
List<LatLng> holesMap = const <LatLng>[
  LatLng(83.703123, -34.314564),
  LatLng(84.111673, 42.135523),
  LatLng(84.136953, 98.001947),
  LatLng(82.853123, 166.262209),
  LatLng(83.972621, -138.522415),
  LatLng(83.261179, -72.576219),
  LatLng(83.586481, -57.760736),
  LatLng(83.703123, -34.314564),
  LatLng(-83.703123, -34.314564),
  LatLng(-83.703123, -34.314564),
  LatLng(-84.111673, 42.135523),
  LatLng(-84.136953, 98.001947),
  LatLng(-82.853123, 166.262209),
  LatLng(-83.972621, -138.522415),
  LatLng(-83.261179, -72.576219),
  LatLng(-83.586481, -57.760736),
  LatLng(-83.703123, -34.314564),
];
List<LatLng> polygonHOMS = const [
  LatLng(34.779027, 36.719289),
  LatLng(34.760384, 36.663986),
  LatLng(34.741861, 36.635257),
  LatLng(34.721158, 36.625088),
  LatLng(34.672778, 36.645628),
  LatLng(34.656600, 36.679696),
  LatLng(34.654221, 36.709614),
  LatLng(34.678690, 36.730561),
  LatLng(34.699996, 36.742665),
  LatLng(34.719133, 36.757399),
  LatLng(34.756260, 36.755292),
];
socket_io.Socket socket = socket = socket_io.io(
  'http://192.168.137.1:5000/',
  <String, dynamic>{
    'transports': ['websocket'],
    'autoConnect': false,
  },
);
