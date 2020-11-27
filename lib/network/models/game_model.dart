class GameData {
  int pkUserCreation;
  String gamename;
  String timeSlots;
  String slot2Time1;
  String slot2Time2;
  String result1;
  String result2;

  GameData(
      {this.pkUserCreation,
      this.gamename,
      this.timeSlots,
      this.slot2Time1,
      this.slot2Time2,
      this.result1,
      this.result2});

  GameData.fromJson(Map<String, dynamic> json) {
    pkUserCreation = json['pk_UserCreation'];
    gamename = json['gamename'];
    timeSlots = json['timeSlots'];
    slot2Time1 = json['slot2Time1'];
    slot2Time2 = json['slot2Time2'];
    result1 = json['result1'];
    result2 = json['result2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pk_UserCreation'] = this.pkUserCreation;
    data['gamename'] = this.gamename;
    data['timeSlots'] = this.timeSlots;
    data['slot2Time1'] = this.slot2Time1;
    data['slot2Time2'] = this.slot2Time2;
    data['result1'] = this.result1;
    data['result2'] = this.result2;
    return data;
  }
}
