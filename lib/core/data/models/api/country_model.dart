// class LocationParkModel {
//   Location? location;
//
//   LocationParkModel({this.location});
//
//   LocationParkModel.fromJson(Map<String, dynamic> json) {
//     location =
//         json['location'] != null ? Location.fromJson(json['location']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (location != null) {
//       data['location'] = location!.toJson();
//     }
//     return data;
//   }
// }
//
// class Location {
//   List<double>? coordinates;
//   String? type;
//   String? parkingName;
//   int? parkingNumber;
//
//   Location({this.coordinates, this.type, this.parkingName, this.parkingNumber});
//
//   Location.fromJson(Map<String, dynamic> json) {
//     coordinates = json['coordinates'].cast<double>();
//     type = json['type'];
//     parkingName = json['parkingName'];
//     parkingNumber = json['parkingNumber'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['coordinates'] = coordinates;
//     data['type'] = type;
//     data['parkingName'] = parkingName;
//     data['parkingNumber'] = parkingNumber;
//     return data;
//   }
// }
