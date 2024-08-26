class AdminInfo {
  String? sId;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? role;
  String? username;
  int? iV;

  AdminInfo(
      {this.sId,
        this.firstName,
        this.lastName,
        this.email,
        this.password,
        this.role,
        this.username,
        this.iV});

  AdminInfo.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    password = json['password'];
    role = json['role'];
    username = json['username'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['role'] = this.role;
    data['username'] = this.username;
    data['__v'] = this.iV;
    return data;
  }
}
class AdminParks {
  Location? location;
  String? sId;

  AdminParks({this.location, this.sId});

  AdminParks.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['_id'] = this.sId;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['parkingName'] = this.parkingName;
    data['Price'] = this.price;
    return data;
  }
}


