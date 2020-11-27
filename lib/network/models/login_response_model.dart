class LoginResponseModel {
  String name;
  String mobile;
  String email;
  String message;
  bool status;
  String token;

  LoginResponseModel(
      {this.name,
      this.mobile,
      this.email,
      this.message,
      this.status,
      this.token});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    mobile = json['mobile'];
    email = json['email'];
    message = json['message'];
    status = json['status'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['message'] = this.message;
    data['status'] = this.status;
    data['token'] = this.token;
    return data;
  }
}
