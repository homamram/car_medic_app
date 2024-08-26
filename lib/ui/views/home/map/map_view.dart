import 'package:car_medic/core/data/models/api/parking_model.dart';
import 'package:car_medic/core/utils/general_util.dart';
import 'package:car_medic/ui/shared/colors.dart';
import 'package:car_medic/ui/views/home/map/map_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapView extends StatefulWidget {
  final LocationData currentLocation;
  final List<LocationPark> locationPark;
  final bool isPark;

  const MapView(
      {super.key, required this.currentLocation, required this.locationPark, required this.isPark});

  @override
  State<MapView> createState() => MapViewState();
}

class MapViewState extends State<MapView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: MapController(widget.currentLocation, widget.locationPark,widget.isPark),
        builder: (mapController) {
          return SafeArea(
            child: Scaffold(
              body: GoogleMap(
                polygons: {
                  Polygon(
                    polygonId: const PolygonId('myPolygon'),
                    points: polygonHOMS,
                    strokeColor: AppColors.mainColor,
                    strokeWidth: 5,
                    fillColor: Colors.black.withOpacity(0.5),
                    visible: true,
                    geodesic: true,
                    holes: [holesMap],
                  ),
                },
                myLocationButtonEnabled: true,
                myLocationEnabled: true,
                mapType: MapType.normal,
                initialCameraPosition: mapController.currentPosition,
                onMapCreated: (GoogleMapController controller) async {
                  mapController.controller.complete(controller);
                  widget.locationPark.forEach((element) {
                    mapController.addMarker(
                        // imageUrl: 'https://www.fluttercampus.com/img/car.png',
                        position: LatLng(
                            element.coordinates![0], element.coordinates![1]),
                        id: element.parkingNumber.toString(),
                        name: element.parkingName);
                  });
                },
                markers: mapController.markers,
                // onTap: (latLong) {
                //   mapController.selectLocation = latLong;
                //   mapController.addMarker(
                //       imageName: 'assets/images/ic_car.png',
                //       position: LatLng(latLong.latitude, latLong.longitude),
                //       id: 'current');
                // }
              ),
              // floatingActionButton: mapController.requestStatus.value ==
              //         RequestStatus.LOADING
              //     ? const CircularProgressIndicator()
              //     : Align(
              //         alignment: AlignmentDirectional.bottomStart,
              //         child: Padding(
              //           padding:
              //               EdgeInsetsDirectional.only(start: 25.w, bottom: 25.w),
              //           child: FloatingActionButton.extended(
              //             onPressed: _goToTheLake,
              //             label: Text(mapController.streetName.value),
              //             icon: const Icon(Icons.directions_boat),
              //           ),
              //         ),
              //       ),
            ),
          );
        });
  }

// Future<void> _goToTheLake() async {
// final GoogleMapController controller = await _controller.future;
// await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
// }
}
