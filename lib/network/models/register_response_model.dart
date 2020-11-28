class RegisterResponse {
  String message;
  bool status;
  String token;
  String password;

  RegisterResponse({this.message, this.status, this.token, this.password});

  RegisterResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    token = json['token'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    data['token'] = this.token;
    data['Password'] = this.password;
    return data;
  }
}
