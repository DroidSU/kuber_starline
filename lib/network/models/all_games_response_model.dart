import 'game_model.dart';

class AllGamesResponseModel {
  List<GameData> data;
  String message;
  bool status;

  AllGamesResponseModel({this.data, this.message, this.status});

  AllGamesResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<GameData>();
      json['data'].forEach((v) {
        data.add(new GameData.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}
