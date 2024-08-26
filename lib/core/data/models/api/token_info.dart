class TokenInfo {
  String? accessToken;

  TokenInfo({this.accessToken});

  TokenInfo.fromJson(Map<String, dynamic> json) {
    accessToken = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = accessToken;
    return data;
  }
}
