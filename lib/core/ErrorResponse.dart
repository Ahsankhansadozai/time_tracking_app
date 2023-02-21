class ErrorResponse {
  int? statusCode;
  String? status;
  String? message;
  Errors? errors;
  Info? info;

  ErrorResponse(
      {this.statusCode, this.status, this.message, this.errors, this.info});

  ErrorResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    status = json['status'];
    message = json['message'];
    errors =
        json['errors'] != null ? new Errors.fromJson(json['errors']) : null;
    info = json['info'] != null ? new Info.fromJson(json['info']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.errors != null) {
      data['errors'] = this.errors!.toJson();
    }
    if (this.info != null) {
      data['info'] = this.info!.toJson();
    }
    return data;
  }
}

class Errors {
  String? msisdn;
  String? name;
  String? email;
  String? type;
  String? password;
  String? platform;
  String? address;
  String? sector;
  String? city;
  String? fcmTokenWeb;
  String? fcmTokenAndroid;
  String? fcmTokenIos;

  Errors(
      {this.msisdn,
      this.name,
      this.email,
      this.type,
      this.password,
      this.platform,
      this.address,
      this.sector,
      this.city,
      this.fcmTokenWeb,
      this.fcmTokenAndroid,
      this.fcmTokenIos});

  Errors.fromJson(Map<String, dynamic> json) {
    msisdn = json['msisdn'];
    name = json['name'];
    email = json['email'];
    type = json['type'];
    password = json['password'];
    platform = json['platform'];
    address = json['address'];
    sector = json['sector'];
    city = json['city'];
    fcmTokenWeb = json['fcmTokenWeb'];
    fcmTokenAndroid = json['fcmTokenAndroid'];
    fcmTokenIos = json['fcmTokenIos'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msisdn'] = this.msisdn;
    data['name'] = this.name;
    data['email'] = this.email;
    data['type'] = this.type;
    data['password'] = this.password;
    data['platform'] = this.platform;
    data['address'] = this.address;
    data['sector'] = this.sector;
    data['city'] = this.city;
    data['fcmTokenWeb'] = this.fcmTokenWeb;
    data['fcmTokenAndroid'] = this.fcmTokenAndroid;
    data['fcmTokenIos'] = this.fcmTokenIos;
    return data;
  }
}

class Info {
  String? type;
  String? platform;
  String? msisdn;

  Info({this.type, this.platform, this.msisdn});

  Info.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    platform = json['platform'];
    msisdn = json['msisdn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['platform'] = this.platform;
    data['msisdn'] = this.msisdn;
    return data;
  }
}
