class UserInfo {
  String? sId;
  String? email;
  String? password;
  String? firstName;
  String? lastName;
  String? username;
  bool? emailVerified;
  String? photo;
  String? role;
  String? expirationCodeTime;
  String? verifyEmailCode;
  String? resetPasswordCode;
  int? money;
  int? paymentAmount;
  bool? pro;
  String? fcmToken;
  String? createdAt;
  String? updatedAt;
  int? iV;
  Car? car;

  UserInfo(
      {this.sId,
        this.email,
        this.password,
        this.firstName,
        this.lastName,
        this.username,
        this.emailVerified,
        this.photo,
        this.role,
        this.expirationCodeTime,
        this.verifyEmailCode,
        this.resetPasswordCode,
        this.money,
        this.paymentAmount,
        this.pro,
        this.fcmToken,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.car});

  UserInfo.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    password = json['password'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    username = json['username'];
    emailVerified = json['emailVerified'];
    photo = json['photo'];
    role = json['role'];
    expirationCodeTime = json['expirationCodeTime'];
    verifyEmailCode = json['verifyEmailCode'];
    resetPasswordCode = json['resetPasswordCode'];
    money = json['money'];
    paymentAmount = json['paymentAmount'];
    pro = json['pro'];
    fcmToken = json['fcmToken'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    car = json['car'] != null ? new Car.fromJson(json['car']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['password'] = this.password;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['username'] = this.username;
    data['emailVerified'] = this.emailVerified;
    data['photo'] = this.photo;
    data['role'] = this.role;
    data['expirationCodeTime'] = this.expirationCodeTime;
    data['verifyEmailCode'] = this.verifyEmailCode;
    data['resetPasswordCode'] = this.resetPasswordCode;
    data['money'] = this.money;
    data['paymentAmount'] = this.paymentAmount;
    data['pro'] = this.pro;
    data['fcmToken'] = this.fcmToken;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    if (this.car != null) {
      data['car'] = this.car!.toJson();
    }
    return data;
  }
}

class Car {
  String? sId;
  String? carModel;
  String? carType;
  String? carNumber;

  Car({this.sId, this.carModel, this.carType, this.carNumber});

  Car.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    carModel = json['carModel'];
    carType = json['carType'];
    carNumber = json['carNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['carModel'] = this.carModel;
    data['carType'] = this.carType;
    data['carNumber'] = this.carNumber;
    return data;
  }
}
