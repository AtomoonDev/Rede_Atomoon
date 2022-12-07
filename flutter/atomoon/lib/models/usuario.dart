class Usuario {
  bool? authenticated;
  String? expiration;
  String? token;
  String? message;

  Usuario({this.authenticated, this.expiration, this.token, this.message});

  Usuario.fromJson(dynamic json) {
    authenticated = json['authenticated'];
    expiration = json['expiration'];
    token = json['token'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['authenticated'] = authenticated;
    data['expiration'] = expiration;
    data['token'] = token;
    data['message'] = message;
    return data;
  }
}
