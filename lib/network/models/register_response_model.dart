class RegisterResponse {
  String message;
  bool status;
  String token;

  RegisterResponse({this.message, this.status});

  RegisterResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    data['token'] = this.token;
    return data;
  }
}
