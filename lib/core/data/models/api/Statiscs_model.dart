class StatisticsModel {
  String? name;
  int? total;

  StatisticsModel({this.name, this.total});

  StatisticsModel.fromJson(Map<String, dynamic> json) {
    name = json['name'].toString();
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ParkName'] = name;
    data['totalRevenue'] = total;
    return data;
  }
}
