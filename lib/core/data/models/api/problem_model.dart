class ProblemModel {
  String? problemType;
  String? name;
  String? image;
  int? price;
  int? duration;
  String? sId;
  int? iV;

  ProblemModel(
      {this.problemType,
      this.name,
      this.image,
      this.price,
      this.duration,
      this.sId,
      this.iV});

  ProblemModel.fromJson(Map<String, dynamic> json) {
    problemType = json['ProblemType'];
    name = json['Name'];
    image = json['image'];
    price = json['Price'];
    duration = json['duration'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ProblemType'] = problemType;
    data['Name'] = name;
    data['image'] = image;
    data['Price'] = price;
    data['duration'] = duration;
    data['_id'] = sId;
    data['__v'] = iV;
    return data;
  }
}

class OrderDetailsModel {
  String? location;
  String? problem;
  int? estimatedTime;
  int? price;
  String? image;

  OrderDetailsModel(
      {this.location,
      this.problem,
      this.estimatedTime,
      this.price,
      this.image});

  OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    location = json['Location'];
    problem = json['Problem'];
    estimatedTime = json['EstimatedTime'];
    price = json['Price'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Location'] = location;
    data['Problem'] = problem;
    data['EstimatedTime'] = estimatedTime;
    data['Price'] = price;
    data['image'] = image;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
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

  Location({this.parkingName});

  Location.fromJson(Map<String, dynamic> json) {
    parkingName = json['parkingName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['parkingName'] = parkingName;
    return data;
  }
}

class CarProblem {
  String? sId;
  String? problemType;
  String? name;
  String? image;
  int? price;
  int? duration;
  int? iV;

  CarProblem(
      {this.sId,
      this.problemType,
      this.name,
      this.image,
      this.price,
      this.duration,
      this.iV});

  CarProblem.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    problemType = json['ProblemType'];
    name = json['Name'];
    image = json['image'];
    price = json['Price'];
    duration = json['duration'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['ProblemType'] = problemType;
    data['Name'] = name;
    data['image'] = image;
    data['Price'] = price;
    data['duration'] = duration;
    data['__v'] = iV;
    return data;
  }
}

class ProblemHistoryModel {
  String? sId;
  UserId? userId;
  SelectedPark? selectedPark;
  CarProblem? carProblem;
  int? orderPrice;
  String? orderFinishDate;
  String? createdAt;
  String? updatedAt;
  int? iV;

  ProblemHistoryModel(
      {this.sId,
      this.userId,
      this.selectedPark,
      this.orderPrice,
      this.orderFinishDate,
      this.carProblem,
      this.createdAt,
      this.updatedAt,
      this.iV});

  ProblemHistoryModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId =
        json['userId'] != null ? new UserId.fromJson(json['userId']) : null;
    selectedPark = json['SelectedPark'] != null
        ? new SelectedPark.fromJson(json['SelectedPark'])
        : null;
    carProblem = json['carProblem'] != null
        ? new CarProblem.fromJson(json['carProblem'])
        : null;
    orderPrice = json['orderPrice'];
    orderFinishDate = json['orderFinishDate'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
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
    if (this.carProblem != null) {
      data['carProblem'] = this.carProblem!.toJson();
    }
    data['createdAt'] = this.createdAt;
    data['orderFinishDate'] = this.orderFinishDate;
    data['orderPrice'] = this.orderPrice;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
