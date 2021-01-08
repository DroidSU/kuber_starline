import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:kuber_starline/constants/project_constants.dart';
import 'package:kuber_starline/customs/custom_game_box.dart';
import 'package:kuber_starline/network/models/game_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SinglePannaGameScreen extends StatefulWidget {
  final GameData gameData;
  final String gameType;
  final String gameTime;

  SinglePannaGameScreen(
      {@required this.gameData,
      @required this.gameType,
      @required this.gameTime});

  @override
  _SinglePannaGameScreenState createState() => _SinglePannaGameScreenState();
}

class _SinglePannaGameScreenState extends State<SinglePannaGameScreen> {
  String walletBalance = "";
  String authToken = "";
  GameData gameData;
  String gameType;
  String gameTime;

  int totalPoints = 0;

  List<int> zeroSeriesNumber = List();
  List<int> oneSeriesNumbers = List();
  List<int> twoSeriesNumbers = List();
  List<int> threeSeriesNumbers = List();
  List<int> fourSeriesNumbers = List();
  List<int> fiveSeriesNumbers = List();
  List<int> sixSeriesNumbers = List();
  List<int> sevenSeriesNumbers = List();
  List<int> eightSeriesNumbers = List();
  List<int> nineSeriesNumbers = List();

  HashMap<int, List> hashMap = HashMap();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gameData = widget.gameData;
    gameType = widget.gameType;
    gameTime = widget.gameTime;

    getUserDetails();

    zeroSeriesNumber = [
      127,
      136,
      145,
      190,
      235,
      280,
      370,
      479,
      460,
      569,
      389,
      578
    ];

    oneSeriesNumbers = [
      128,
      137,
      146,
      236,
      245,
      290,
      380,
      470,
      489,
      560,
      678,
      579
    ];

    twoSeriesNumbers = [
      129,
      138,
      147,
      156,
      237,
      246,
      354,
      390,
      480,
      570,
      679,
      589
    ];

    threeSeriesNumbers = [
      120,
      139,
      148,
      157,
      238,
      247,
      256,
      346,
      490,
      580,
      670,
      689
    ];

    fourSeriesNumbers = [
      130,
      149,
      158,
      167,
      239,
      248,
      257,
      347,
      356,
      590,
      680,
      789
    ];

    fiveSeriesNumbers = [
      159,
      168,
      230,
      249,
      258,
      140,
      267,
      348,
      357,
      456,
      690,
      780
    ];

    sixSeriesNumbers = [
      123,
      150,
      169,
      178,
      240,
      259,
      268,
      349,
      358,
      457,
      367,
      790
    ];

    sevenSeriesNumbers = [
      124,
      160,
      179,
      250,
      269,
      278,
      340,
      359,
      368,
      458,
      467,
      890
    ];

    eightSeriesNumbers = [
      125,
      134,
      170,
      189,
      260,
      279,
      350,
      369,
      378,
      459,
      567,
      468
    ];

    nineSeriesNumbers = [
      126,
      135,
      180,
      234,
      270,
      289,
      360,
      379,
      450,
      469,
      478,
      568
    ];

    if (hashMap.isEmpty) {
      for (int i = 0; i < 10; i++) {
        switch (i) {
          case 0:
            hashMap[i] = zeroSeriesNumber;
            break;
          case 1:
            hashMap[i] = oneSeriesNumbers;
            break;
          case 2:
            hashMap[i] = twoSeriesNumbers;
            break;
          case 3:
            hashMap[i] = threeSeriesNumbers;
            break;
          case 4:
            hashMap[i] = fourSeriesNumbers;
            break;
          case 5:
            hashMap[i] = fiveSeriesNumbers;
            break;
          case 6:
            hashMap[i] = sixSeriesNumbers;
            break;
          case 7:
            hashMap[i] = sevenSeriesNumbers;
            break;
          case 8:
            hashMap[i] = eightSeriesNumbers;
            break;
          case 9:
            hashMap[i] = nineSeriesNumbers;
            break;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xff7c94b6),
                  image: new DecorationImage(
                    image: AssetImage(
                      'images/casino_bg.jpg',
                    ),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.2), BlendMode.dstATop),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(12, 40, 0, 0),
                child: InkWell(
                  child: Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: Colors.white,
                  ),
                  onTap: () {
                    onBackPressed();
                  },
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                  child: Text(
                    gameData.gamename,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  margin: EdgeInsets.fromLTRB(20, 100, 0, 0),
                  child: Text(
                    gameType,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 160, 0, 0),
                  child: Text(
                    'Total Points: ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: EdgeInsets.fromLTRB(130, 160, 0, 0),
                  child: Text(
                    totalPoints.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 90, 10, 0),
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.lock_clock,
                      color: Colors.red,
                    ),
                    label: Text(
                      gameTime,
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 220, 0, 0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomGameBox(
                          seriesName: '0\'s Series',
                          listOfNumbers: zeroSeriesNumber),
                      CustomGameBox(
                          seriesName: '1\'s Series',
                          listOfNumbers: oneSeriesNumbers),
                      CustomGameBox(
                          seriesName: '2\'s Series',
                          listOfNumbers: twoSeriesNumbers),
                      CustomGameBox(
                          seriesName: '3\'s Series',
                          listOfNumbers: threeSeriesNumbers),
                      CustomGameBox(
                          seriesName: '4\'s Series',
                          listOfNumbers: fourSeriesNumbers),
                      CustomGameBox(
                          seriesName: '5\'s Series',
                          listOfNumbers: fiveSeriesNumbers),
                      CustomGameBox(
                          seriesName: '6\'s Series',
                          listOfNumbers: sixSeriesNumbers),
                      CustomGameBox(
                          seriesName: '7\'s Series',
                          listOfNumbers: sevenSeriesNumbers),
                      CustomGameBox(
                          seriesName: '8\'s Series',
                          listOfNumbers: eightSeriesNumbers),
                      CustomGameBox(
                          seriesName: '9\'s Series',
                          listOfNumbers: nineSeriesNumbers),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        onWillPop: onBackPressed);
  }

  Future<bool> onBackPressed() async {
    Navigator.of(context).pop();

    return true;
  }

  void getUserDetails() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    walletBalance =
        sharedPreferences.getString(Constants.SHARED_PREF_WALLET_BALANCE);
    authToken = sharedPreferences.getString(Constants.SHARED_PREF_AUTH_TOKEN);
  }
}
