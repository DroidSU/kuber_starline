import 'package:kuber_starline/network/models/wallet_model.dart';

class GetWalletBalanceResponseModel {
  WalletData data;
  String message;
  bool status;

  GetWalletBalanceResponseModel({this.data, this.message, this.status});

  GetWalletBalanceResponseModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new WalletData.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}
