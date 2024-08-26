import 'package:bot_toast/bot_toast.dart';
import 'package:car_medic/core/utils/general_util.dart';
import 'package:location/location.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:car_medic/ui/shared/utils.dart';

class LocationService {
  Location location = Location();

  Future<LocationData?> getUserCurrentLocation({bool hideLoader = true}) async {
    LocationData locationData;

    if (!await isLocationEnabeld()) return null;

    if (!await isPermissionGranted()) return null;

    if (myAppController.isOnline.value) {
      customLoader();
      locationData = await location.getLocation();

      if (hideLoader) BotToast.closeAllLoading();

      return locationData;
    } else {
      showNoConnectionMessage();
    }
    return null;
  }

  Future<geo.Placemark?> getAddressInfo(LocationData locationData,
      {bool showLoader = true}) async {
    if (showLoader) customLoader();

    List<geo.Placemark> placemarks = await geo.placemarkFromCoordinates(
        locationData.latitude ?? 0.0, locationData.longitude ?? 0.0);

    BotToast.closeAllLoading();

    if (placemarks.isNotEmpty) {
      return placemarks[0];
    } else {
      return null;
    }
  }

  Future<geo.Placemark?> getCurrentAddressInfo() async {
    return await getAddressInfo(
        await getUserCurrentLocation(hideLoader: false) ??
            LocationData.fromMap({}),
        showLoader: false);
  }

  Future<bool> isLocationEnabeld() async {
    bool serviceEnabled;
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      // if (!_serviceEnabled) {
      //   if(AppConfig.isLocationRequired){
      //     //!-- Message to show --
      //   }
      //   return false;
      // }
    }
    return serviceEnabled;
  }

  Future<bool> isPermissionGranted() async {
    PermissionStatus permissionGranted;

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        //!-- Message to show --
        return false;
      }
    }

    return permissionGranted == PermissionStatus.granted;
  }
}
