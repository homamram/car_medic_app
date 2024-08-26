class ChooseParkingModel {
  LocationPark? location;
  String? sId;
  String? parkingName;
  int? parkingNumber;

  ChooseParkingModel(
      {this.location, this.sId, this.parkingName, this.parkingNumber});

  ChooseParkingModel.fromJson(Map<String, dynamic> json) {
    location =
    json['location'] != null ? LocationPark.fromJson(json['location']) : null;
    sId = json['_id'];

    parkingName = json['parkingName'];
    parkingNumber = json['parkingNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (location != null) {
      data['location'] = location!.toJson();
    }
    data['_id'] = sId;

    data['parkingName'] = parkingName;
    data['parkingNumber'] = parkingNumber;
    return data;
  }
}

class LocationPark {
  List<double>? coordinates;
  String? type;
  String? parkingName;
  int? parkingNumber;

  LocationPark({this.coordinates, this.type, this.parkingName, this.parkingNumber});

  LocationPark.fromJson(Map<String, dynamic> json) {
    coordinates = json['coordinates'].cast<double>();
    type = json['type'];
    parkingName = json['parkingName'];
    parkingNumber = json['parkingNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['coordinates'] = coordinates;
    data['type'] = type;
    data['parkingName'] = parkingName;
    data['parkingNumber'] = parkingNumber;
    return data;
  }
}
class ParkingSpot {
  int? parkNumber;
  bool? filled;
  String? carNumber;
  String? bookingEndTime;
  String? sId;

  ParkingSpot(
      {this.parkNumber,
        this.filled,
        this.carNumber,
        this.bookingEndTime,
        this.sId});

  ParkingSpot.fromJson(Map<String, dynamic> json) {
    parkNumber = json['parkNumber'];
    filled = json['filled'];
    carNumber = json['carNumber'];
    bookingEndTime = json['bookingEndTime'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['parkNumber'] = parkNumber;
    data['filled'] = filled;
    data['carNumber'] = carNumber;
    data['bookingEndTime'] = bookingEndTime;
    data['_id'] = sId;
    return data;
  }
}
class parkingorderdetails {
  int? parkNumber;
  String? carNumber;
  String? bookingEndTime;
  int? parksNum;
  String? parkingName;
  int? duration;
  int? price;

  parkingorderdetails(
      {this.parkNumber,
        this.carNumber,
        this.bookingEndTime,
        this.parksNum,
        this.parkingName,
        this.duration,
        this.price});

  parkingorderdetails.fromJson(Map<String, dynamic> json) {
    parkNumber = json['parkNumber'];
    carNumber = json['carNumber'];
    bookingEndTime = json['bookingEndTime'];
    parksNum = json['parksNum'];
    parkingName = json['parkingName'];
    duration = json['duration'];
    price = json['Price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['parkNumber'] = parkNumber;
    data['carNumber'] = carNumber;
    data['bookingEndTime'] = bookingEndTime;
    data['parksNum'] = parksNum;
    data['parkingName'] = parkingName;
    data['duration'] =duration;
    data['Price'] = price;
    return data;
  }
}
class ParkingHistoryModel {
  String? sId;
  UserId? userId;
  SelectedPark? selectedPark;
  int? duration;
  int? price;
  String? createdAt;
  String? updatedAt;
  int? iV;

  ParkingHistoryModel(
      {this.sId,
        this.userId,
        this.selectedPark,
        this.duration,
        this.price,
        this.createdAt,
        this.updatedAt,
        this.iV});

  ParkingHistoryModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId =
    json['userId'] != null ?  UserId.fromJson(json['userId']) : null;
    selectedPark = json['SelectedPark'] != null
        ? new SelectedPark.fromJson(json['SelectedPark'])
        : null;
    duration = json['duration'];
    price = json['Price'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['_id'] = sId;
    if (userId != null) {
      data['userId'] = userId!.toJson();
    }
    if (selectedPark != null) {
      data['SelectedPark'] = selectedPark!.toJson();
    }
    data['duration'] = duration;
    data['Price'] = price;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}

class UserId {
  String? sId;
  String? email;
  String? firstName;
  String? lastName;

  UserId({this.sId, this.email, this.firstName, this.lastName});

  UserId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['email'] = email;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    return data;
  }
}

class SelectedPark {
  Location? location;
  String? sId;

  SelectedPark({this.location, this.sId});

  SelectedPark.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (location != null) {
      data['location'] = location!.toJson();
    }
    data['_id'] = sId;
    return data;
  }
}

class Location {
  String? parkingName;
  int? price;

  Location({this.parkingName, this.price});

  Location.fromJson(Map<String, dynamic> json) {
    parkingName = json['parkingName'];
    price = json['Price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['parkingName'] = parkingName;
    data['Price'] = price;
    return data;
  }
}

class expandtime {
  String? username;
  int? duration;

  expandtime({this.username, this.duration});

  expandtime.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['username'] = username;
    data['duration'] = duration;
    return data;
  }
}
class ParkingTimer {
  int? hours;
  int? minutes;
  int? seconds;

  ParkingTimer({this.hours, this.minutes, this.seconds});

  ParkingTimer.fromJson(Map<String, dynamic> json) {
    hours = json['hours'];
    minutes = json['minutes'];
    seconds = json['seconds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['hours'] = hours;
    data['minutes'] = minutes;
    data['seconds'] = seconds;
    return data;
  }
}
class SocketPark {
  String? sId;
  UserId? userId;
  SelectedPark? selectedPark;
  int? duration;
  int? price;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? orderFinishDate;

  SocketPark(
      {this.sId,
        this.userId,
        this.selectedPark,
        this.duration,
        this.price,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.orderFinishDate});

  SocketPark.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId =
    json['userId'] != null ? new UserId.fromJson(json['userId']) : null;
    selectedPark = json['SelectedPark'] != null
        ? new SelectedPark.fromJson(json['SelectedPark'])
        : null;
    duration = json['duration'];
    price = json['Price'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    orderFinishDate = json['orderFinishDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.userId != null) {
      data['userId'] = this.userId!.toJson();
    }
    if (this.selectedPark != null) {
      data['SelectedPark'] = this.selectedPark!.toJson();
    }
    data['duration'] = this.duration;
    data['Price'] = this.price;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['orderFinishDate'] = this.orderFinishDate;
    return data;
  }
}