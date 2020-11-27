class GameData {
  int pkUserCreation;
  String gamename;
  String timeSlots;
  String slot2Time1;
  String slot2Time2;

  GameData(
      {this.pkUserCreation,
      this.gamename,
      this.timeSlots,
      this.slot2Time1,
      this.slot2Time2});

  GameData.fromJson(Map<String, dynamic> json) {
    pkUserCreation = json['pk_UserCreation'];
    gamename = json['gamename'];
    timeSlots = json['timeSlots'];
    slot2Time1 = json['slot2Time1'];
    slot2Time2 = json['slot2Time2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pk_UserCreation'] = this.pkUserCreation;
    data['gamename'] = this.gamename;
    data['timeSlots'] = this.timeSlots;
    data['slot2Time1'] = this.slot2Time1;
    data['slot2Time2'] = this.slot2Time2;
    return data;
  }
}
